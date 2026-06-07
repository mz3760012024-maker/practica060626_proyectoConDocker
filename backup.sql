--
-- PostgreSQL database dump
--

\restrict X3qomqJg58RRaNhaDb7m3qlGSDFH4YOjOSUSEUbDocq0fYDpayU5WCM5FimSCpa

-- Dumped from database version 13.23
-- Dumped by pg_dump version 13.23

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: tasks; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.tasks (
    id integer NOT NULL,
    description text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.tasks OWNER TO admin;

--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tasks_id_seq OWNER TO admin;

--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.tasks_id_seq OWNED BY public.tasks.id;


--
-- Name: tasks id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.tasks (id, description, created_at) FROM stdin;
1	refuerzo avanzado de docker	2026-06-07 01:33:14.038485
2	cotizar mi "nueva laptop"	2026-06-07 01:33:28.445608
3	agendar cena navidenia	2026-06-07 01:33:41.230466
6	logs	2026-06-07 02:58:12.566532
7	abordar la nueva sesion	2026-06-07 03:10:10.425327
8	planificar las semnas restantes del mes	2026-06-07 03:10:42.143708
\.


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.tasks_id_seq', 8, true);


--
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict X3qomqJg58RRaNhaDb7m3qlGSDFH4YOjOSUSEUbDocq0fYDpayU5WCM5FimSCpa

