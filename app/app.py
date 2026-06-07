import os
import datetime
from flask import Flask, render_template, request, redirect, url_for
import psycopg2
from psycopg2.extras import DictCursor

app = Flask(__name__)

def get_db_connection():
    conn = psycopg2.connect(
        host=os.environ.get('DB_HOST', 'db'),
        database=os.environ.get('DB_NAME', 'tododb'),
        user=os.environ.get('DB_USER', 'postgres'),
        password=os.environ.get('DB_PASSWORD', '')
    )
    return conn

def init_db():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('''
        CREATE TABLE IF NOT EXISTS tasks (
            id SERIAL PRIMARY KEY,
            description TEXT NOT NULL,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )
    ''')
    conn.commit()
    cur.close()
    conn.close()

@app.route('/')
def index():
    conn = get_db_connection()
    cur = conn.cursor(cursor_factory=DictCursor)
    cur.execute('SELECT id, description, created_at FROM tasks ORDER BY created_at DESC')
    tasks = cur.fetchall()
    cur.close()
    conn.close()
    return render_template('index.html', tasks=tasks)

@app.route('/add', methods=['POST'])
def add_task():
    description = request.form['description']
    if description:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('INSERT INTO tasks (description) VALUES (%s)', (description,))
        with open('/app/logs/actividad.log','a') as f:
            f.write(f"{datetime.datetime.now()} - Tarea agregada: {description}\n")
        conn.commit()
        cur.close()
        conn.close()
    return redirect(url_for('index'))

@app.route('/delete/<int:id>')
def delete_task(id):
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('DELETE FROM tasks WHERE id = %s', (id,))
    conn.commit()
    cur.close()
    conn.close()
    return redirect(url_for('index'))

if __name__ == '__main__':
    init_db()
    app.run(host='0.0.0.0', port=5000, debug=True)