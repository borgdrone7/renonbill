--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2 (Debian 13.2-1.pgdg100+1)
-- Dumped by pg_dump version 13.2 (Debian 13.2-1.pgdg100+1)

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
-- Name: cases; Type: TABLE; Schema: public; Owner: renonbill
--

CREATE TABLE public.cases (
    id bigint NOT NULL,
    common_params jsonb NOT NULL,
    project_id bigint NOT NULL,
    current_params jsonb NOT NULL,
    planned_params jsonb NOT NULL
);


ALTER TABLE public.cases OWNER TO renonbill;

--
-- Name: api_case_id_seq; Type: SEQUENCE; Schema: public; Owner: renonbill
--

CREATE SEQUENCE public.api_case_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_case_id_seq OWNER TO renonbill;

--
-- Name: api_case_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: renonbill
--

ALTER SEQUENCE public.api_case_id_seq OWNED BY public.cases.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: renonbill
--

CREATE TABLE public.projects (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    params jsonb NOT NULL,
    user_id integer NOT NULL,
    rating_data jsonb NOT NULL,
    report_data jsonb NOT NULL
);


ALTER TABLE public.projects OWNER TO renonbill;

--
-- Name: api_project_id_seq; Type: SEQUENCE; Schema: public; Owner: renonbill
--

CREATE SEQUENCE public.api_project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_project_id_seq OWNER TO renonbill;

--
-- Name: api_project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: renonbill
--

ALTER SEQUENCE public.api_project_id_seq OWNED BY public.projects.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: renonbill
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO renonbill;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: renonbill
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO renonbill;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: renonbill
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: renonbill
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO renonbill;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: renonbill
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO renonbill;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: renonbill
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: renonbill
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO renonbill;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: renonbill
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO renonbill;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: renonbill
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: renonbill
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO renonbill;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: renonbill
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO renonbill;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: renonbill
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO renonbill;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: renonbill
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: renonbill
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO renonbill;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: renonbill
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: renonbill
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO renonbill;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: renonbill
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO renonbill;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: renonbill
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: bp_cases; Type: TABLE; Schema: public; Owner: renonbill
--

CREATE TABLE public.bp_cases (
    id bigint NOT NULL,
    year integer NOT NULL,
    renovation_count integer NOT NULL,
    government_subsidy integer NOT NULL,
    case_id bigint NOT NULL
);


ALTER TABLE public.bp_cases OWNER TO renonbill;

--
-- Name: bp_cases_id_seq; Type: SEQUENCE; Schema: public; Owner: renonbill
--

CREATE SEQUENCE public.bp_cases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bp_cases_id_seq OWNER TO renonbill;

--
-- Name: bp_cases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: renonbill
--

ALTER SEQUENCE public.bp_cases_id_seq OWNED BY public.bp_cases.id;


--
-- Name: bp_investments; Type: TABLE; Schema: public; Owner: renonbill
--

CREATE TABLE public.bp_investments (
    id bigint NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.bp_investments OWNER TO renonbill;

--
-- Name: bp_investments_id_seq; Type: SEQUENCE; Schema: public; Owner: renonbill
--

CREATE SEQUENCE public.bp_investments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bp_investments_id_seq OWNER TO renonbill;

--
-- Name: bp_investments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: renonbill
--

ALTER SEQUENCE public.bp_investments_id_seq OWNED BY public.bp_investments.id;


--
-- Name: bp_projects; Type: TABLE; Schema: public; Owner: renonbill
--

CREATE TABLE public.bp_projects (
    id bigint NOT NULL,
    year integer NOT NULL,
    value text NOT NULL,
    investment_id bigint NOT NULL,
    project_id bigint NOT NULL
);


ALTER TABLE public.bp_projects OWNER TO renonbill;

--
-- Name: bp_projects_id_seq; Type: SEQUENCE; Schema: public; Owner: renonbill
--

CREATE SEQUENCE public.bp_projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bp_projects_id_seq OWNER TO renonbill;

--
-- Name: bp_projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: renonbill
--

ALTER SEQUENCE public.bp_projects_id_seq OWNED BY public.bp_projects.id;


--
-- Name: constants; Type: TABLE; Schema: public; Owner: renonbill
--

CREATE TABLE public.constants (
    id bigint NOT NULL,
    thermal_data jsonb NOT NULL,
    envelope_windows jsonb NOT NULL,
    heating_dhw jsonb NOT NULL,
    other_thermal_data jsonb NOT NULL,
    variable_costs jsonb NOT NULL,
    default_uncertainty jsonb NOT NULL,
    uncertain_variables jsonb NOT NULL,
    user_id integer NOT NULL,
    file character varying(100) NOT NULL,
    city_climate jsonb NOT NULL,
    file_name character varying(100) NOT NULL
);


ALTER TABLE public.constants OWNER TO renonbill;

--
-- Name: constants_id_seq; Type: SEQUENCE; Schema: public; Owner: renonbill
--

CREATE SEQUENCE public.constants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constants_id_seq OWNER TO renonbill;

--
-- Name: constants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: renonbill
--

ALTER SEQUENCE public.constants_id_seq OWNED BY public.constants.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: renonbill
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO renonbill;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: renonbill
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO renonbill;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: renonbill
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: renonbill
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO renonbill;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: renonbill
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO renonbill;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: renonbill
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: renonbill
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO renonbill;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: renonbill
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO renonbill;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: renonbill
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: renonbill
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO renonbill;

--
-- Name: oc_projects; Type: TABLE; Schema: public; Owner: renonbill
--

CREATE TABLE public.oc_projects (
    id bigint NOT NULL,
    value text NOT NULL,
    investment_id bigint NOT NULL,
    project_id bigint NOT NULL
);


ALTER TABLE public.oc_projects OWNER TO renonbill;

--
-- Name: oc_projects_id_seq; Type: SEQUENCE; Schema: public; Owner: renonbill
--

CREATE SEQUENCE public.oc_projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oc_projects_id_seq OWNER TO renonbill;

--
-- Name: oc_projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: renonbill
--

ALTER SEQUENCE public.oc_projects_id_seq OWNED BY public.oc_projects.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: bp_cases id; Type: DEFAULT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.bp_cases ALTER COLUMN id SET DEFAULT nextval('public.bp_cases_id_seq'::regclass);


--
-- Name: bp_investments id; Type: DEFAULT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.bp_investments ALTER COLUMN id SET DEFAULT nextval('public.bp_investments_id_seq'::regclass);


--
-- Name: bp_projects id; Type: DEFAULT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.bp_projects ALTER COLUMN id SET DEFAULT nextval('public.bp_projects_id_seq'::regclass);


--
-- Name: cases id; Type: DEFAULT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.cases ALTER COLUMN id SET DEFAULT nextval('public.api_case_id_seq'::regclass);


--
-- Name: constants id; Type: DEFAULT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.constants ALTER COLUMN id SET DEFAULT nextval('public.constants_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: oc_projects id; Type: DEFAULT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.oc_projects ALTER COLUMN id SET DEFAULT nextval('public.oc_projects_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.api_project_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: renonbill
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: renonbill
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: renonbill
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add project	7	add_project
26	Can change project	7	change_project
27	Can delete project	7	delete_project
28	Can view project	7	view_project
29	Can add constants	8	add_constants
30	Can change constants	8	change_constants
31	Can delete constants	8	delete_constants
32	Can view constants	8	view_constants
33	Can add case	9	add_case
34	Can change case	9	change_case
35	Can delete case	9	delete_case
36	Can view case	9	view_case
37	Can add bp investment	10	add_bpinvestment
38	Can change bp investment	10	change_bpinvestment
39	Can delete bp investment	10	delete_bpinvestment
40	Can view bp investment	10	view_bpinvestment
41	Can add oc project	11	add_ocproject
42	Can change oc project	11	change_ocproject
43	Can delete oc project	11	delete_ocproject
44	Can view oc project	11	view_ocproject
45	Can add bp project	12	add_bpproject
46	Can change bp project	12	change_bpproject
47	Can delete bp project	12	delete_bpproject
48	Can view bp project	12	view_bpproject
49	Can add bp case	13	add_bpcase
50	Can change bp case	13	change_bpcase
51	Can delete bp case	13	delete_bpcase
52	Can view bp case	13	view_bpcase
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: renonbill
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$260000$GFvE3xkbuCwcPEAP9Q342W$5e1AKQL/libxoCk+LvCLU6BJSrMd6YkqLK7CtfCw530=	\N	t	admin			admin@admin.com	t	t	2021-08-15 12:49:24.752555+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: renonbill
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: renonbill
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: bp_cases; Type: TABLE DATA; Schema: public; Owner: renonbill
--

COPY public.bp_cases (id, year, renovation_count, government_subsidy, case_id) FROM stdin;
94	1	12	10	28
95	2	0	0	28
96	3	0	0	28
97	4	0	0	28
98	5	0	0	28
99	6	0	0	28
\.


--
-- Data for Name: bp_investments; Type: TABLE DATA; Schema: public; Owner: renonbill
--

COPY public.bp_investments (id, name) FROM stdin;
6	% of investment financed by FI
7	FI Financing rate
8	FI Financing duration
9	foo
10	boo
\.


--
-- Data for Name: bp_projects; Type: TABLE DATA; Schema: public; Owner: renonbill
--

COPY public.bp_projects (id, year, value, investment_id, project_id) FROM stdin;
4	1	11	9	12
5	2	0	9	12
6	3	0	9	12
7	4	0	9	12
8	5	0	9	12
9	6	0	9	12
\.


--
-- Data for Name: cases; Type: TABLE DATA; Schema: public; Owner: renonbill
--

COPY public.cases (id, common_params, project_id, current_params, planned_params) FROM stdin;
28	{"city": "Agrigento", "shape": null, "volume": null, "country": "Italy", "churn_rate": 0, "floor_area": 100, "floor_count": 1, "obf1_tenure": 10, "obf2_tenure": 10, "obr1_tenure": 10, "obr2_tenure": 10, "wall_height": 3.8, "building_type": "apartment", "building_year": "<1900", "churn_rate_95": 0, "discount_rate": 8, "dwelling_count": 1, "energy_savings": 0, "obr1_bank_rate": 7, "obr2_bank_rate": 7, "on_bill_scheme": 1, "storey_position": "mid", "obf2_golden_rule": 10, "obr2_golden_rule": 10, "obf1_utility_WACC": 7, "obf2_utility_WACC": 7, "on_bill_component": 0, "default_churn_rate": 0, "obf1_onBill_amount": 50, "obf2_onBill_amount": 50, "obr1_onBill_amount": 50, "obr2_onBill_amount": 50, "obf1_avg_calc_years": 20, "obf2_avg_calc_years": 20, "obr1_avg_calc_years": 20, "obr1_utility_margin": 3, "obr2_avg_calc_years": 20, "obr2_utility_margin": 3, "default_churn_rate_95": 0, "obr1_invest_repayment": 250, "obr2_invest_repayment": 250, "roof_thermal_transmittance": 1.8, "wall_thermal_transmittance": 1.48, "floor_thermal_transmittance": 2.04, "non_energy_benefit_rating_1": 0.5, "non_energy_benefit_rating_2": 0.5, "non_energy_benefit_rating_3": 0.5, "non_energy_benefit_rating_4": 0.5, "non_energy_benefit_rating_5": 0.5, "non_energy_benefit_rating_6": 0.5, "non_energy_benefit_rating_7": 0.5, "non_energy_benefit_weight_1": 1, "non_energy_benefit_weight_2": 1, "non_energy_benefit_weight_3": 1, "non_energy_benefit_weight_4": 1, "non_energy_benefit_weight_5": 1, "non_energy_benefit_weight_6": 1, "non_energy_benefit_weight_7": 1, "thermal_transmittance_check": false, "total_surface_area_to_volume_ratio": 0.35}	12	{"DHW_type": 0, "solar_frac": 0.000001, "solar_perc": 0, "sun_factor": 0.790985546052884, "burner_type": 1, "solar_check": false, "emitter_type": 1, "heating_type": 1, "DHW_solar_frac": 0.000001, "DHW_solar_perc": 0, "roof_thickness": 0.000001, "wall_thickness": 0.000001, "DHW_burner_type": 1, "DHW_solar_check": false, "floor_thickness": 0.000001, "roof_insulation_check": false, "wall_insulation_check": false, "floor_insulation_check": false, "window_transmittance_value": 3, "window_to_surface_area_ratio": 0.1, "roof_envelope_thermal_conductivity": 1000000, "wall_envelope_thermal_conductivity": 1000000, "floor_envelope_thermal_conductivity": 1000000}	{"DHW_type": 0, "solar_frac": 0.000001, "solar_perc": 0, "sun_factor": 0.790985546052884, "burner_type": 1, "solar_check": false, "emitter_type": 1, "heating_type": 2, "DHW_solar_frac": 0.000001, "DHW_solar_perc": 0, "roof_thickness": 0.000001, "wall_thickness": 0.000001, "DHW_burner_type": 1, "DHW_solar_check": false, "floor_thickness": 0.000001, "roof_insulation_check": false, "wall_insulation_check": false, "floor_insulation_check": false, "window_transmittance_value": 3, "window_to_surface_area_ratio": 0.1, "roof_envelope_thermal_conductivity": 1000000, "wall_envelope_thermal_conductivity": 1000000, "floor_envelope_thermal_conductivity": 1000000}
\.


--
-- Data for Name: constants; Type: TABLE DATA; Schema: public; Owner: renonbill
--

COPY public.constants (id, thermal_data, envelope_windows, heating_dhw, other_thermal_data, variable_costs, default_uncertainty, uncertain_variables, user_id, file, city_climate, file_name) FROM stdin;
1	[{"height": 3.8, "country": "Italy", "roof_trans": 1.8, "wall_trans": 1.48, "floor_trans": 2.04, "disp_v_ratio": 0.35, "building_type": "apartment", "building_year": "<1900", "windows_trans": 4.9, "win_floor_ratio": 0.08}, {"height": 3.8, "country": "Italy", "roof_trans": 1.8, "wall_trans": 1.48, "floor_trans": 2.04, "disp_v_ratio": 0.47, "building_type": "apartment", "building_year": "1901-1920", "windows_trans": 4.9, "win_floor_ratio": 0.08}, {"height": 3.5, "country": "Italy", "roof_trans": 1.8, "wall_trans": 1.15, "floor_trans": 1.81, "disp_v_ratio": 0.46, "building_type": "apartment", "building_year": "1921-1945", "windows_trans": 4.9, "win_floor_ratio": 0.09}, {"height": 3.2, "country": "Italy", "roof_trans": 1.85, "wall_trans": 1.76, "floor_trans": 1.3, "disp_v_ratio": 0.46, "building_type": "apartment", "building_year": "1946-1960", "windows_trans": 4.9, "win_floor_ratio": 0.1}, {"height": 3, "country": "Italy", "roof_trans": 1.85, "wall_trans": 1.76, "floor_trans": 1.3, "disp_v_ratio": 0.46, "building_type": "apartment", "building_year": "1961-1975", "windows_trans": 5.7, "win_floor_ratio": 0.1}, {"height": 2.7, "country": "Italy", "roof_trans": 1.01, "wall_trans": 0.8, "floor_trans": 0.98, "disp_v_ratio": 0.37, "building_type": "apartment", "building_year": "1976-1990", "windows_trans": 3.7, "win_floor_ratio": 0.1}, {"height": 3, "country": "Italy", "roof_trans": 0.7, "wall_trans": 0.61, "floor_trans": 0.77, "disp_v_ratio": 0.43, "building_type": "apartment", "building_year": "1991-2005", "windows_trans": 3.7, "win_floor_ratio": 0.125}, {"height": 3, "country": "Italy", "roof_trans": 0.3, "wall_trans": 0.34, "floor_trans": 0.33, "disp_v_ratio": 0.4, "building_type": "apartment", "building_year": ">2005", "windows_trans": 2.4, "win_floor_ratio": 0.125}, {"height": 3.8, "country": "Italy", "roof_trans": 1.8, "wall_trans": 1.48, "floor_trans": 2.04, "disp_v_ratio": 0.77, "building_type": "multistorey", "building_year": "<1900", "windows_trans": 4.9, "win_floor_ratio": 0.08}, {"height": 3.8, "country": "Italy", "roof_trans": 1.8, "wall_trans": 1.48, "floor_trans": 2.04, "disp_v_ratio": 0.82, "building_type": "multistorey", "building_year": "1901-1920", "windows_trans": 4.9, "win_floor_ratio": 0.08}, {"height": 3.5, "country": "Italy", "roof_trans": 1.8, "wall_trans": 1.15, "floor_trans": 1.81, "disp_v_ratio": 0.81, "building_type": "multistorey", "building_year": "1921-1945", "windows_trans": 4.9, "win_floor_ratio": 0.09}, {"height": 3.2, "country": "Italy", "roof_trans": 1.85, "wall_trans": 1.76, "floor_trans": 1.3, "disp_v_ratio": 0.75, "building_type": "multistorey", "building_year": "1946-1960", "windows_trans": 4.9, "win_floor_ratio": 0.1}, {"height": 3, "country": "Italy", "roof_trans": 1.85, "wall_trans": 1.76, "floor_trans": 1.3, "disp_v_ratio": 0.73, "building_type": "multistorey", "building_year": "1961-1975", "windows_trans": 5.7, "win_floor_ratio": 0.1}, {"height": 2.7, "country": "Italy", "roof_trans": 1.01, "wall_trans": 0.8, "floor_trans": 0.98, "disp_v_ratio": 0.72, "building_type": "multistorey", "building_year": "1976-1990", "windows_trans": 3.7, "win_floor_ratio": 0.1}, {"height": 3, "country": "Italy", "roof_trans": 0.7, "wall_trans": 0.61, "floor_trans": 0.77, "disp_v_ratio": 0.73, "building_type": "multistorey", "building_year": "1991-2005", "windows_trans": 3.7, "win_floor_ratio": 0.125}, {"height": 3, "country": "Italy", "roof_trans": 0.3, "wall_trans": 0.34, "floor_trans": 0.33, "disp_v_ratio": 0.72, "building_type": "multistorey", "building_year": ">2005", "windows_trans": 2.4, "win_floor_ratio": 0.125}, {"height": 3.8, "country": "Italy", "roof_trans": 1.8, "wall_trans": 1.48, "floor_trans": 2.04, "disp_v_ratio": 0.77, "building_type": "detached house", "building_year": "<1900", "windows_trans": 4.9, "win_floor_ratio": 0.08}, {"height": 3.8, "country": "Italy", "roof_trans": 1.8, "wall_trans": 1.48, "floor_trans": 2.04, "disp_v_ratio": 0.82, "building_type": "detached house", "building_year": "1901-1920", "windows_trans": 4.9, "win_floor_ratio": 0.08}, {"height": 3.5, "country": "Italy", "roof_trans": 1.8, "wall_trans": 1.15, "floor_trans": 1.81, "disp_v_ratio": 0.81, "building_type": "detached house", "building_year": "1921-1945", "windows_trans": 4.9, "win_floor_ratio": 0.09}, {"height": 3.2, "country": "Italy", "roof_trans": 1.85, "wall_trans": 1.76, "floor_trans": 1.3, "disp_v_ratio": 0.75, "building_type": "detached house", "building_year": "1946-1960", "windows_trans": 4.9, "win_floor_ratio": 0.9}, {"height": 3, "country": "Italy", "roof_trans": 1.85, "wall_trans": 1.76, "floor_trans": 1.3, "disp_v_ratio": 0.73, "building_type": "detached house", "building_year": "1961-1975", "windows_trans": 5.7, "win_floor_ratio": 0.9}, {"height": 2.7, "country": "Italy", "roof_trans": 1.01, "wall_trans": 0.8, "floor_trans": 0.98, "disp_v_ratio": 0.72, "building_type": "detached house", "building_year": "1976-1990", "windows_trans": 3.7, "win_floor_ratio": 0.1}, {"height": 3, "country": "Italy", "roof_trans": 0.7, "wall_trans": 0.61, "floor_trans": 0.77, "disp_v_ratio": 0.73, "building_type": "detached house", "building_year": "1991-2005", "windows_trans": 3.7, "win_floor_ratio": 0.125}, {"height": 3, "country": "Italy", "roof_trans": 0.3, "wall_trans": 0.34, "floor_trans": 0.33, "disp_v_ratio": 0.72, "building_type": "detached house", "building_year": ">2005", "windows_trans": 2.4, "win_floor_ratio": 0.125}, {"height": 3.8, "country": "Lithuania", "roof_trans": 1.6, "wall_trans": 1.6, "floor_trans": 1.6, "disp_v_ratio": 0.6, "building_type": "apartment", "building_year": "<1900", "windows_trans": 5, "win_floor_ratio": 0.075}, {"height": 3.8, "country": "Lithuania", "roof_trans": 1.6, "wall_trans": 1.6, "floor_trans": 1.6, "disp_v_ratio": 0.7, "building_type": "apartment", "building_year": "1900-1920", "windows_trans": 5, "win_floor_ratio": 0.08}, {"height": 3.5, "country": "Lithuania", "roof_trans": 1.6, "wall_trans": 1.6, "floor_trans": 1.6, "disp_v_ratio": 0.7, "building_type": "apartment", "building_year": "1920-1940", "windows_trans": 4.9, "win_floor_ratio": 0.08}, {"height": 3.2, "country": "Lithuania", "roof_trans": 1.5, "wall_trans": 1.5, "floor_trans": 1.5, "disp_v_ratio": 0.6, "building_type": "apartment", "building_year": "1940-1960", "windows_trans": 4.9, "win_floor_ratio": 0.09}, {"height": 3, "country": "Lithuania", "roof_trans": 1.4, "wall_trans": 1.4, "floor_trans": 1.4, "disp_v_ratio": 0.6, "building_type": "apartment", "building_year": "1960-1980", "windows_trans": 4, "win_floor_ratio": 0.1}, {"height": 2.7, "country": "Lithuania", "roof_trans": 1.2, "wall_trans": 1.2, "floor_trans": 1.2, "disp_v_ratio": 0.5, "building_type": "apartment", "building_year": "1980-1990", "windows_trans": 3.7, "win_floor_ratio": 0.1}, {"height": 3, "country": "Lithuania", "roof_trans": 0.6, "wall_trans": 0.6, "floor_trans": 0.6, "disp_v_ratio": 0.5, "building_type": "apartment", "building_year": "1991-2005", "windows_trans": 3.7, "win_floor_ratio": 0.1}, {"height": 3, "country": "Lithuania", "roof_trans": 0.6, "wall_trans": 0.6, "floor_trans": 0.6, "disp_v_ratio": 0.5, "building_type": "apartment", "building_year": ">2005", "windows_trans": 2.7, "win_floor_ratio": 0.125}, {"height": 3.8, "country": "Lithuania", "roof_trans": 1.6, "wall_trans": 1.6, "floor_trans": 1.6, "disp_v_ratio": 0.8, "building_type": "multistorey", "building_year": "<1900", "windows_trans": 5, "win_floor_ratio": 0.075}, {"height": 3.8, "country": "Lithuania", "roof_trans": 1.6, "wall_trans": 1.6, "floor_trans": 1.6, "disp_v_ratio": 0.7, "building_type": "multistorey", "building_year": "1900-1920", "windows_trans": 5, "win_floor_ratio": 0.08}, {"height": 3.5, "country": "Lithuania", "roof_trans": 1.6, "wall_trans": 1.6, "floor_trans": 1.6, "disp_v_ratio": 0.7, "building_type": "multistorey", "building_year": "1920-1940", "windows_trans": 4.9, "win_floor_ratio": 0.08}, {"height": 3.2, "country": "Lithuania", "roof_trans": 1.55, "wall_trans": 1.55, "floor_trans": 1.55, "disp_v_ratio": 0.6, "building_type": "multistorey", "building_year": "1940-1950", "windows_trans": 4.9, "win_floor_ratio": 0.09}, {"height": 3, "country": "Lithuania", "roof_trans": 1.5, "wall_trans": 1.5, "floor_trans": 1.5, "disp_v_ratio": 0.6, "building_type": "multistorey", "building_year": "1950-1960", "windows_trans": 4, "win_floor_ratio": 0.1}, {"height": 2.7, "country": "Lithuania", "roof_trans": 1.4, "wall_trans": 1.4, "floor_trans": 1.4, "disp_v_ratio": 0.5, "building_type": "multistorey", "building_year": "1960-1980", "windows_trans": 3.7, "win_floor_ratio": 0.1}, {"height": 3, "country": "Lithuania", "roof_trans": 1.2, "wall_trans": 1.2, "floor_trans": 1.2, "disp_v_ratio": 0.5, "building_type": "multistorey", "building_year": "1980-2000", "windows_trans": 3.7, "win_floor_ratio": 0.1}, {"height": 3, "country": "Lithuania", "roof_trans": 0.6, "wall_trans": 0.6, "floor_trans": 0.6, "disp_v_ratio": 0.8, "building_type": "multistorey", "building_year": ">2000", "windows_trans": 2.7, "win_floor_ratio": 0.125}, {"height": 3.6, "country": "Lithuania", "roof_trans": 1.5, "wall_trans": 1.5, "floor_trans": 1.5, "disp_v_ratio": 0.7, "building_type": "detached house", "building_year": "<1900", "windows_trans": 5, "win_floor_ratio": 0.075}, {"height": 3.6, "country": "Lithuania", "roof_trans": 1.4, "wall_trans": 1.4, "floor_trans": 1.4, "disp_v_ratio": 0.7, "building_type": "detached house", "building_year": "1900-1920", "windows_trans": 5, "win_floor_ratio": 0.08}, {"height": 3.3, "country": "Lithuania", "roof_trans": 1.4, "wall_trans": 1.4, "floor_trans": 1.4, "disp_v_ratio": 0.6, "building_type": "detached house", "building_year": "1920-1940", "windows_trans": 4.9, "win_floor_ratio": 0.08}, {"height": 3, "country": "Lithuania", "roof_trans": 1.3, "wall_trans": 1.3, "floor_trans": 1.3, "disp_v_ratio": 0.6, "building_type": "detached house", "building_year": "1940-1960", "windows_trans": 4, "win_floor_ratio": 0.09}, {"height": 3, "country": "Lithuania", "roof_trans": 1.2, "wall_trans": 1.2, "floor_trans": 1.2, "disp_v_ratio": 0.5, "building_type": "detached house", "building_year": "1960-1980", "windows_trans": 3, "win_floor_ratio": 0.1}, {"height": 3, "country": "Lithuania", "roof_trans": 1, "wall_trans": 1, "floor_trans": 1, "disp_v_ratio": 0.5, "building_type": "detached house", "building_year": "1980-2000", "windows_trans": 2.7, "win_floor_ratio": 0.1}, {"height": 3, "country": "Lithuania", "roof_trans": 0.5, "wall_trans": 0.5, "floor_trans": 0.5, "disp_v_ratio": 0.8, "building_type": "detached house", "building_year": ">2000", "windows_trans": 2.4, "win_floor_ratio": 0.1}, {"height": 3.8, "country": "Spain", "roof_trans": 3.08, "wall_trans": 2.63, "floor_trans": 1.92, "disp_v_ratio": 0.4166666666666667, "building_type": "apartment", "building_year": "<1900", "windows_trans": 2.7, "win_floor_ratio": 0.095}, {"height": 3.8, "country": "Spain", "roof_trans": 3.08, "wall_trans": 2.63, "floor_trans": 1.68, "disp_v_ratio": 0.18726591760299627, "building_type": "apartment", "building_year": "1901-1920", "windows_trans": 5.7, "win_floor_ratio": 0.095}, {"height": 3.5, "country": "Spain", "roof_trans": 1.67, "wall_trans": 3.03, "floor_trans": 1.26, "disp_v_ratio": 0.37453183520599254, "building_type": "apartment", "building_year": "1921-1945", "windows_trans": 5.7, "win_floor_ratio": 0.1}, {"height": 3.2, "country": "Spain", "roof_trans": 1.67, "wall_trans": 3.03, "floor_trans": 1.26, "disp_v_ratio": 0.37453183520599254, "building_type": "apartment", "building_year": "1946-1960", "windows_trans": 5.7, "win_floor_ratio": 0.1}, {"height": 3, "country": "Spain", "roof_trans": 1.92, "wall_trans": 1.705, "floor_trans": 1.72, "disp_v_ratio": 0.2053388090349076, "building_type": "apartment", "building_year": "1961-1975", "windows_trans": 5.7, "win_floor_ratio": 0.1}, {"height": 2.7, "country": "Spain", "roof_trans": 1.92, "wall_trans": 1.705, "floor_trans": 1.72, "disp_v_ratio": 0.1620745542949757, "building_type": "apartment", "building_year": "1976-1990", "windows_trans": 5.7, "win_floor_ratio": 0.125}, {"height": 3, "country": "Spain", "roof_trans": 0.6, "wall_trans": 0.58, "floor_trans": 2.2, "disp_v_ratio": 0.7518796992481203, "building_type": "apartment", "building_year": "1991-2005", "windows_trans": 3.37, "win_floor_ratio": 0.125}, {"height": 3, "country": "Spain", "roof_trans": 0.47, "wall_trans": 0.48, "floor_trans": 0.91, "disp_v_ratio": 0.42372881355932207, "building_type": "apartment", "building_year": ">2005", "windows_trans": 3.29, "win_floor_ratio": 0.125}, {"height": 3.8, "country": "Spain", "roof_trans": 3.08, "wall_trans": 2.63, "floor_trans": 1.92, "disp_v_ratio": 0.4166666666666667, "building_type": "Multistorey", "building_year": "<1900", "windows_trans": 2.4, "win_floor_ratio": 0.095}, {"height": 3.8, "country": "Spain", "roof_trans": 3.08, "wall_trans": 2.63, "floor_trans": 1.68, "disp_v_ratio": 0.18726591760299627, "building_type": "Multistorey", "building_year": "1901-1920", "windows_trans": 5.7, "win_floor_ratio": 0.095}, {"height": 3.5, "country": "Spain", "roof_trans": 1.67, "wall_trans": 3.03, "floor_trans": 1.26, "disp_v_ratio": 0.37453183520599254, "building_type": "Multistorey", "building_year": "1921-1945", "windows_trans": 5.7, "win_floor_ratio": 0.1}, {"height": 3.2, "country": "Spain", "roof_trans": 1.67, "wall_trans": 3.03, "floor_trans": 1.26, "disp_v_ratio": 0.37453183520599254, "building_type": "Multistorey", "building_year": "1946-1960", "windows_trans": 5.7, "win_floor_ratio": 0.1}, {"height": 3, "country": "Spain", "roof_trans": 1.92, "wall_trans": 1.705, "floor_trans": 1.72, "disp_v_ratio": 0.2053388090349076, "building_type": "Multistorey", "building_year": "1961-1975", "windows_trans": 5.7, "win_floor_ratio": 0.1}, {"height": 2.7, "country": "Spain", "roof_trans": 1.92, "wall_trans": 1.705, "floor_trans": 1.72, "disp_v_ratio": 0.1620745542949757, "building_type": "Multistorey", "building_year": "1976-1990", "windows_trans": 5.7, "win_floor_ratio": 0.125}, {"height": 3, "country": "Spain", "roof_trans": 0.6, "wall_trans": 0.58, "floor_trans": 2.2, "disp_v_ratio": 0.7518796992481203, "building_type": "Multistorey", "building_year": "1991-2005", "windows_trans": 3.37, "win_floor_ratio": 0.125}, {"height": 3, "country": "Spain", "roof_trans": 0.47, "wall_trans": 0.48, "floor_trans": 0.91, "disp_v_ratio": 0.42372881355932207, "building_type": "Multistorey", "building_year": ">2005", "windows_trans": 3.29, "win_floor_ratio": 0.125}, {"height": 3.6, "country": "Spain", "roof_trans": 5.56, "wall_trans": 0.24, "floor_trans": 2.38, "disp_v_ratio": 0.7246376811594204, "building_type": "detached house", "building_year": "<1900", "windows_trans": 4.96, "win_floor_ratio": 0.095}, {"height": 3.6, "country": "Spain", "roof_trans": 3.08, "wall_trans": 2.56, "floor_trans": 0.85, "disp_v_ratio": 0.6944444444444444, "building_type": "detached house", "building_year": "1901-1920", "windows_trans": 4.3, "win_floor_ratio": 0.095}, {"height": 3.3, "country": "Spain", "roof_trans": 3.08, "wall_trans": 2.56, "floor_trans": 0.85, "disp_v_ratio": 0.6944444444444444, "building_type": "detached house", "building_year": "1921-1945", "windows_trans": 4.3, "win_floor_ratio": 0.1}, {"height": 3, "country": "Spain", "roof_trans": 1.6, "wall_trans": 2.56, "floor_trans": 1.83, "disp_v_ratio": 0.3164556962025316, "building_type": "detached house", "building_year": "1946-1960", "windows_trans": 4.59, "win_floor_ratio": 0.1}, {"height": 3, "country": "Spain", "roof_trans": 1.37, "wall_trans": 1.33, "floor_trans": 0.85, "disp_v_ratio": 1.0101010101010102, "building_type": "detached house", "building_year": "1961-1975", "windows_trans": 4.59, "win_floor_ratio": 0.1}, {"height": 3, "country": "Spain", "roof_trans": 1.37, "wall_trans": 1.33, "floor_trans": 0.85, "disp_v_ratio": 1.0101010101010102, "building_type": "detached house", "building_year": "1976-1990", "windows_trans": 4.59, "win_floor_ratio": 0.125}, {"height": 3, "country": "Spain", "roof_trans": 0.52, "wall_trans": 0.62, "floor_trans": 0.89, "disp_v_ratio": 0.8849557522123894, "building_type": "detached house", "building_year": "1991-2005", "windows_trans": 3.19, "win_floor_ratio": 0.125}, {"height": 3, "country": "Spain", "roof_trans": 0.47, "wall_trans": 0.48, "floor_trans": 2.16, "disp_v_ratio": 0.5464480874316939, "building_type": "detached house", "building_year": ">2005", "windows_trans": 3.09, "win_floor_ratio": 0.125}, {"height": 4, "country": "Germany", "roof_trans": 2.6, "wall_trans": 2, "floor_trans": 1.2, "disp_v_ratio": 0.529, "building_type": "apartment", "building_year": "<1859", "windows_trans": 2.8, "win_floor_ratio": 0.095}, {"height": 4, "country": "Germany", "roof_trans": 1.3, "wall_trans": 2.2, "floor_trans": 1.2, "disp_v_ratio": 0.3, "building_type": "apartment", "building_year": "1860-1918", "windows_trans": 2.7, "win_floor_ratio": 0.095}, {"height": 3.8, "country": "Germany", "roof_trans": 1.4, "wall_trans": 1.7, "floor_trans": 1, "disp_v_ratio": 0.636, "building_type": "apartment", "building_year": "1919-1948", "windows_trans": 3, "win_floor_ratio": 0.1}, {"height": 3.8, "country": "Germany", "roof_trans": 1.6, "wall_trans": 1.2, "floor_trans": 2.2, "disp_v_ratio": 0.663, "building_type": "apartment", "building_year": "1949-1957", "windows_trans": 3, "win_floor_ratio": 0.1}, {"height": 3.8, "country": "Germany", "roof_trans": 0.6, "wall_trans": 1.2, "floor_trans": 1.6, "disp_v_ratio": 0.432, "building_type": "apartment", "building_year": "1958-1968", "windows_trans": 3, "win_floor_ratio": 0.1}, {"height": 3.8, "country": "Germany", "roof_trans": 0.6, "wall_trans": 1, "floor_trans": 1, "disp_v_ratio": 0.594, "building_type": "apartment", "building_year": "1969-1978", "windows_trans": 3, "win_floor_ratio": 0.1}, {"height": 3.8, "country": "Germany", "roof_trans": 0.5, "wall_trans": 0.8, "floor_trans": 0.8, "disp_v_ratio": 0.512, "building_type": "apartment", "building_year": "1979-1983", "windows_trans": 3, "win_floor_ratio": 0.1}, {"height": 3.5, "country": "Germany", "roof_trans": 0.4, "wall_trans": 0.6, "floor_trans": 0.6, "disp_v_ratio": 0.595, "building_type": "apartment", "building_year": "1984-1994", "windows_trans": 3, "win_floor_ratio": 0.125}, {"height": 3.2, "country": "Germany", "roof_trans": 0.35, "wall_trans": 0.4, "floor_trans": 0.45, "disp_v_ratio": 0.481, "building_type": "apartment", "building_year": "1995-2001", "windows_trans": 2, "win_floor_ratio": 0.125}, {"height": 3, "country": "Germany", "roof_trans": 0.2, "wall_trans": 0.25, "floor_trans": 0.35, "disp_v_ratio": 0.417, "building_type": "apartment", "building_year": "2002-2009", "windows_trans": 2, "win_floor_ratio": 0.125}, {"height": 3, "country": "Germany", "roof_trans": 0.2, "wall_trans": 0.28, "floor_trans": 0.35, "disp_v_ratio": 0.396, "building_type": "apartment", "building_year": "2009-2015", "windows_trans": 1.8, "win_floor_ratio": 0.125}, {"height": 3, "country": "Germany", "roof_trans": 0.25, "wall_trans": 0.29, "floor_trans": 0.29, "disp_v_ratio": 0.396, "building_type": "apartment", "building_year": ">2016", "windows_trans": 1.3, "win_floor_ratio": 0.125}, {"height": 4, "country": "Germany", "roof_trans": 2.6, "wall_trans": 2, "floor_trans": 1.2, "disp_v_ratio": 0.529, "building_type": "multistorey", "building_year": "<1859", "windows_trans": 2.8, "win_floor_ratio": 0.095}, {"height": 4, "country": "Germany", "roof_trans": 1.3, "wall_trans": 2.2, "floor_trans": 1.2, "disp_v_ratio": 0.3, "building_type": "multistorey", "building_year": "1860-1918", "windows_trans": 2.7, "win_floor_ratio": 0.095}, {"height": 3.8, "country": "Germany", "roof_trans": 1.4, "wall_trans": 1.7, "floor_trans": 1, "disp_v_ratio": 0.636, "building_type": "multistorey", "building_year": "1919-1948", "windows_trans": 3, "win_floor_ratio": 0.1}, {"height": 3.8, "country": "Germany", "roof_trans": 1.6, "wall_trans": 1.2, "floor_trans": 2.2, "disp_v_ratio": 0.663, "building_type": "multistorey", "building_year": "1949-1957", "windows_trans": 3, "win_floor_ratio": 0.1}, {"height": 3.8, "country": "Germany", "roof_trans": 0.6, "wall_trans": 1.2, "floor_trans": 1.6, "disp_v_ratio": 0.432, "building_type": "multistorey", "building_year": "1958-1968", "windows_trans": 3, "win_floor_ratio": 0.1}, {"height": 3.8, "country": "Germany", "roof_trans": 0.6, "wall_trans": 1, "floor_trans": 1, "disp_v_ratio": 0.594, "building_type": "multistorey", "building_year": "1969-1978", "windows_trans": 3, "win_floor_ratio": 0.1}, {"height": 3.8, "country": "Germany", "roof_trans": 0.5, "wall_trans": 0.8, "floor_trans": 0.8, "disp_v_ratio": 0.512, "building_type": "multistorey", "building_year": "1979-1983", "windows_trans": 3, "win_floor_ratio": 0.1}, {"height": 3.5, "country": "Germany", "roof_trans": 0.4, "wall_trans": 0.6, "floor_trans": 0.6, "disp_v_ratio": 0.595, "building_type": "multistorey", "building_year": "1984-1994", "windows_trans": 3, "win_floor_ratio": 0.125}, {"height": 3.2, "country": "Germany", "roof_trans": 0.35, "wall_trans": 0.4, "floor_trans": 0.45, "disp_v_ratio": 0.481, "building_type": "multistorey", "building_year": "1995-2001", "windows_trans": 2, "win_floor_ratio": 0.125}, {"height": 3, "country": "Germany", "roof_trans": 0.2, "wall_trans": 0.25, "floor_trans": 0.35, "disp_v_ratio": 0.417, "building_type": "multistorey", "building_year": "2002-2009", "windows_trans": 2, "win_floor_ratio": 0.125}, {"height": 3, "country": "Germany", "roof_trans": 0.2, "wall_trans": 0.28, "floor_trans": 0.35, "disp_v_ratio": 0.396, "building_type": "multistorey", "building_year": "2009-2015", "windows_trans": 1.8, "win_floor_ratio": 0.125}, {"height": 3, "country": "Germany", "roof_trans": 0.25, "wall_trans": 0.29, "floor_trans": 0.29, "disp_v_ratio": 0.396, "building_type": "multistorey", "building_year": ">2016", "windows_trans": 1.3, "win_floor_ratio": 0.125}, {"height": 3.2, "country": "Germany", "roof_trans": 2.6, "wall_trans": 2, "floor_trans": 2.8, "disp_v_ratio": 0.547, "building_type": "detached house", "building_year": "<1859", "windows_trans": 2.9, "win_floor_ratio": 0.095}, {"height": 3.2, "country": "Germany", "roof_trans": 1.3, "wall_trans": 1.7, "floor_trans": 1.2, "disp_v_ratio": 0.638, "building_type": "detached house", "building_year": "1860-1918", "windows_trans": 2.8, "win_floor_ratio": 0.095}, {"height": 3.1, "country": "Germany", "roof_trans": 1.4, "wall_trans": 1.7, "floor_trans": 1, "disp_v_ratio": 0.616, "building_type": "detached house", "building_year": "1919-1948", "windows_trans": 2.8, "win_floor_ratio": 0.1}, {"height": 3.1, "country": "Germany", "roof_trans": 1.4, "wall_trans": 1.4, "floor_trans": 1, "disp_v_ratio": 0.904, "building_type": "detached house", "building_year": "1949-1957", "windows_trans": 2.8, "win_floor_ratio": 0.1}, {"height": 3.1, "country": "Germany", "roof_trans": 0.8, "wall_trans": 1.2, "floor_trans": 1.6, "disp_v_ratio": 0.922, "building_type": "detached house", "building_year": "1958-1968", "windows_trans": 2.8, "win_floor_ratio": 0.1}, {"height": 3.2, "country": "Germany", "roof_trans": 0.5, "wall_trans": 1, "floor_trans": 1, "disp_v_ratio": 0.906, "building_type": "detached house", "building_year": "1969-1978", "windows_trans": 2.8, "win_floor_ratio": 0.1}, {"height": 3.2, "country": "Germany", "roof_trans": 0.5, "wall_trans": 0.8, "floor_trans": 0.8, "disp_v_ratio": 0.576, "building_type": "detached house", "building_year": "1979-1983", "windows_trans": 4.3, "win_floor_ratio": 0.1}, {"height": 3.2, "country": "Germany", "roof_trans": 0.4, "wall_trans": 0.5, "floor_trans": 0.6, "disp_v_ratio": 0.859, "building_type": "detached house", "building_year": "1984-1994", "windows_trans": 3.2, "win_floor_ratio": 0.125}, {"height": 3, "country": "Germany", "roof_trans": 0.35, "wall_trans": 0.3, "floor_trans": 0.45, "disp_v_ratio": 0.845, "building_type": "detached house", "building_year": "1995-2001", "windows_trans": 1.9, "win_floor_ratio": 0.125}, {"height": 3, "country": "Germany", "roof_trans": 0.25, "wall_trans": 0.3, "floor_trans": 0.35, "disp_v_ratio": 0.804, "building_type": "detached house", "building_year": "2002-2009", "windows_trans": 1.4, "win_floor_ratio": 0.125}, {"height": 3, "country": "Germany", "roof_trans": 0.2, "wall_trans": 0.28, "floor_trans": 0.35, "disp_v_ratio": 0.619, "building_type": "detached house", "building_year": "2009-2015", "windows_trans": 1.3, "win_floor_ratio": 0.125}, {"height": 3, "country": "Germany", "roof_trans": 0.15, "wall_trans": 0.17, "floor_trans": 0.17, "disp_v_ratio": 0.619, "building_type": "detached house", "building_year": ">2016", "windows_trans": 1.1, "win_floor_ratio": 0.125}]	{"table1": [{"thickness": 0.1, "material_cost": 10.5, "installation_cost": 46, "external_insulation": "wall insulation", "thermal_conductivity": 0.03}, {"thickness": 0.1, "material_cost": 10, "installation_cost": 20, "external_insulation": "Roof insulation", "thermal_conductivity": 0.03}, {"thickness": 0.1, "material_cost": 30, "installation_cost": 70, "external_insulation": "Floor insulation", "thermal_conductivity": 0.03}], "table2": [{"cost": "single_grazed_cost", "value": 300}, {"cost": "double_grazed_cost", "value": 400}]}	{"table1": [{"cost": 20, "heating": "1-Type B open chamber", "efficiency": 0.76, "installation_cost": 10, "heatingemittertype": "1- Radiators"}, {"cost": 25, "heating": "2-Type C sealed chamber", "efficiency": 0.85, "installation_cost": 10, "heatingemittertype": "2- Radiators  with Valve"}, {"cost": 35, "heating": "3- Gas/diesel modulating", "efficiency": 0.83, "installation_cost": 15, "heatingemittertype": "3- Fan coil"}, {"cost": 45, "heating": "4- Condensing", "efficiency": 0.94, "installation_cost": 15, "heatingemittertype": "4- Floor panels"}, {"cost": 30, "heating": "5- Gas/diesel on-off", "efficiency": 0.87, "installation_cost": 10, "heatingemittertype": "5- Ceiling and wall panels"}, {"cost": 30, "heating": "6- Air cooled", "efficiency": 0.87, "installation_cost": 10, "heatingemittertype": "6- Other types"}, {"cost": 80, "heating": "pellet stove", "efficiency": 0.88, "installation_cost": 10, "heatingemittertype": ""}, {"cost": 300, "heating": "heat pump", "efficiency": 3.5, "installation_cost": 50, "heatingemittertype": ""}, {"cost": 700, "heating": "solar_heating", "efficiency": "", "installation_cost": 200, "heatingemittertype": ""}], "table2": [{"cost": 5, "efficiency": 0.9, "plant_type": "electric_boiler", "installation_cost": 10}, {"cost": 20, "efficiency": 0.76, "plant_type": "1- Open chamber centralized", "installation_cost": 10}, {"cost": 25, "efficiency": 0.85, "plant_type": "2- Sealed chamber autonomous", "installation_cost": 10}, {"cost": 10, "efficiency": 3, "plant_type": "heat_pump", "installation_cost": 10}, {"cost": 700, "efficiency": "", "plant_type": "solar_heater", "installation_cost": 200}], "table3": [{"cost": 120, "efficiency": 0.94, "installation_cost": 5, "heatingemittertype": "1- Radiators", "regulationmeanefficiency": 0.95}, {"cost": 200, "efficiency": 0.95, "installation_cost": 5, "heatingemittertype": "2- Radiators  with Valve", "regulationmeanefficiency": ""}, {"cost": 60, "efficiency": 0.95, "installation_cost": "", "heatingemittertype": "3- Fan coil", "regulationmeanefficiency": ""}, {"cost": 500, "efficiency": 0.96, "installation_cost": "", "heatingemittertype": "4- Floor panels", "regulationmeanefficiency": ""}, {"cost": 400, "efficiency": 0.95, "installation_cost": "", "heatingemittertype": "5- Ceiling and wall panels", "regulationmeanefficiency": ""}, {"cost": 9999999, "efficiency": 0.92, "installation_cost": 9999999, "heatingemittertype": "6- Other types", "regulationmeanefficiency": ""}], "table4": [{"regulation_mean_efficiency": 0.95, "distribution_mean_efficiency": 0.94}]}	[{"note": "", "value": 0.7, "description": "alfa (plaster)"}, {"note": "", "value": 0.65, "description": "sun factor (glass transmission coeff.)"}, {"note": "", "value": 0.3, "description": "shadow"}, {"note": "UNI  ts 11300-1 (from 0.3 up to 0.5)", "value": 0.33, "description": "Airchangecoeff   [1/h]"}, {"note": "", "value": 30, "description": "DHWload  [kg/person /day]   1 person=25 m2"}, {"note": "It must agree with HDD in the sheet \\"city climate\\"", "value": 20, "description": "Tb-base temperature for HDD [°C]"}]	[{"p0": 0.15, "p1": 0.153, "p2": 0.15606, "p3": 0.1591812, "p4": 0.162364824, "p5": 0.16561212047999999, "p6": 0.1689243628896, "p7": 0.172302850147392, "p8": 0.17574890715033983, "p9": 0.17926388529334664, "p10": 0.18284916299921358, "p11": 0.18650614625919787, "p12": 0.19023626918438183, "p13": 0.19404099456806947, "p14": 0.19792181445943086, "p15": 0.20188025074861948, "p16": 0.20591785576359187, "p17": 0.2100362128788637, "p18": 0.21423693713644099, "p19": 0.21852167587916982, "p20": 0.22289210939675322, "p21": 0.2273499515846883, "p22": 0.23189695061638207, "p23": 0.23653488962870972, "p24": 0.24126558742128393, "p25": 0.2460908991697096, "p26": 0.2510127171531038, "p27": 0.2560329714961659, "p28": 0.26115363092608923, "p29": 0.266376703544611, "p30": 0.2717042376155032, "source": "electric_energy", "country": "italy", "variation_rate_per_year": 0.02}, {"p0": 0.7, "p1": 0.714, "p2": 0.7282799999999999, "p3": 0.7428455999999999, "p4": 0.7577025119999999, "p5": 0.77285656224, "p6": 0.7883136934848, "p7": 0.8040799673544959, "p8": 0.8201615667015859, "p9": 0.8365647980356177, "p10": 0.85329609399633, "p11": 0.8703620158762566, "p12": 0.8877692561937818, "p13": 0.9055246413176574, "p14": 0.9236351341440106, "p15": 0.9421078368268908, "p16": 0.9609499935634287, "p17": 0.9801689934346973, "p18": 0.9997723733033913, "p19": 1.0197678207694592, "p20": 1.0401631771848483, "p21": 1.0609664407285453, "p22": 1.0821857695431163, "p23": 1.1038294849339787, "p24": 1.1259060746326583, "p25": 1.1484241961253114, "p26": 1.1713926800478176, "p27": 1.194820533648774, "p28": 1.2187169443217496, "p29": 1.2430912832081846, "p30": 1.2679531088723484, "source": "methane_gas", "country": "italy", "variation_rate_per_year": 0.02}, {"p0": 0.3, "p1": 0.306, "p2": 0.31212, "p3": 0.3183624, "p4": 0.324729648, "p5": 0.33122424095999997, "p6": 0.3378487257792, "p7": 0.344605700294784, "p8": 0.35149781430067967, "p9": 0.3585277705866933, "p10": 0.36569832599842717, "p11": 0.37301229251839574, "p12": 0.38047253836876366, "p13": 0.38808198913613895, "p14": 0.3958436289188617, "p15": 0.40376050149723897, "p16": 0.41183571152718373, "p17": 0.4200724257577274, "p18": 0.42847387427288197, "p19": 0.43704335175833964, "p20": 0.44578421879350644, "p21": 0.4546999031693766, "p22": 0.46379390123276415, "p23": 0.47306977925741944, "p24": 0.48253117484256786, "p25": 0.4921817983394192, "p26": 0.5020254343062076, "p27": 0.5120659429923318, "p28": 0.5223072618521785, "p29": 0.532753407089222, "p30": 0.5434084752310064, "source": "pellet", "country": "italy", "variation_rate_per_year": 0.02}, {"p0": "", "p1": "", "p2": "", "p3": "", "p4": "", "p5": "", "p6": "", "p7": "", "p8": "", "p9": "", "p10": "", "p11": "", "p12": "", "p13": "", "p14": "", "p15": "", "p16": "", "p17": "", "p18": "", "p19": "", "p20": "", "p21": "", "p22": "", "p23": "", "p24": "", "p25": "", "p26": "", "p27": "", "p28": "", "p29": "", "p30": "", "source": "discount rate", "country": "italy", "variation_rate_per_year": 0.08}, {"p0": 0.15, "p1": 0.153, "p2": 0.15606, "p3": 0.1591812, "p4": 0.162364824, "p5": 0.16561212047999999, "p6": 0.1689243628896, "p7": 0.172302850147392, "p8": 0.17574890715033983, "p9": 0.17926388529334664, "p10": 0.18284916299921358, "p11": 0.18650614625919787, "p12": 0.19023626918438183, "p13": 0.19404099456806947, "p14": 0.19792181445943086, "p15": 0.20188025074861948, "p16": 0.20591785576359187, "p17": 0.2100362128788637, "p18": 0.21423693713644099, "p19": 0.21852167587916982, "p20": 0.22289210939675322, "p21": 0.2273499515846883, "p22": 0.23189695061638207, "p23": 0.23653488962870972, "p24": 0.24126558742128393, "p25": 0.2460908991697096, "p26": 0.2510127171531038, "p27": 0.2560329714961659, "p28": 0.26115363092608923, "p29": 0.266376703544611, "p30": 0.2717042376155032, "source": "electric_energy", "country": "Lithuania", "variation_rate_per_year": 0.02}, {"p0": 0.7, "p1": 0.714, "p2": 0.7282799999999999, "p3": 0.7428455999999999, "p4": 0.7577025119999999, "p5": 0.77285656224, "p6": 0.7883136934848, "p7": 0.8040799673544959, "p8": 0.8201615667015859, "p9": 0.8365647980356177, "p10": 0.85329609399633, "p11": 0.8703620158762566, "p12": 0.8877692561937818, "p13": 0.9055246413176574, "p14": 0.9236351341440106, "p15": 0.9421078368268908, "p16": 0.9609499935634287, "p17": 0.9801689934346973, "p18": 0.9997723733033913, "p19": 1.0197678207694592, "p20": 1.0401631771848483, "p21": 1.0609664407285453, "p22": 1.0821857695431163, "p23": 1.1038294849339787, "p24": 1.1259060746326583, "p25": 1.1484241961253114, "p26": 1.1713926800478176, "p27": 1.194820533648774, "p28": 1.2187169443217496, "p29": 1.2430912832081846, "p30": 1.2679531088723484, "source": "methane_gas", "country": "Lithuania", "variation_rate_per_year": 0.02}, {"p0": 0.3, "p1": 0.306, "p2": 0.31212, "p3": 0.3183624, "p4": 0.324729648, "p5": 0.33122424095999997, "p6": 0.3378487257792, "p7": 0.344605700294784, "p8": 0.35149781430067967, "p9": 0.3585277705866933, "p10": 0.36569832599842717, "p11": 0.37301229251839574, "p12": 0.38047253836876366, "p13": 0.38808198913613895, "p14": 0.3958436289188617, "p15": 0.40376050149723897, "p16": 0.41183571152718373, "p17": 0.4200724257577274, "p18": 0.42847387427288197, "p19": 0.43704335175833964, "p20": 0.44578421879350644, "p21": 0.4546999031693766, "p22": 0.46379390123276415, "p23": 0.47306977925741944, "p24": 0.48253117484256786, "p25": 0.4921817983394192, "p26": 0.5020254343062076, "p27": 0.5120659429923318, "p28": 0.5223072618521785, "p29": 0.532753407089222, "p30": 0.5434084752310064, "source": "pellet", "country": "Lithuania", "variation_rate_per_year": 0.02}, {"p0": "", "p1": "", "p2": "", "p3": "", "p4": "", "p5": "", "p6": "", "p7": "", "p8": "", "p9": "", "p10": "", "p11": "", "p12": "", "p13": "", "p14": "", "p15": "", "p16": "", "p17": "", "p18": "", "p19": "", "p20": "", "p21": "", "p22": "", "p23": "", "p24": "", "p25": "", "p26": "", "p27": "", "p28": "", "p29": "", "p30": "", "source": "discount rate", "country": "Lithuania", "variation_rate_per_year": 0.09}, {"p0": 0.15, "p1": 0.153, "p2": 0.15606, "p3": 0.1591812, "p4": 0.162364824, "p5": 0.16561212047999999, "p6": 0.1689243628896, "p7": 0.172302850147392, "p8": 0.17574890715033983, "p9": 0.17926388529334664, "p10": 0.18284916299921358, "p11": 0.18650614625919787, "p12": 0.19023626918438183, "p13": 0.19404099456806947, "p14": 0.19792181445943086, "p15": 0.20188025074861948, "p16": 0.20591785576359187, "p17": 0.2100362128788637, "p18": 0.21423693713644099, "p19": 0.21852167587916982, "p20": 0.22289210939675322, "p21": 0.2273499515846883, "p22": 0.23189695061638207, "p23": 0.23653488962870972, "p24": 0.24126558742128393, "p25": 0.2460908991697096, "p26": 0.2510127171531038, "p27": 0.2560329714961659, "p28": 0.26115363092608923, "p29": 0.266376703544611, "p30": 0.2717042376155032, "source": "electric_energy", "country": "Spain", "variation_rate_per_year": 0.02}, {"p0": 0.7, "p1": 0.714, "p2": 0.7282799999999999, "p3": 0.7428455999999999, "p4": 0.7577025119999999, "p5": 0.77285656224, "p6": 0.7883136934848, "p7": 0.8040799673544959, "p8": 0.8201615667015859, "p9": 0.8365647980356177, "p10": 0.85329609399633, "p11": 0.8703620158762566, "p12": 0.8877692561937818, "p13": 0.9055246413176574, "p14": 0.9236351341440106, "p15": 0.9421078368268908, "p16": 0.9609499935634287, "p17": 0.9801689934346973, "p18": 0.9997723733033913, "p19": 1.0197678207694592, "p20": 1.0401631771848483, "p21": 1.0609664407285453, "p22": 1.0821857695431163, "p23": 1.1038294849339787, "p24": 1.1259060746326583, "p25": 1.1484241961253114, "p26": 1.1713926800478176, "p27": 1.194820533648774, "p28": 1.2187169443217496, "p29": 1.2430912832081846, "p30": 1.2679531088723484, "source": "methane_gas", "country": "Spain", "variation_rate_per_year": 0.02}, {"p0": 0.3, "p1": 0.306, "p2": 0.31212, "p3": 0.3183624, "p4": 0.324729648, "p5": 0.33122424095999997, "p6": 0.3378487257792, "p7": 0.344605700294784, "p8": 0.35149781430067967, "p9": 0.3585277705866933, "p10": 0.36569832599842717, "p11": 0.37301229251839574, "p12": 0.38047253836876366, "p13": 0.38808198913613895, "p14": 0.3958436289188617, "p15": 0.40376050149723897, "p16": 0.41183571152718373, "p17": 0.4200724257577274, "p18": 0.42847387427288197, "p19": 0.43704335175833964, "p20": 0.44578421879350644, "p21": 0.4546999031693766, "p22": 0.46379390123276415, "p23": 0.47306977925741944, "p24": 0.48253117484256786, "p25": 0.4921817983394192, "p26": 0.5020254343062076, "p27": 0.5120659429923318, "p28": 0.5223072618521785, "p29": 0.532753407089222, "p30": 0.5434084752310064, "source": "pellet", "country": "Spain", "variation_rate_per_year": 0.02}, {"p0": "", "p1": "", "p2": "", "p3": "", "p4": "", "p5": "", "p6": "", "p7": "", "p8": "", "p9": "", "p10": "", "p11": "", "p12": "", "p13": "", "p14": "", "p15": "", "p16": "", "p17": "", "p18": "", "p19": "", "p20": "", "p21": "", "p22": "", "p23": "", "p24": "", "p25": "", "p26": "", "p27": "", "p28": "", "p29": "", "p30": "", "source": "discount rate", "country": "Spain", "variation_rate_per_year": 0.07}, {"p0": 0.2969, "p1": 0.302838, "p2": 0.30889476, "p3": 0.3150726552, "p4": 0.321374108304, "p5": 0.32780159047008, "p6": 0.3343576222794816, "p7": 0.3410447747250713, "p8": 0.3478656702195727, "p9": 0.3548229836239642, "p10": 0.3619194432964435, "p11": 0.36915783216237236, "p12": 0.3765409888056198, "p13": 0.38407180858173223, "p14": 0.39175324475336687, "p15": 0.3995883096484342, "p16": 0.40758007584140293, "p17": 0.415731677358231, "p18": 0.42404631090539563, "p19": 0.43252723712350355, "p20": 0.4411777818659736, "p21": 0.4500013375032931, "p22": 0.45900136425335897, "p23": 0.46818139153842614, "p24": 0.4775450193691947, "p25": 0.48709591975657857, "p26": 0.4968378381517101, "p27": 0.5067745949147443, "p28": 0.5169100868130392, "p29": 0.5272482885493, "p30": 0.5377932543202859, "source": "electric_energy", "country": "Germany", "variation_rate_per_year": 0.02}, {"p0": 0.461, "p1": 0.47022, "p2": 0.47962440000000006, "p3": 0.48921688800000007, "p4": 0.49900122576000006, "p5": 0.5089812502752, "p6": 0.519160875280704, "p7": 0.5295440927863181, "p8": 0.5401349746420444, "p9": 0.5509376741348853, "p10": 0.561956427617583, "p11": 0.5731955561699347, "p12": 0.5846594672933334, "p13": 0.5963526566392001, "p14": 0.6082797097719841, "p15": 0.6204453039674238, "p16": 0.6328542100467723, "p17": 0.6455112942477078, "p18": 0.658421520132662, "p19": 0.6715899505353152, "p20": 0.6850217495460216, "p21": 0.698722184536942, "p22": 0.7126966282276809, "p23": 0.7269505607922345, "p24": 0.7414895720080792, "p25": 0.7563193634482408, "p26": 0.7714457507172057, "p27": 0.7868746657315498, "p28": 0.8026121590461809, "p29": 0.8186644022271046, "p30": 0.8350376902716466, "source": "methane_gas", "country": "Germany", "variation_rate_per_year": 0.02}, {"p0": 0.25, "p1": 0.255, "p2": 0.2601, "p3": 0.265302, "p4": 0.27060804, "p5": 0.2760202008, "p6": 0.281540604816, "p7": 0.28717141691232, "p8": 0.29291484525056644, "p9": 0.29877314215557776, "p10": 0.30474860499868933, "p11": 0.3108435770986631, "p12": 0.31706044864063637, "p13": 0.3234016576134491, "p14": 0.3298696907657181, "p15": 0.33646708458103247, "p16": 0.3431964262726531, "p17": 0.3500603547981062, "p18": 0.35706156189406835, "p19": 0.3642027931319497, "p20": 0.3714868489945887, "p21": 0.3789165859744805, "p22": 0.38649491769397015, "p23": 0.39422481604784954, "p24": 0.40210931236880654, "p25": 0.41015149861618266, "p26": 0.4183545285885063, "p27": 0.42672161916027646, "p28": 0.435256051543482, "p29": 0.44396117257435164, "p30": 0.4528403960258387, "source": "pellet", "country": "Germany", "variation_rate_per_year": 0.02}, {"p0": "", "p1": "", "p2": "", "p3": "", "p4": "", "p5": "", "p6": "", "p7": "", "p8": "", "p9": "", "p10": "", "p11": "", "p12": "", "p13": "", "p14": "", "p15": "", "p16": "", "p17": "", "p18": "", "p19": "", "p20": "", "p21": "", "p22": "", "p23": "", "p24": "", "p25": "", "p26": "", "p27": "", "p28": "", "p29": "", "p30": "", "source": "discount rate", "country": "Germany", "variation_rate_per_year": 0.05}]	{"table1": [{"check": 1, "conf_year": "%", "conf_today": 10, "simplified_manager": "geometry"}, {"check": 0, "conf_year": "%", "conf_today": 10, "simplified_manager": "thermal properties"}, {"check": 1, "conf_year": "%", "conf_today": 5, "simplified_manager": "efficiencies"}, {"check": 0, "conf_year": "%", "conf_today": 10, "simplified_manager": "hot water load"}, {"check": 1, "conf_year": "%", "conf_today": 20, "simplified_manager": "environment"}, {"check": 0, "conf_year": "%", "conf_today": 10, "simplified_manager": "equipment costs"}, {"check": 0, "conf_year": 10, "conf_today": 1, "simplified_manager": "energy cost"}], "table2": [{"desc": "Sfloor", "check": 1, "conf_today": 10, "advanced_manager": "Geometry"}, {"desc": "Sdisp /V", "check": 0, "conf_today": 10, "advanced_manager": "Geometry"}, {"desc": "h", "check": 1, "conf_today": 5, "advanced_manager": "Geometry"}, {"desc": "Swins /Sfloor", "check": 0, "conf_today": 5, "advanced_manager": "Geometry"}, {"desc": "", "check": "", "conf_today": "", "advanced_manager": "Geometry"}, {"desc": "Uwall", "check": 1, "conf_today": 20, "advanced_manager": "Thermal properties"}, {"desc": "Uroof", "check": 0, "conf_today": 20, "advanced_manager": "Thermal properties"}, {"desc": "Ufloor", "check": 0, "conf_today": 20, "advanced_manager": "Thermal properties"}, {"desc": "Uwins.", "check": 0, "conf_today": 20, "advanced_manager": "Thermal properties"}, {"desc": "SunFactor", "check": 0, "conf_today": 10, "advanced_manager": "Thermal properties"}, {"desc": "AlfaPlaster", "check": 0, "conf_today": 15, "advanced_manager": "Thermal properties"}, {"desc": "", "check": "", "conf_today": "", "advanced_manager": "Thermal properties"}, {"desc": "conductivity (wall)", "check": 0, "conf_today": 5, "advanced_manager": "External Insulation"}, {"desc": "thickness (wall)", "check": 0, "conf_today": 5, "advanced_manager": "External Insulation"}, {"desc": "conductivity (roof)", "check": 0, "conf_today": 5, "advanced_manager": "External Insulation"}, {"desc": "thickness (roof)", "check": 0, "conf_today": 5, "advanced_manager": "External Insulation"}, {"desc": "conductivity (floor)", "check": 0, "conf_today": 5, "advanced_manager": "External Insulation"}, {"desc": "thickness (floor)", "check": 0, "conf_today": 5, "advanced_manager": "External Insulation"}], "table3": [{"desc": "eta_burner", "check": 1, "conf_year": "%", "conf_today": 5, "advanced_manager1": "Heating"}, {"desc": "eta_pellet", "check": 0, "conf_year": "%", "conf_today": 5, "advanced_manager1": "Heating"}, {"desc": "COP_hp", "check": 0, "conf_year": "%", "conf_today": 15, "advanced_manager1": "Heating"}, {"desc": "eta_regulation", "check": 0, "conf_year": "%", "conf_today": 5, "advanced_manager1": "Heating"}, {"desc": "eta_distribution", "check": 0, "conf_year": "%", "conf_today": 5, "advanced_manager1": "Heating"}, {"desc": "eta_emitter", "check": 0, "conf_year": "%", "conf_today": 5, "advanced_manager1": "Heating"}, {"desc": "Solar fraction", "check": 0, "conf_year": "%", "conf_today": 10, "advanced_manager1": "Heating"}, {"desc": "", "check": "", "conf_year": "", "conf_today": "", "advanced_manager1": "Heating"}, {"desc": "eta_electricBoiler", "check": 0, "conf_year": "%", "conf_today": 5, "advanced_manager1": "DHW system"}, {"desc": "eta_burner (DHW)", "check": 1, "conf_year": "%", "conf_today": 5, "advanced_manager1": "DHW system"}, {"desc": "COP_hp(DHW)", "check": 0, "conf_year": "%", "conf_today": 15, "advanced_manager1": "DHW system"}, {"desc": "Hot Water load", "check": 0, "conf_year": "%", "conf_today": 5, "advanced_manager1": "DHW system"}, {"desc": "Solar fraction (DHW)", "check": 0, "conf_year": "%", "conf_today": 10, "advanced_manager1": "DHW system"}, {"desc": "", "check": "", "conf_year": "", "conf_today": "", "advanced_manager1": "DHW system"}, {"desc": "HDD", "check": 0, "conf_year": "%", "conf_today": 20, "advanced_manager1": "External Env"}, {"desc": "Radiation", "check": 0, "conf_year": "%", "conf_today": 10, "advanced_manager1": "External Env"}, {"desc": "Heating days", "check": 0, "conf_year": "%", "conf_today": 5, "advanced_manager1": "External Env"}, {"desc": "he convective coeff", "check": 0, "conf_year": "%", "conf_today": 10, "advanced_manager1": "External Env"}, {"desc": "Air change", "check": 0, "conf_year": "%", "conf_today": 20, "advanced_manager1": "External Env"}, {"desc": "Shadow", "check": 0, "conf_year": "%", "conf_today": 20, "advanced_manager1": "External Env"}, {"desc": "", "check": "", "conf_year": "", "conf_today": "", "advanced_manager1": "External Env"}, {"desc": "Fixed Costs", "check": 0, "conf_year": "%", "conf_today": 10, "advanced_manager1": "Costs"}, {"desc": "Discount Rate", "check": 0, "conf_year": "%", "conf_today": 10, "advanced_manager1": "Costs"}, {"desc": "Fuel       energy", "check": 0, "conf_year": 20, "conf_today": 1, "advanced_manager1": "Costs"}, {"desc": "Electric energy", "check": 0, "conf_year": 20, "conf_today": 1, "advanced_manager1": "Costs"}, {"desc": "Pellet    energy", "check": 0, "conf_year": 20, "conf_today": 1, "advanced_manager1": "Costs"}], "table4": [{"noiseshape": 1}], "table5": [{"resconfidence": 95}]}	{"table1": [{"value": "", "geometric": "Floor area"}, {"value": "", "geometric": "Dispersing area to volume ratio"}, {"value": "", "geometric": "Floor to floor height"}, {"value": "d", "geometric": "Windows to floor area ratio"}], "table2": [{"value": "", "thermophysical": "Wall transmittance"}, {"value": "", "thermophysical": "Roof transmittance"}, {"value": "", "thermophysical": "Floor transmittance"}, {"value": "d", "thermophysical": "Wins. transmittance"}, {"value": "d", "thermophysical": "Plaster absorption coeff."}, {"value": "d", "thermophysical": "Sun factor"}, {"value": "d", "thermophysical": "Insul. thickness (wall)"}, {"value": "d", "thermophysical": "Insul. conductivity (wall)"}, {"value": "d", "thermophysical": "Insul. thickness (roof)"}, {"value": "d", "thermophysical": "Insul. conductivity (roof)"}, {"value": "d", "thermophysical": "Insul. thickness (floor)"}, {"value": "d", "thermophysical": "Insul. conductivity (floor)"}], "table3": [{"value": "d", "heating_equipment": "Burner efficiency"}, {"value": "d", "heating_equipment": "Pellet burner eff."}, {"value": "d", "heating_equipment": "Heat Pump COP"}, {"value": "d", "heating_equipment": "Regulation efficiency"}, {"value": "d", "heating_equipment": "Regulation efficiency"}, {"value": "d", "heating_equipment": "Emitter efficiency"}, {"value": "d", "heating_equipment": "Solar fraction"}, {"value": "d", "heating_equipment": "Burner efficiency (DHW)"}, {"value": "d", "heating_equipment": "Heat Pump COP (DHW)"}, {"value": "d", "heating_equipment": "Electric boiler efficiency (DHW)"}, {"value": "d", "heating_equipment": "Heat Pump COP (DHW)"}, {"value": "d", "heating_equipment": "Hot water load"}, {"value": "d", "heating_equipment": "Solar fraction (DHW)"}], "table4": [{"value": "s, gC", "external_environment": "HDD"}, {"value": "s, gC", "external_environment": "Radiation"}, {"value": "s, gC", "external_environment": "Heating days"}, {"value": "s", "external_environment": "Ext. convection coefficient"}, {"value": "s", "external_environment": "Air change rate"}, {"value": "", "external_environment": "Shadow coefficient"}], "table5": [{"value": "", "economic": "Fixed costs"}, {"value": "s, gC", "economic": "Electric energy cost"}, {"value": "s, gC", "economic": "Fuel energy cost"}, {"value": "s, gC", "economic": "Pellet energy cost"}, {"value": "s, gC", "economic": "Discount rate"}]}	1	constants/1.xlsx	[{"hdd": 729, "may": 10.2, "city": "Agrigento", "july": 9.7, "june": 9.2, "zone": "B", "april": 12.2, "march": 14.4, "august": 12.3, "country": "Italy", "january": 13.8, "october": 16.4, "december": 13.7, "february": 15.4, "november": 15.3, "september": 15.3, "heatingonoff": "01.12/31.03", "average_daily": ""}, {"hdd": 2559, "may": 9.3, "city": "Alessandria", "july": 10.2, "june": 9.1, "zone": "E", "april": 10.3, "march": 11.1, "august": 10.4, "country": "Italy", "january": 8.4, "october": 10.2, "december": 7.8, "february": 10.2, "november": 8.6, "september": 11, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 1688, "may": 10.8, "city": "Ancona", "july": 11, "june": 9.9, "zone": "D", "april": 11.7, "march": 11.3, "august": 12.2, "country": "Italy", "january": 6.6, "october": 13, "december": 6.7, "february": 9.7, "november": 8.6, "september": 13.2, "heatingonoff": "01.11/15.04", "average_daily": ""}, {"hdd": 2850, "may": 9.3, "city": "Aosta", "july": 9.8, "june": 9.1, "zone": "E", "april": 10.4, "march": 12.1, "august": 10.3, "country": "Italy", "january": 10.3, "october": 10.8, "december": 10.2, "february": 11.6, "november": 11.2, "september": 11, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 2104, "may": 9.3, "city": "Arezzo", "july": 10.1, "june": 9.4, "zone": "E", "april": 9.5, "march": 10.2, "august": 10.7, "country": "Italy", "january": 8.6, "october": 11.1, "december": 6.7, "february": 9.7, "november": 9.1, "september": 12.1, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 1698, "may": 9.8, "city": "Ascoli Piceno", "july": 10.7, "june": 9.7, "zone": "D", "april": 10.8, "march": 11.6, "august": 12.2, "country": "Italy", "january": 8.8, "october": 12.5, "december": 8.1, "february": 10.4, "november": 10, "september": 13.2, "heatingonoff": "01.11/15.04", "average_daily": ""}, {"hdd": 2617, "may": 9.3, "city": "Asti", "july": 10.2, "june": 9.2, "zone": "E", "april": 10.6, "march": 11.6, "august": 10.2, "country": "Italy", "january": 9.4, "october": 11.2, "december": 9.7, "february": 10.9, "november": 9.4, "september": 10.8, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 1742, "may": 9.9, "city": "Avellino", "july": 10.4, "june": 9.5, "zone": "D", "april": 10.9, "march": 11.1, "august": 12.3, "country": "Italy", "january": 8, "october": 14.2, "december": 7.6, "february": 10.1, "november": 10.6, "september": 13.9, "heatingonoff": "01.11/15.04", "average_daily": ""}, {"hdd": 1185, "may": 10.9, "city": "Bari", "july": 10.8, "june": 10.1, "zone": "C", "april": 12.5, "march": 13.2, "august": 13, "country": "Italy", "january": 10.9, "october": 16.4, "december": 9.6, "february": 13.3, "november": 13.1, "september": 15.2, "heatingonoff": "15.11/31.03", "average_daily": ""}, {"hdd": 3001, "may": 9.8, "city": "Belluno", "july": 10.3, "june": 9.3, "zone": "F", "april": 10.2, "march": 11.9, "august": 10.6, "country": "Italy", "january": 7.8, "october": 11.8, "december": 7.5, "february": 10.7, "november": 7.9, "september": 11.9, "heatingonoff": "01.09/30.05", "average_daily": ""}, {"hdd": 1316, "may": 9.5, "city": "Benevento", "july": 10.4, "june": 9.5, "zone": "C", "april": 10.4, "march": 11.4, "august": 12, "country": "Italy", "january": 8.8, "october": 12.9, "december": 7.7, "february": 10.7, "november": 9.7, "september": 12.7, "heatingonoff": "15.11/31.03", "average_daily": ""}, {"hdd": 2533, "may": 9.7, "city": "Bergamo", "july": 10.3, "june": 9.3, "zone": "E", "april": 10.3, "march": 11, "august": 11, "country": "Italy", "january": 7.3, "october": 11.6, "december": 7.2, "february": 9.3, "november": 7.4, "september": 11.9, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 2259, "may": 10.2, "city": "Bologna", "july": 11.1, "june": 10, "zone": "E", "april": 11.2, "march": 11.6, "august": 12, "country": "Italy", "january": 7.4, "october": 12.4, "december": 7.2, "february": 10.7, "november": 8.5, "september": 12.9, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 2791, "may": 10.3, "city": "Bolzano", "july": 10.6, "june": 9.7, "zone": "E", "april": 11.1, "march": 13.1, "august": 11, "country": "Italy", "january": 8.5, "october": 12.3, "december": 7.7, "february": 12.5, "november": 9, "september": 12.3, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 2410, "may": 10.2, "city": "Brescia", "july": 11, "june": 9.9, "zone": "E", "april": 10.6, "march": 12.3, "august": 11.8, "country": "Italy", "january": 8.2, "october": 11.7, "december": 8.4, "february": 11, "november": 9, "september": 12.6, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 1083, "may": 10.3, "city": "Brindisi", "july": 10.4, "june": 9.8, "zone": "C", "april": 11.7, "march": 12.6, "august": 12.3, "country": "Italy", "january": 11.7, "october": 15.7, "december": 10, "february": 11.6, "november": 12.5, "september": 14.4, "heatingonoff": "15.11/31.03", "average_daily": ""}, {"hdd": 990, "may": 9.6, "city": "Cagliari", "july": 10, "june": 9.2, "zone": "C", "april": 10.7, "march": 12.5, "august": 11.8, "country": "Italy", "january": 11.5, "october": 13.7, "december": 10.4, "february": 11.8, "november": 12.1, "september": 13.2, "heatingonoff": "15.11/31.03", "average_daily": ""}, {"hdd": 1550, "may": 10, "city": "Caltanissetta", "july": 9.6, "june": 9.1, "zone": "D", "april": 11.5, "march": 13.6, "august": 11.8, "country": "Italy", "january": 14.5, "october": 15.2, "december": 13.3, "february": 14.5, "november": 15.3, "september": 14.2, "heatingonoff": "01.11/15.04", "average_daily": ""}, {"hdd": 2346, "may": 10.4, "city": "Campobasso", "july": 10.5, "june": 9.8, "zone": "E", "april": 11.4, "march": 12.2, "august": 12.2, "country": "Italy", "january": 10.1, "october": 14.5, "december": 9.6, "february": 12.4, "november": 11.7, "september": 13.9, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 1013, "may": 10.4, "city": "Caserta", "july": 10.7, "june": 10, "zone": "C", "april": 11.7, "march": 13.2, "august": 12.5, "country": "Italy", "january": 11.6, "october": 16, "december": 10.4, "february": 12.5, "november": 12.7, "september": 14.5, "heatingonoff": "15.11/31.03", "average_daily": ""}, {"hdd": 833, "may": 10, "city": "Catania", "july": 9.7, "june": 9.1, "zone": "B", "april": 11.5, "march": 13.5, "august": 11.8, "country": "Italy", "january": 14.5, "october": 15.1, "december": 13.3, "february": 14.5, "november": 15.3, "september": 14.2, "heatingonoff": "01.12/31.03", "average_daily": ""}, {"hdd": 1328, "may": 9.7, "city": "Catanzaro", "july": 10, "june": 9.4, "zone": "C", "april": 10.9, "march": 10.7, "august": 12.2, "country": "Italy", "january": 11.4, "october": 14, "december": 10.5, "february": 14, "november": 11.4, "september": 12.4, "heatingonoff": "15.11/31.03", "average_daily": ""}, {"hdd": 1556, "may": 10.6, "city": "Chieti", "july": 10.7, "june": 9.8, "zone": "D", "april": 11.6, "march": 12, "august": 12.1, "country": "Italy", "january": 10.1, "october": 14.7, "december": 8.7, "february": 11.3, "november": 11, "september": 13.9, "heatingonoff": "01.11/15.04", "average_daily": ""}, {"hdd": 2228, "may": 9.2, "city": "Como", "july": 10.3, "june": 9.3, "zone": "E", "april": 10.3, "march": 10.8, "august": 10.6, "country": "Italy", "january": 8.3, "october": 11.4, "december": 7.5, "february": 9.1, "november": 8, "september": 10.9, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 1317, "may": 10.5, "city": "Cosenza", "july": 10.3, "june": 9.8, "zone": "C", "april": 12.6, "march": 15.7, "august": 12.7, "country": "Italy", "january": 12.5, "october": 14.9, "december": 13.8, "february": 15.4, "november": 15.2, "september": 15.4, "heatingonoff": "15.11/31.03", "average_daily": ""}, {"hdd": 2389, "may": 10.1, "city": "Cremona", "july": 11.1, "june": 10.2, "zone": "E", "april": 11, "march": 11, "august": 11.7, "country": "Italy", "january": 6.3, "october": 10.1, "december": 5.3, "february": 8.8, "november": 6.7, "september": 12, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 899, "may": 9.9, "city": "Crotone", "july": 9.9, "june": 9.3, "zone": "B", "april": 11.1, "march": 12.5, "august": 11.9, "country": "Italy", "january": 11.7, "october": 14.8, "december": 10.3, "february": 13.2, "november": 13.1, "september": 13.4, "heatingonoff": "01.12/31.03", "average_daily": ""}, {"hdd": 3012, "may": 8.3, "city": "Cuneo", "july": 9.4, "june": 8.4, "zone": "F", "april": 9.4, "march": 10.8, "august": 9.2, "country": "Italy", "january": 10.2, "october": 10.3, "december": 9.9, "february": 11.1, "november": 9.8, "september": 9.9, "heatingonoff": "01.09/30.05", "average_daily": ""}, {"hdd": 2248, "may": 10, "city": "Enna", "july": 9.7, "june": 9.2, "zone": "E", "april": 11.7, "march": 13.7, "august": 12, "country": "Italy", "january": 14.2, "october": 15.4, "december": 13.1, "february": 14.5, "november": 15.4, "september": 14.4, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 2326, "may": 10.3, "city": "Ferrara", "july": 10.6, "june": 9.7, "zone": "E", "april": 11.4, "march": 10.1, "august": 11.1, "country": "Italy", "january": 7.8, "october": 14.1, "december": 5.4, "february": 10.4, "november": 7, "september": 13.2, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 1821, "may": 10.4, "city": "Firenze", "july": 10.9, "june": 10, "zone": "D", "april": 11.1, "march": 11.4, "august": 12.1, "country": "Italy", "january": 9.1, "october": 13.9, "december": 8.3, "february": 10.9, "november": 9.8, "september": 13.6, "heatingonoff": "01.11/15.04", "average_daily": ""}, {"hdd": 1530, "may": 10.5, "city": "Foggia", "july": 10.5, "june": 9.8, "zone": "D", "april": 11.9, "march": 12.7, "august": 12.2, "country": "Italy", "january": 10.7, "october": 15.3, "december": 9.9, "february": 12.7, "november": 12.6, "september": 14.2, "heatingonoff": "01.11/15.04", "average_daily": ""}, {"hdd": 2087, "may": 10.7, "city": "Forlì", "july": 11.3, "june": 10.4, "zone": "D", "april": 11.5, "march": 12.1, "august": 12.6, "country": "Italy", "january": 8.2, "october": 13, "december": 7.1, "february": 10.7, "november": 8.7, "september": 14.1, "heatingonoff": "01.11/15.04", "average_daily": ""}, {"hdd": 2196, "may": 9.6, "city": "Frosinone", "july": 10.4, "june": 9.6, "zone": "E", "april": 10.7, "march": 12.6, "august": 11.8, "country": "Italy", "january": 11, "october": 14, "december": 10.1, "february": 11.8, "november": 12, "september": 13.7, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 1435, "may": 10.1, "city": "Genova", "july": 10.9, "june": 9.7, "zone": "D", "april": 10.9, "march": 12.1, "august": 11.7, "country": "Italy", "january": 9.7, "october": 13.6, "december": 9.7, "february": 11.3, "november": 9.6, "september": 12.9, "heatingonoff": "01.11/15.04", "average_daily": ""}, {"hdd": 2333, "may": 9.9, "city": "Gorizia", "july": 10.6, "june": 9.6, "zone": "E", "april": 10.7, "march": 11.1, "august": 11.8, "country": "Italy", "january": 8.2, "october": 12, "december": 7.5, "february": 9.7, "november": 9.2, "september": 12.5, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 1550, "may": 10.7, "city": "Grosseto", "july": 11, "june": 10.1, "zone": "D", "april": 11.4, "march": 11.8, "august": 12.6, "country": "Italy", "january": 10.4, "october": 14.7, "december": 8.9, "february": 11.4, "november": 10.9, "september": 13.9, "heatingonoff": "01.11/15.04", "average_daily": ""}, {"hdd": 1201, "may": 10.5, "city": "Imperia", "july": 11.2, "june": 10.2, "zone": "C", "april": 11.9, "march": 12.9, "august": 12.2, "country": "Italy", "january": 11.3, "october": 15.2, "december": 11.3, "february": 12.7, "november": 12.2, "september": 13.8, "heatingonoff": "15.11/31.03", "average_daily": ""}, {"hdd": 1866, "may": 9.2, "city": "Isernia", "july": 10.2, "june": 9.3, "zone": "D", "april": 10, "march": 11.6, "august": 11.5, "country": "Italy", "january": 9.7, "october": 12.6, "december": 8.7, "february": 11, "november": 10.5, "september": 12.8, "heatingonoff": "01.11/15.04", "average_daily": ""}, {"hdd": 1413, "may": 9.8, "city": "La Spezia", "july": 11, "june": 9.9, "zone": "D", "april": 11, "march": 12.4, "august": 12, "country": "Italy", "january": 9.3, "october": 13, "december": 9, "february": 11.8, "november": 9.5, "september": 13.3, "heatingonoff": "01.11/15.04", "average_daily": ""}, {"hdd": 2514, "may": 9.2, "city": "L'Aquila", "july": 10, "june": 8.9, "zone": "E", "april": 9.1, "march": 10.9, "august": 10.9, "country": "Italy", "january": 10.3, "october": 12.6, "december": 8.8, "february": 10.7, "november": 10.1, "september": 12.5, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 1220, "may": 10.5, "city": "Latina", "july": 10.8, "june": 10.1, "zone": "C", "april": 11.8, "march": 13.4, "august": 12.6, "country": "Italy", "january": 11.5, "october": 15.8, "december": 10.3, "february": 12.5, "november": 12.7, "september": 14.7, "heatingonoff": "15.11/31.03", "average_daily": ""}, {"hdd": 1153, "may": 10.2, "city": "Lecce", "july": 10.3, "june": 9.6, "zone": "C", "april": 11.2, "march": 12, "august": 12.2, "country": "Italy", "january": 11.1, "october": 14.6, "december": 9.8, "february": 12.4, "november": 11.2, "september": 13.9, "heatingonoff": "15.11/31.03", "average_daily": ""}, {"hdd": 2383, "may": 9.4, "city": "Lecco", "july": 10.3, "june": 9.4, "zone": "E", "april": 10.5, "march": 11.2, "august": 10.7, "country": "Italy", "january": 8.6, "october": 11.7, "december": 7.8, "february": 9.6, "november": 8.5, "september": 11.2, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 1408, "may": 10.6, "city": "Livorno", "july": 11, "june": 10.1, "zone": "D", "april": 11.4, "march": 11.6, "august": 12.3, "country": "Italy", "january": 9.4, "october": 14.4, "december": 8.6, "february": 11.2, "november": 10.1, "september": 13.9, "heatingonoff": "01.11/15.04", "average_daily": ""}, {"hdd": 2592, "may": 10, "city": "Lodi", "july": 10.9, "june": 10, "zone": "E", "april": 10.8, "march": 10.8, "august": 11.4, "country": "Italy", "january": 5.8, "october": 9.8, "december": 5.2, "february": 8.4, "november": 6.4, "september": 11.5, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 1715, "may": 9.8, "city": "Lucca", "july": 10.6, "june": 9.6, "zone": "D", "april": 10.7, "march": 11.6, "august": 11.5, "country": "Italy", "january": 9.2, "october": 13.5, "december": 7.7, "february": 10.4, "november": 9.4, "september": 13.1, "heatingonoff": "01.11/15.04", "average_daily": ""}, {"hdd": 2005, "may": 10.6, "city": "Macerata", "july": 10.7, "june": 10, "zone": "D", "april": 11.1, "march": 11.6, "august": 12, "country": "Italy", "january": 9.4, "october": 13.8, "december": 8.5, "february": 11.2, "november": 10.5, "september": 13.6, "heatingonoff": "01.11/15.04", "average_daily": ""}, {"hdd": 2388, "may": 10, "city": "Mantova", "july": 11, "june": 10.1, "zone": "E", "april": 10.6, "march": 10.5, "august": 11.5, "country": "Italy", "january": 5.8, "october": 9.5, "december": 5.3, "february": 8.3, "november": 6.4, "september": 11.4, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 1525, "may": 9.8, "city": "Massa", "july": 10.9, "june": 9.8, "zone": "D", "april": 10.9, "march": 12.1, "august": 11.8, "country": "Italy", "january": 9.3, "october": 13.2, "december": 8.5, "february": 11.3, "november": 9.5, "september": 13.2, "heatingonoff": "01.11/15.04", "average_daily": ""}, {"hdd": 1776, "may": 10, "city": "Matera", "july": 10.3, "june": 9.5, "zone": "D", "april": 11, "march": 11.5, "august": 12, "country": "Italy", "january": 10, "october": 13.4, "december": 9.7, "february": 12.3, "november": 10.5, "september": 13.8, "heatingonoff": "01.11/15.04", "average_daily": ""}, {"hdd": 707, "may": 9.9, "city": "Messina", "july": 9.7, "june": 9.2, "zone": "B", "april": 11.5, "march": 12.9, "august": 11.8, "country": "Italy", "january": 10.8, "october": 14.2, "december": 10.3, "february": 12.9, "november": 13.2, "september": 14, "heatingonoff": "01.12/31.03", "average_daily": ""}, {"hdd": 2404, "may": 10, "city": "Milano", "july": 10.8, "june": 9.8, "zone": "E", "april": 10.9, "march": 11.2, "august": 11.3, "country": "Italy", "january": 6, "october": 10.3, "december": 5.4, "february": 8.7, "november": 6.7, "september": 11.8, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 2258, "may": 10.5, "city": "Modena", "july": 10.9, "june": 10.1, "zone": "E", "april": 11.2, "march": 11.3, "august": 11.6, "country": "Italy", "january": 7.1, "october": 12.7, "december": 7.3, "february": 9, "november": 8.5, "september": 12.7, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 1034, "may": 10.4, "city": "Napoli", "july": 10.5, "june": 9.8, "zone": "C", "april": 11.4, "march": 12.5, "august": 12.3, "country": "Italy", "january": 11.1, "october": 15.5, "december": 9.8, "february": 12.2, "november": 11.9, "september": 14, "heatingonoff": "15.11/31.03", "average_daily": ""}, {"hdd": 2463, "may": 10, "city": "Novara", "july": 10.9, "june": 9.9, "zone": "E", "april": 11.1, "march": 11.5, "august": 11.4, "country": "Italy", "january": 6.5, "october": 10, "december": 5.9, "february": 9.6, "november": 7.6, "september": 12, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 1602, "may": 10.2, "city": "Nuoro", "july": 10.5, "june": 9.6, "zone": "D", "april": 11.2, "march": 12.6, "august": 12.2, "country": "Italy", "january": 11.2, "october": 14.4, "december": 10, "february": 11.9, "november": 11.7, "september": 14.1, "heatingonoff": "01.11/15.04", "average_daily": ""}, {"hdd": 1059, "may": 10, "city": "Oristano", "july": 10.3, "june": 9.4, "zone": "C", "april": 11, "march": 12.6, "august": 12.1, "country": "Italy", "january": 11.4, "october": 14.6, "december": 10, "february": 12.3, "november": 12, "september": 14, "heatingonoff": "15.11/31.03", "average_daily": ""}, {"hdd": 2383, "may": 9.5, "city": "Padova", "july": 10, "june": 9.3, "zone": "E", "april": 9.6, "march": 10.5, "august": 10.9, "country": "Italy", "january": 6.9, "october": 12, "december": 8.1, "february": 9.5, "november": 8.2, "september": 12.2, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 751, "may": 10.1, "city": "Palermo", "july": 9.8, "june": 9.3, "zone": "B", "april": 11.7, "march": 13.4, "august": 12, "country": "Italy", "january": 11.9, "october": 15.2, "december": 11, "february": 13.3, "november": 14.1, "september": 14.5, "heatingonoff": "01.12/31.03", "average_daily": ""}, {"hdd": 2502, "may": 10.5, "city": "Parma", "july": 11.4, "june": 10.4, "zone": "E", "april": 12, "march": 12.8, "august": 12.5, "country": "Italy", "january": 7.1, "october": 12.7, "december": 6.3, "february": 10.4, "november": 8.3, "september": 14.6, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 2623, "may": 10, "city": "Pavia", "july": 11, "june": 10.2, "zone": "E", "april": 10.7, "march": 10.5, "august": 11.5, "country": "Italy", "january": 5.6, "october": 9.4, "december": 5, "february": 8.2, "november": 6.2, "september": 11.4, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 2289, "may": 10.1, "city": "Perugia", "july": 10.7, "june": 9.7, "zone": "E", "april": 10.4, "march": 11.3, "august": 11.8, "country": "Italy", "january": 9.3, "october": 14.4, "december": 7.8, "february": 10, "november": 10.2, "september": 13.1, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 2083, "may": 10.2, "city": "Pesaro - Urbino", "july": 10.9, "june": 9.7, "zone": "D", "april": 11.2, "march": 11.4, "august": 12.2, "country": "Italy", "january": 6, "october": 11.8, "december": 6.4, "february": 8.8, "november": 8.4, "september": 12.9, "heatingonoff": "01.11/15.04", "average_daily": ""}, {"hdd": 1718, "may": 10.5, "city": "Pescara", "july": 10.7, "june": 9.8, "zone": "D", "april": 11.5, "march": 11.7, "august": 12, "country": "Italy", "january": 9.4, "october": 14.2, "december": 8.3, "february": 11, "november": 10.8, "september": 13.6, "heatingonoff": "01.11/15.04", "average_daily": ""}, {"hdd": 2715, "may": 10.4, "city": "Piacenza", "july": 11.2, "june": 10.2, "zone": "E", "april": 11.5, "march": 11.9, "august": 11.9, "country": "Italy", "january": 7.5, "october": 11.3, "december": 5.7, "february": 9.8, "november": 7.5, "september": 13, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 1694, "may": 10.5, "city": "Pisa", "july": 11, "june": 10.1, "zone": "D", "april": 11.4, "march": 11.6, "august": 12.3, "country": "Italy", "january": 9.2, "october": 14.3, "december": 8.5, "february": 11.1, "november": 9.9, "september": 13.9, "heatingonoff": "01.11/15.04", "average_daily": ""}, {"hdd": 1885, "may": 8.9, "city": "Pistoia", "july": 10.2, "june": 8.8, "zone": "D", "april": 9.5, "march": 10.4, "august": 11.1, "country": "Italy", "january": 8.4, "october": 12.3, "december": 7.6, "february": 9.9, "november": 9, "september": 12.1, "heatingonoff": "01.11/15.04", "average_daily": ""}, {"hdd": 2459, "may": 9.6, "city": "Pordenone", "july": 10.3, "june": 9.5, "zone": "E", "april": 9.9, "march": 11.1, "august": 11.5, "country": "Italy", "january": 8.2, "october": 12.2, "december": 7.5, "february": 10.7, "november": 7.6, "september": 12.4, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 2472, "may": 9.7, "city": "Potenza", "july": 10.2, "june": 9.5, "zone": "E", "april": 10.7, "march": 11.4, "august": 11.6, "country": "Italy", "january": 9.2, "october": 13.2, "december": 8.9, "february": 10.8, "november": 11.2, "september": 12.9, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 1668, "may": 9.2, "city": "Prato", "july": 10.3, "june": 9.1, "zone": "D", "april": 9.9, "march": 10.7, "august": 11.4, "country": "Italy", "january": 8.6, "october": 12.8, "december": 7.8, "february": 10.2, "november": 9.2, "september": 12.5, "heatingonoff": "01.11/15.04", "average_daily": ""}, {"hdd": 1324, "may": 9.8, "city": "Ragusa", "july": 9.4, "june": 8.9, "zone": "C", "april": 11.8, "march": 14.4, "august": 11.5, "country": "Italy", "january": 14, "october": 17.2, "december": 11.7, "february": 14, "november": 17, "september": 14.4, "heatingonoff": "15.11/31.03", "average_daily": ""}, {"hdd": 2227, "may": 10.2, "city": "Ravenna", "july": 11, "june": 10.1, "zone": "E", "april": 11.5, "march": 12.2, "august": 11.9, "country": "Italy", "january": 7.1, "october": 11.7, "december": 5.9, "february": 9.1, "november": 8, "september": 13, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 772, "may": 9.9, "city": "Reggio Calabria", "july": 9.7, "june": 9.3, "zone": "B", "april": 11.6, "march": 12.4, "august": 11.9, "country": "Italy", "january": 11.4, "october": 14.1, "december": 10.7, "february": 14, "november": 13.4, "september": 14.1, "heatingonoff": "01.12/31.03", "average_daily": ""}, {"hdd": 2560, "may": 10.5, "city": "Reggio Emilia", "july": 11.1, "june": 10.2, "zone": "E", "april": 11.4, "march": 11.7, "august": 11.9, "country": "Italy", "january": 7.1, "october": 12.7, "december": 7, "february": 9.4, "november": 8.5, "september": 13.2, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 2324, "may": 9.2, "city": "Rieti", "july": 9.9, "june": 8.8, "zone": "E", "april": 9, "march": 10.6, "august": 10.8, "country": "Italy", "january": 10.2, "october": 12.7, "december": 8.5, "february": 10.6, "november": 9.8, "september": 12.4, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 2139, "may": 10.4, "city": "Rimini", "july": 11, "june": 10.1, "zone": "E", "april": 10.9, "march": 12.2, "august": 12.3, "country": "Italy", "january": 7.5, "october": 13, "december": 7.1, "february": 10.4, "november": 9.2, "september": 13.6, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 1415, "may": 10.6, "city": "Roma", "july": 10.8, "june": 9.9, "zone": "D", "april": 11.6, "march": 12.6, "august": 12.4, "country": "Italy", "january": 10.6, "october": 15.1, "december": 9.3, "february": 11.9, "november": 11.8, "september": 14.2, "heatingonoff": "01.11/15.04", "average_daily": ""}, {"hdd": 2466, "may": 10.6, "city": "Rovigo", "july": 11.3, "june": 10.5, "zone": "E", "april": 10.7, "march": 11.6, "august": 12.7, "country": "Italy", "january": 6.2, "october": 11.3, "december": 7, "february": 10, "november": 7.5, "september": 12.8, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 994, "may": 9, "city": "Salerno", "july": 9.7, "june": 9, "zone": "C", "april": 9.4, "march": 10.2, "august": 10.8, "country": "Italy", "january": 9.3, "october": 12.7, "december": 8.4, "february": 9.7, "november": 10.3, "september": 11.8, "heatingonoff": "15.11/31.03", "average_daily": ""}, {"hdd": 1185, "may": 10.5, "city": "Sassari", "july": 10.6, "june": 9.8, "zone": "C", "april": 11.4, "march": 12.8, "august": 12.3, "country": "Italy", "january": 11.1, "october": 15.3, "december": 9.7, "february": 12.4, "november": 11.7, "september": 14.7, "heatingonoff": "15.11/31.03", "average_daily": ""}, {"hdd": 1481, "may": 9.6, "city": "Savona", "july": 10.5, "june": 9.3, "zone": "D", "april": 10.7, "march": 12, "august": 11, "country": "Italy", "january": 10, "october": 13.1, "december": 9.7, "february": 11.4, "november": 10.6, "september": 12.6, "heatingonoff": "01.11/15.04", "average_daily": ""}, {"hdd": 1943, "may": 9.8, "city": "Siena", "july": 10.4, "june": 9.6, "zone": "D", "april": 10.1, "march": 10.7, "august": 11.4, "country": "Italy", "january": 9.1, "october": 12.2, "december": 7.4, "february": 10.2, "november": 9.7, "september": 12.7, "heatingonoff": "01.11/15.04", "average_daily": ""}, {"hdd": 799, "may": 10, "city": "Siracusa", "july": 9.5, "june": 9, "zone": "B", "april": 11.9, "march": 14.4, "august": 11.8, "country": "Italy", "january": 13.9, "october": 16.9, "december": 12.5, "february": 14.6, "november": 16.3, "september": 14.8, "heatingonoff": "01.12/31.03", "average_daily": ""}, {"hdd": 2755, "may": 10.7, "city": "Sondrio", "july": 10.4, "june": 10, "zone": "E", "april": 12, "march": 15.1, "august": 11.9, "country": "Italy", "january": 11.5, "october": 13.8, "december": 10.3, "february": 14, "november": 13.5, "september": 14.1, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 1071, "may": 10.3, "city": "Taranto", "july": 10.5, "june": 9.8, "zone": "C", "april": 11.6, "march": 12.7, "august": 12.3, "country": "Italy", "january": 11.2, "october": 15, "december": 10.2, "february": 12.5, "november": 12.5, "september": 14.3, "heatingonoff": "15.11/31.03", "average_daily": ""}, {"hdd": 1834, "may": 10, "city": "Teramo", "july": 10.6, "june": 9.6, "zone": "D", "april": 10.9, "march": 11.4, "august": 12.2, "country": "Italy", "january": 9.2, "october": 13.1, "december": 8.6, "february": 10.8, "november": 10.6, "september": 12.9, "heatingonoff": "01.11/15.04", "average_daily": ""}, {"hdd": 1650, "may": 9.4, "city": "Terni", "july": 10.2, "june": 9.1, "zone": "D", "april": 9.5, "march": 11.4, "august": 11.3, "country": "Italy", "january": 9.5, "october": 13, "december": 8, "february": 10.2, "november": 10.6, "september": 13, "heatingonoff": "01.11/15.04", "average_daily": ""}, {"hdd": 2617, "may": 9.8, "city": "Torino", "july": 10.6, "june": 9.5, "zone": "E", "april": 11.2, "march": 11.9, "august": 10.7, "country": "Italy", "january": 9, "october": 11.6, "december": 9.6, "february": 10.8, "november": 9.2, "september": 11.2, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 810, "may": 10.3, "city": "Trapani", "july": 9.9, "june": 9.3, "zone": "B", "april": 12.1, "march": 14.2, "august": 12.3, "country": "Italy", "january": 13.6, "october": 16.6, "december": 12.1, "february": 13.9, "november": 15.3, "september": 15.2, "heatingonoff": "01.12/31.03", "average_daily": ""}, {"hdd": 2567, "may": 10.5, "city": "Trento", "july": 11.2, "june": 10.2, "zone": "F", "april": 11.9, "march": 14.3, "august": 11.9, "country": "Italy", "january": 9.6, "october": 12.4, "december": 8.2, "february": 12.6, "november": 9.8, "september": 13.6, "heatingonoff": "01.09/30.05", "average_daily": ""}, {"hdd": 2378, "may": 10.2, "city": "Treviso", "july": 11, "june": 10.3, "zone": "E", "april": 10.5, "march": 12, "august": 12.3, "country": "Italy", "january": 8.1, "october": 12.4, "december": 7.5, "february": 11.5, "november": 8, "september": 13.1, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 2102, "may": 10, "city": "Trieste", "july": 10.7, "june": 9.6, "zone": "E", "april": 10.3, "march": 10.7, "august": 11.7, "country": "Italy", "january": 7.3, "october": 12.4, "december": 7.2, "february": 9.8, "november": 8.5, "september": 12.7, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 2323, "may": 9.7, "city": "Udine", "july": 10.3, "june": 9.2, "zone": "E", "april": 10.2, "march": 10.6, "august": 11.2, "country": "Italy", "january": 8, "october": 12.4, "december": 7.9, "february": 9.6, "november": 8.4, "september": 12.1, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 2652, "may": 9.6, "city": "Varese", "july": 10.2, "june": 9.3, "zone": "E", "april": 10.2, "march": 11.1, "august": 10.7, "country": "Italy", "january": 9.4, "october": 11.4, "december": 9.8, "february": 10.2, "november": 10, "september": 11.6, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 2345, "may": 10.8, "city": "Venezia", "july": 11.8, "june": 10.8, "zone": "E", "april": 11.2, "march": 12.4, "august": 12.8, "country": "Italy", "january": 7.9, "october": 12.7, "december": 7.8, "february": 11.6, "november": 9, "september": 13.7, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 2426, "may": 9.3, "city": "Verbania", "july": 10.7, "june": 9.8, "zone": "E", "april": 11.3, "march": 11.2, "august": 10.8, "country": "Italy", "january": 10.2, "october": 11.7, "december": 9.9, "february": 10.4, "november": 10.9, "september": 12.3, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 2751, "may": 10, "city": "Vercelli", "july": 10.9, "june": 9.7, "zone": "E", "april": 11, "march": 11.4, "august": 11.4, "country": "Italy", "january": 6.9, "october": 10.1, "december": 6, "february": 9.5, "november": 7.6, "september": 11.9, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 2468, "may": 9.5, "city": "Verona", "july": 10, "june": 9.3, "zone": "E", "april": 9.6, "march": 10.5, "august": 10.9, "country": "Italy", "january": 6.9, "october": 11.9, "december": 8, "february": 9.5, "november": 8.1, "september": 12.1, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 2371, "may": 9.8, "city": "Vicenza", "july": 10.2, "june": 9.5, "zone": "E", "april": 10.1, "march": 11.5, "august": 11.4, "country": "Italy", "january": 8.5, "october": 12, "december": 9, "february": 10.4, "november": 9.6, "september": 12.5, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 1989, "may": 9.8, "city": "Viterbo", "july": 10.3, "june": 9.4, "zone": "D", "april": 10, "march": 11.8, "august": 11.6, "country": "Italy", "january": 9.9, "october": 13.9, "december": 8.7, "february": 10.9, "november": 11.3, "september": 13.5, "heatingonoff": "01.11/15.04", "average_daily": ""}, {"hdd": 729, "may": 10.2, "city": "Kaunas", "july": 9.7, "june": 9.2, "zone": "B", "april": 12.2, "march": 14.4, "august": 12.3, "country": "Lithuania", "january": 13.8, "october": 16.4, "december": 13.7, "february": 15.4, "november": 15.3, "september": 15.3, "heatingonoff": "01.12/31.03", "average_daily": ""}, {"hdd": 2559, "may": 9.3, "city": "Klaipėda", "july": 10.2, "june": 9.1, "zone": "E", "april": 10.3, "march": 11.1, "august": 10.4, "country": "Lithuania", "january": 8.4, "october": 10.2, "december": 7.8, "february": 10.2, "november": 8.6, "september": 11, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 1688, "may": 10.8, "city": "Vilnius", "july": 11, "june": 9.9, "zone": "D", "april": 11.7, "march": 11.3, "august": 12.2, "country": "Lithuania", "january": 6.6, "october": 13, "december": 6.7, "february": 9.7, "november": 8.6, "september": 13.2, "heatingonoff": "01.11/15.04", "average_daily": ""}, {"hdd": 729, "may": 10.2, "city": "Barcellona", "july": 9.7, "june": 9.2, "zone": "B", "april": 12.2, "march": 14.4, "august": 12.3, "country": "Spain", "january": 13.8, "october": 16.4, "december": 13.7, "february": 15.4, "november": 15.3, "september": 15.3, "heatingonoff": "01.12/31.03", "average_daily": ""}, {"hdd": 2559, "may": 9.3, "city": "Madrid", "july": 10.2, "june": 9.1, "zone": "E", "april": 10.3, "march": 11.1, "august": 10.4, "country": "Spain", "january": 8.4, "october": 10.2, "december": 7.8, "february": 10.2, "november": 8.6, "september": 11, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 1688, "may": 10.8, "city": "Malaga", "july": 11, "june": 9.9, "zone": "D", "april": 11.7, "march": 11.3, "august": 12.2, "country": "Spain", "january": 6.6, "october": 13, "december": 6.7, "february": 9.7, "november": 8.6, "september": 13.2, "heatingonoff": "01.11/15.04", "average_daily": ""}, {"hdd": 2850, "may": 9.3, "city": "Valencia", "july": 9.8, "june": 9.1, "zone": "E", "april": 10.4, "march": 12.1, "august": 10.3, "country": "Spain", "january": 10.3, "october": 10.8, "december": 10.2, "february": 11.6, "november": 11.2, "september": 11, "heatingonoff": "15.10/15.04", "average_daily": ""}, {"hdd": 2921, "may": 11.750399999999999, "city": "Norderney", "july": 10.6272, "june": 10.2816, "zone": "", "april": 11.5776, "march": 8.8128, "august": 10.8864, "country": "Germany", "january": 3.8016, "october": 7.430400000000001, "december": 2.3328, "february": 7.430400000000001, "november": 4.8384, "september": 9.504000000000001, "heatingonoff": "01.09/31.05", "average_daily": ""}, {"hdd": 3172, "may": 10.6272, "city": "Hamburg", "july": 9.763200000000001, "june": 9.072000000000001, "zone": "", "april": 9.936, "march": 7.344, "august": 10.1088, "country": "Germany", "january": 3.456, "october": 6.9984, "december": 2.3328, "february": 6.566400000000001, "november": 4.5792, "september": 8.5536, "heatingonoff": "01.09/05.06", "average_daily": ""}, {"hdd": 3193, "may": 12.3552, "city": "Rostock", "july": 11.491200000000001, "june": 10.8864, "zone": "", "april": 11.404800000000002, "march": 8.4672, "august": 11.664000000000001, "country": "Germany", "january": 2.5056, "october": 7.516800000000001, "december": 2.4192, "february": 5.8751999999999995, "november": 4.4928, "september": 10.2816, "heatingonoff": "01.09/03.06", "average_daily": ""}, {"hdd": 3222, "may": 10.5408, "city": "Potsdam", "july": 10.368, "june": 9.3312, "zone": "", "april": 9.936, "march": 8.208, "august": 10.972800000000001, "country": "Germany", "january": 3.5424, "october": 7.776000000000001, "december": 2.592, "february": 6.912, "november": 4.5792, "september": 9.504000000000001, "heatingonoff": "01.09/22.05", "average_daily": ""}, {"hdd": 3150, "may": 10.8, "city": "Braunschweig", "july": 10.1952, "june": 9.5904, "zone": "", "april": 10.0224, "march": 8.035200000000001, "august": 10.5408, "country": "Germany", "january": 3.9744000000000006, "october": 7.516800000000001, "december": 2.592, "february": 7.0848, "november": 4.9248, "september": 8.9856, "heatingonoff": "01.09/24.05", "average_daily": ""}, {"hdd": 3466, "may": 9.936, "city": "Erfurt", "july": 9.763200000000001, "june": 9.1584, "zone": "", "april": 9.504000000000001, "march": 8.2944, "august": 9.936, "country": "Germany", "january": 4.32, "october": 7.344, "december": 2.7648, "february": 6.912, "november": 4.32, "september": 8.5536, "heatingonoff": "01.09/07.06", "average_daily": ""}, {"hdd": 3100, "may": 9.5904, "city": "Münster", "july": 9.3312, "june": 8.64, "zone": "", "april": 9.4176, "march": 7.1712, "august": 9.504000000000001, "country": "Germany", "january": 3.6288, "october": 7.344, "december": 2.2464, "february": 6.912, "november": 4.4928, "september": 8.208, "heatingonoff": "01.09/29.05", "average_daily": ""}, {"hdd": 3047, "may": 9.936, "city": "Trier", "july": 10.1088, "june": 9.3312, "zone": "", "april": 9.936, "march": 8.5536, "august": 10.4544, "country": "Germany", "january": 3.5424, "october": 6.912, "december": 2.6784, "february": 7.1712, "november": 4.2336, "september": 9.5904, "heatingonoff": "01.09/26.05", "average_daily": ""}, {"hdd": 3160, "may": 10.4544, "city": "Leipzig", "july": 9.8496, "june": 9.2448, "zone": "", "april": 9.936, "march": 9.3312, "august": 11.1456, "country": "Germany", "january": 5.9616, "october": 9.072000000000001, "december": 4.2336, "february": 9.4176, "november": 5.7888, "september": 9.763200000000001, "heatingonoff": "01.09/21.05", "average_daily": ""}, {"hdd": 3954, "may": 9.1584, "city": "Hof", "july": 8.7264, "june": 7.948800000000001, "zone": "", "april": 9.8496, "march": 9.763200000000001, "august": 9.504000000000001, "country": "Germany", "january": 6.2208, "october": 10.0224, "december": 4.1472, "february": 9.1584, "november": 6.2208, "september": 9.504000000000001, "heatingonoff": "01.09/26.06", "average_daily": ""}, {"hdd": 3112, "may": 10.1952, "city": "Würzburg", "july": 10.2816, "june": 9.504000000000001, "zone": "", "april": 10.1088, "march": 8.8128, "august": 10.4544, "country": "Germany", "january": 4.0607999999999995, "october": 7.948800000000001, "december": 3.1104, "february": 7.862400000000001, "november": 5.0112, "september": 10.368, "heatingonoff": "01.09/19.05", "average_daily": ""}, {"hdd": 3147, "may": 9.936, "city": "Saarbrücken", "july": 10.1088, "june": 9.2448, "zone": "", "april": 9.8496, "march": 8.208, "august": 10.2816, "country": "Germany", "january": 3.8016, "october": 7.6032, "december": 2.9375999999999998, "february": 7.6896, "november": 5.0976, "september": 10.1088, "heatingonoff": "01.09/29.05", "average_daily": ""}, {"hdd": 3053, "may": 9.4176, "city": "Konstanz", "july": 10.1952, "june": 9.5904, "zone": "", "april": 9.4176, "march": 9.1584, "august": 11.1456, "country": "Germany", "january": 4.752000000000001, "october": 8.8992, "december": 4.4928, "february": 7.776000000000001, "november": 6.3936, "september": 10.972800000000001, "heatingonoff": "01.09./15.05", "average_daily": ""}, {"hdd": 3275, "may": 10.0224, "city": "München", "july": 10.0224, "june": 9.3312, "zone": "", "april": 10.1088, "march": 9.5904, "august": 10.7136, "country": "Germany", "january": 5.0112, "october": 9.2448, "december": 3.9744000000000006, "february": 8.64, "november": 5.8751999999999995, "september": 10.7136, "heatingonoff": "01.09/22.05", "average_daily": ""}, {"hdd": 3773, "may": 9.5904, "city": "Garmisch-Partenkirchen", "july": 9.936, "june": 9.072000000000001, "zone": "", "april": 10.368, "march": 11.1456, "august": 10.6272, "country": "Germany", "january": 9.072000000000001, "october": 11.491200000000001, "december": 7.6896, "february": 10.972800000000001, "november": 9.1584, "september": 11.232000000000001, "heatingonoff": "01.09./20.06", "average_daily": ""}]	tools_default_data.xlsx
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: renonbill
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: renonbill
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	api	project
8	api	constants
9	api	case
10	api	bpinvestment
11	api	ocproject
12	api	bpproject
13	api	bpcase
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: renonbill
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-08-15 12:37:45.513466+00
2	auth	0001_initial	2021-08-15 12:37:45.63983+00
3	admin	0001_initial	2021-08-15 12:37:45.67353+00
4	admin	0002_logentry_remove_auto_add	2021-08-15 12:37:45.687728+00
5	admin	0003_logentry_add_action_flag_choices	2021-08-15 12:37:45.701626+00
6	api	0001_initial	2021-08-15 12:37:45.760476+00
7	api	0002_auto_20210702_1622	2021-08-15 12:37:45.774472+00
8	api	0003_auto_20210705_1029	2021-08-15 12:37:45.830611+00
9	api	0004_remove_case_name	2021-08-15 12:37:45.842927+00
10	api	0005_alter_constants_user	2021-08-15 12:37:45.900608+00
11	api	0006_constants_file	2021-08-15 12:37:45.9238+00
12	api	0007_alter_constants_file	2021-08-15 12:37:45.943907+00
13	api	0008_alter_constants_file	2021-08-15 12:37:45.96271+00
14	api	0009_remove_constants_file	2021-08-15 12:37:45.984936+00
15	api	0010_constants_file	2021-08-15 12:37:46.005848+00
16	api	0005_auto_20210712_1156	2021-08-15 12:37:46.10171+00
17	api	0006_constants_city_climate	2021-08-15 12:37:46.125685+00
18	api	0011_merge_0006_constants_city_climate_0010_constants_file	2021-08-15 12:37:46.131567+00
19	api	0012_alter_project_user	2021-08-15 12:37:46.150474+00
20	api	0013_auto_20210729_1126	2021-08-15 12:37:46.243961+00
21	api	0014_auto_20210729_1126	2021-08-15 12:37:46.387448+00
22	api	0015_constants_file_name	2021-08-15 12:37:46.412096+00
23	contenttypes	0002_remove_content_type_name	2021-08-15 12:37:46.464709+00
24	auth	0002_alter_permission_name_max_length	2021-08-15 12:37:46.489596+00
25	auth	0003_alter_user_email_max_length	2021-08-15 12:37:46.514397+00
26	auth	0004_alter_user_username_opts	2021-08-15 12:37:46.53425+00
27	auth	0005_alter_user_last_login_null	2021-08-15 12:37:46.581227+00
28	auth	0006_require_contenttypes_0002	2021-08-15 12:37:46.592375+00
29	auth	0007_alter_validators_add_error_messages	2021-08-15 12:37:46.611265+00
30	auth	0008_alter_user_username_max_length	2021-08-15 12:37:46.635085+00
31	auth	0009_alter_user_last_name_max_length	2021-08-15 12:37:46.661473+00
32	auth	0010_alter_group_name_max_length	2021-08-15 12:37:46.682694+00
33	auth	0011_update_proxy_permissions	2021-08-15 12:37:46.703754+00
34	auth	0012_alter_user_first_name_max_length	2021-08-15 12:37:46.739435+00
35	sessions	0001_initial	2021-08-15 12:37:46.761394+00
36	api	0016_project_rating_data	2022-03-25 20:45:30.765015+00
37	api	0017_project_report_data	2022-03-25 20:45:30.780197+00
38	api	0018_alter_project_rating_data	2022-03-25 20:45:30.790009+00
39	api	0019_alter_project_report_data	2022-03-25 20:45:30.799558+00
40	api	0020_bpcase_bpinvestment_bpproject_ocproject	2022-03-25 20:45:30.927123+00
41	api	0021_alter_bpinvestment_name	2022-03-25 20:45:30.939417+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: renonbill
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: oc_projects; Type: TABLE DATA; Schema: public; Owner: renonbill
--

COPY public.oc_projects (id, value, investment_id, project_id) FROM stdin;
2	5	10	12
3	10	6	12
4	3	7	12
5	1	8	12
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: renonbill
--

COPY public.projects (id, name, params, user_id, rating_data, report_data) FROM stdin;
12	test	{"bp_year": 6, "max_IRR": 15, "max_NPV": 10000, "min_IRR": 7, "min_NPV": 0, "max_Esav": 60, "min_Esav": 5, "loan_rate": 3, "max_Epsav": "", "min_Epsav": "", "loan_check": false, "noise_flag": 1, "weight_IRR": 1, "weight_NPV": 1, "unit_option": "optionkwh", "weight_Esav": 1, "max_Dpayback": 5, "min_Dpayback": 20, "weight_Epsav": "", "loan_amount_%": 80, "max_loss_risk": 0, "min_loss_risk": 10, "HDD_confidence": 20, "max_churn_rate": 1, "min_churn_rate": 10, "HDD_noise_check": false, "weight_Dpayback": 1, "Uroof_confidence": 20, "Uwall_confidence": 20, "confidence_level": 95, "incentives_check": false, "max_default_rate": 0, "min_default_rate": 5, "weight_loss_risk": 1, "Sfloor_confidence": 10, "Ufloor_confidence": 20, "Uroof_noise_check": false, "Uwall_noise_check": true, "loan_refund_years": 10, "shadow_confidence": 20, "weight_churn_rate": 1, "Sfloor_noise_check": true, "Ufloor_noise_check": false, "he_conv_confidence": 10, "shadow_noise_check": false, "time_horizon_years": 20, "Uwindows_confidence": 20, "geometry_confidence": 10, "he_conv_noise_check": false, "incentives_amount_%": 65, "weight_default_rate": 1, "Uwindows_noise_check": false, "geometry_noise_check": true, "solar_RAD_confidence": 10, "air_change_confidence": 20, "fuel_cost_noise_check": false, "investment_confidence": 10, "solar_RAD_noise_check": false, "sun_factor_confidence": 10, "air_change_noise_check": false, "environment_confidence": 20, "fixed_costs_confidence": 10, "investment_noise_check": false, "sun_factor_noise_check": false, "wall_height_confidence": 5, "alfa_plaster_confidence": 15, "efficiencies_confidence": 5, "emission_eff_confidence": 5, "energy_cost_noise_check": false, "environment_noise_check": true, "fixed_costs_noise_check": false, "heating_days_confidence": 5, "incentives_refund_years": 10, "pellet_cost_noise_check": false, "sd_vol_ratio_confidence": 10, "thermal_prop_confidence": 10, "wall_height_noise_check": true, "alfa_plaster_noise_check": false, "discount_rate_confidence": 10, "efficiencies_noise_check": true, "emission_eff_noise_check": false, "heating_days_noise_check": false, "sd_vol_ratio_noise_check": false, "thermal_prop_noise_check": false, "DHW_burner_eff_confidence": 5, "discount_rate_noise_check": false, "electric_cost_noise_check": false, "regulation_eff_confidence": 5, "roof_thickness_confidence": 5, "uncertainty_advanced_flag": 0, "wall_thickness_confidence": 5, "DHW_burner_eff_noise_check": true, "floor_thickness_confidence": 5, "fuel_cost_confidence_final": 20, "fuel_cost_confidence_today": 1, "number_of_monte_carlo_runs": 100, "regulation_eff_noise_check": false, "roof_thickness_noise_check": false, "wall_thickness_noise_check": false, "distribution_eff_confidence": 5, "floor_thickness_noise_check": false, "DHW_heat_pump_COP_confidence": 15, "advanced_DHW_load_confidence": 5, "distribution_eff_noise_check": false, "energy_cost_confidence_final": 10, "energy_cost_confidence_today": 1, "pellet_cost_confidence_final": 20, "pellet_cost_confidence_today": 1, "DHW_heat_pump_COP_noise_check": false, "DHW_solar_fraction_confidence": 10, "advanced_DHW_load_noise_check": false, "heating_burner_eff_confidence": 5, "heating_pellet_eff_confidence": 5, "window_floor_ratio_confidence": 5, "DHW_solar_fraction_noise_check": false, "electric_cost_confidence_final": 20, "electric_cost_confidence_today": 1, "heating_burner_eff_noise_check": true, "heating_pellet_eff_noise_check": false, "simplified_DHW_load_confidence": 10, "window_floor_ratio_noise_check": false, "simplified_DHW_load_noise_check": false, "heating_heat_pump_COP_confidence": 15, "heating_heat_pump_COP_noise_check": false, "heating_solar_fraction_confidence": 10, "DHW_electric_boiler_eff_confidence": 5, "heating_solar_fraction_noise_check": false, "DHW_electric_boiler_eff_noise_check": false, "roof_thermal_conductivity_confidence": 5, "wall_thermal_conductivity_confidence": 5, "floor_thermal_conductivity_confidence": 5, "roof_thermal_conductivity_noise_check": false, "wall_thermal_conductivity_noise_check": false, "floor_thermal_conductivity_noise_check": false}	1	{"irr": 0, "dex_2": 0, "erate": 0, "esaved": 0.13636363636353258, "irr_xi": 0, "exp_van": 0, "dpb_zero": 0, "exp_dpbp": 0, "irr_cb_95": 0, "dev_dpbp_2": 0, "erate_cb952": 0, "neg_per_run": 0, "van_mc_zero": 0, "schrun_billnew": 0.0, "sdeafu_billnew": 0.0, "schrun95_billnew": 0.0, "sdeafu95_billnew": 0.0}	{"28": {"saved_fuel_bill": 127.7091051706388, "current_fuel_bill": 439.23535367782705, "planned_fuel_bill": 311.52624850718826, "saved_fuel_energy": 582.3562076556507, "current_fuel_energy": 4270.612189474776, "planned_fuel_energy": 3688.2559818191253, "saved_electric_bill": 0.0, "current_electric_bill": 0.0000000007234331770889148, "planned_electric_bill": 0.0000000007234331770889148, "saved_dhw_energy_loss": 0.0, "saved_electric_energy": 0.0, "current_dhw_energy_loss": 1526.43, "current_electric_energy": 0.0000000032456652640008294, "planned_dhw_energy_loss": 1526.43, "planned_electric_energy": 0.0000000032456652640008294, "saved_heating_energy_loss": 0.0, "current_heating_energy_loss": 1361.3770703866367, "planned_heating_energy_loss": 1361.3770703866367}, "vita": 30, "country": "Italy", "vitamax": 30, "benefits": {"project_rating": 0, "project_benefit": 0}, "floor_area": 100, "pub_rating": {"score_1": 0, "score_2": 0, "cb_values": {"1": 0, "2": 0, "3": 0, "4": 0, "5": 0, "6": 0, "7": 0}, "exp_values": {"1": 0, "2": 0, "3": 0, "4": 0, "5": 0, "6": 0, "7": 0}, "max_values": {"1": 60, "2": 10000, "3": 15, "4": 7, "5": 0, "6": 0, "7": 0}, "min_values": {"1": 5, "2": 0, "3": 7, "4": 20, "5": 10, "6": 15, "7": 5}, "rating_values": {"1": 0, "2": 0, "3": 0, "4": 0, "5": 0, "6": 0, "7": 0}, "weight_values": {"1": 1, "2": 1, "3": 1, "4": 1, "5": 1, "6": 1, "7": 1}}, "van_mc_values": {"cb+": {}, "cb-": {}, "irr": {"value": 0, "conf_bound": 0, "value_at_risk": 0, "cond_value_at_risk": 0}, "npv": {"value": 0, "conf_bound": 0, "value_at_risk": 0, "cond_value_at_risk": 0}, "dpbp": {"value": 0, "conf_bound": 0, "value_at_risk": 0, "cond_value_at_risk": 0}, "qNPV": {}}, "financial_values": {"DPBP": 0, "qNPV": {}, "LabPI": 0}, "individual_costs": {"total_cost": 900, "window_cost": 0, "dhw_solar_cost": 0, "dhw_generator_cost": 0, "heating_solar_cost": 0, "roof_envelope_cost": 0, "wall_envelope_cost": 0, "floor_envelope_cost": 0, "heating_emitter_cost": 0, "heating_generator_cost": 900}, "investment_values": {"loan_rate": 3, "loan_check": false, "total_cost": "900.0", "bonus_check": false, "loan_amount": "0.0", "bonus_amount": "0.0", "loan_amount_%": 0, "bonus_amount_%": 0, "total_cost_loan": "900.0", "loan_refund_years": 10, "bonus_refund_years": 10}, "monte_carlo_values": {"bill_savings": {"value": 0, "conf_bound": 0, "value_at_risk": 0, "cond_value_at_risk": 0}, "energy_saving": {"value": 0, "conf_bound": 0, "value_at_risk": 0, "cond_value_at_risk": 0}, "intervention_cost": {"value": 0, "conf_bound": 0, "value_at_risk": 0, "cond_value_at_risk": 0}}, "number_of_dwellings": 1, "total_costifissi_values": {"total_saved_fuel_bill": "127.7", "total_current_fuel_bill": "439.2", "total_planned_fuel_bill": "311.5", "total_saved_energy_bill": "127.7", "total_saved_energy_cons": "582.4", "total_saved_energy_loss": "0.0", "total_saved_fuel_energy": "582.4", "total_current_energy_bill": "439.2", "total_current_energy_cons": "4,270.6", "total_current_energy_loss": "2,887.8", "total_current_fuel_energy": "4,270.6", "total_planned_energy_bill": "311.5", "total_planned_energy_cons": "3,688.3", "total_planned_energy_loss": "2,887.8", "total_planned_fuel_energy": "3,688.3", "total_saved_electric_bill": "0.0", "total_current_electric_bill": "0.0", "total_planned_electric_bill": "0.0", "total_saved_dhw_energy_loss": "0.0", "total_saved_electric_energy": "0.0", "total_current_dhw_energy_loss": "1,526.4", "total_current_electric_energy": "0.0", "total_planned_dhw_energy_loss": "1,526.4", "total_planned_electric_energy": "0.0", "total_saved_heating_energy_loss": "0.0", "total_current_heating_energy_loss": "1,361.4", "total_planned_heating_energy_loss": "1,361.4"}}
\.


--
-- Name: api_case_id_seq; Type: SEQUENCE SET; Schema: public; Owner: renonbill
--

SELECT pg_catalog.setval('public.api_case_id_seq', 28, true);


--
-- Name: api_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: renonbill
--

SELECT pg_catalog.setval('public.api_project_id_seq', 12, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: renonbill
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: renonbill
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: renonbill
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 52, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: renonbill
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: renonbill
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: renonbill
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: bp_cases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: renonbill
--

SELECT pg_catalog.setval('public.bp_cases_id_seq', 99, true);


--
-- Name: bp_investments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: renonbill
--

SELECT pg_catalog.setval('public.bp_investments_id_seq', 10, true);


--
-- Name: bp_projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: renonbill
--

SELECT pg_catalog.setval('public.bp_projects_id_seq', 9, true);


--
-- Name: constants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: renonbill
--

SELECT pg_catalog.setval('public.constants_id_seq', 1, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: renonbill
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: renonbill
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: renonbill
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 41, true);


--
-- Name: oc_projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: renonbill
--

SELECT pg_catalog.setval('public.oc_projects_id_seq', 5, true);


--
-- Name: cases api_case_pkey; Type: CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.cases
    ADD CONSTRAINT api_case_pkey PRIMARY KEY (id);


--
-- Name: projects api_project_pkey; Type: CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT api_project_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: bp_cases bp_cases_pkey; Type: CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.bp_cases
    ADD CONSTRAINT bp_cases_pkey PRIMARY KEY (id);


--
-- Name: bp_investments bp_investments_name_85ce9651_uniq; Type: CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.bp_investments
    ADD CONSTRAINT bp_investments_name_85ce9651_uniq UNIQUE (name);


--
-- Name: bp_investments bp_investments_pkey; Type: CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.bp_investments
    ADD CONSTRAINT bp_investments_pkey PRIMARY KEY (id);


--
-- Name: bp_projects bp_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.bp_projects
    ADD CONSTRAINT bp_projects_pkey PRIMARY KEY (id);


--
-- Name: constants constants_pkey; Type: CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.constants
    ADD CONSTRAINT constants_pkey PRIMARY KEY (id);


--
-- Name: constants constants_user_id_9dd0aacb_uniq; Type: CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.constants
    ADD CONSTRAINT constants_user_id_9dd0aacb_uniq UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: oc_projects oc_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.oc_projects
    ADD CONSTRAINT oc_projects_pkey PRIMARY KEY (id);


--
-- Name: api_case_project_id_882b99d6; Type: INDEX; Schema: public; Owner: renonbill
--

CREATE INDEX api_case_project_id_882b99d6 ON public.cases USING btree (project_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: renonbill
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: renonbill
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: renonbill
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: renonbill
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: renonbill
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: renonbill
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: renonbill
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: renonbill
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: renonbill
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: bp_cases_case_id_75e4626e; Type: INDEX; Schema: public; Owner: renonbill
--

CREATE INDEX bp_cases_case_id_75e4626e ON public.bp_cases USING btree (case_id);


--
-- Name: bp_investments_name_85ce9651_like; Type: INDEX; Schema: public; Owner: renonbill
--

CREATE INDEX bp_investments_name_85ce9651_like ON public.bp_investments USING btree (name varchar_pattern_ops);


--
-- Name: bp_projects_investment_id_5ac23ef6; Type: INDEX; Schema: public; Owner: renonbill
--

CREATE INDEX bp_projects_investment_id_5ac23ef6 ON public.bp_projects USING btree (investment_id);


--
-- Name: bp_projects_project_id_5149f8bd; Type: INDEX; Schema: public; Owner: renonbill
--

CREATE INDEX bp_projects_project_id_5149f8bd ON public.bp_projects USING btree (project_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: renonbill
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: renonbill
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: renonbill
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: renonbill
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: oc_projects_investment_id_d45c3bea; Type: INDEX; Schema: public; Owner: renonbill
--

CREATE INDEX oc_projects_investment_id_d45c3bea ON public.oc_projects USING btree (investment_id);


--
-- Name: oc_projects_project_id_691c795d; Type: INDEX; Schema: public; Owner: renonbill
--

CREATE INDEX oc_projects_project_id_691c795d ON public.oc_projects USING btree (project_id);


--
-- Name: projects_user_id_155ff78a; Type: INDEX; Schema: public; Owner: renonbill
--

CREATE INDEX projects_user_id_155ff78a ON public.projects USING btree (user_id);


--
-- Name: cases api_case_project_id_882b99d6_fk_api_project_id; Type: FK CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.cases
    ADD CONSTRAINT api_case_project_id_882b99d6_fk_api_project_id FOREIGN KEY (project_id) REFERENCES public.projects(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bp_cases bp_cases_case_id_75e4626e_fk_cases_id; Type: FK CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.bp_cases
    ADD CONSTRAINT bp_cases_case_id_75e4626e_fk_cases_id FOREIGN KEY (case_id) REFERENCES public.cases(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bp_projects bp_projects_investment_id_5ac23ef6_fk_bp_investments_id; Type: FK CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.bp_projects
    ADD CONSTRAINT bp_projects_investment_id_5ac23ef6_fk_bp_investments_id FOREIGN KEY (investment_id) REFERENCES public.bp_investments(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bp_projects bp_projects_project_id_5149f8bd_fk_projects_id; Type: FK CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.bp_projects
    ADD CONSTRAINT bp_projects_project_id_5149f8bd_fk_projects_id FOREIGN KEY (project_id) REFERENCES public.projects(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: constants constants_user_id_9dd0aacb_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.constants
    ADD CONSTRAINT constants_user_id_9dd0aacb_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oc_projects oc_projects_investment_id_d45c3bea_fk_bp_investments_id; Type: FK CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.oc_projects
    ADD CONSTRAINT oc_projects_investment_id_d45c3bea_fk_bp_investments_id FOREIGN KEY (investment_id) REFERENCES public.bp_investments(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oc_projects oc_projects_project_id_691c795d_fk_projects_id; Type: FK CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.oc_projects
    ADD CONSTRAINT oc_projects_project_id_691c795d_fk_projects_id FOREIGN KEY (project_id) REFERENCES public.projects(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects projects_user_id_155ff78a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: renonbill
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_user_id_155ff78a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

