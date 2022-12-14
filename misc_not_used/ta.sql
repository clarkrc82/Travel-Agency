--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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
-- Name: airlines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.airlines (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.airlines OWNER TO postgres;

--
-- Name: airlines_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.airlines_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.airlines_id_seq OWNER TO postgres;

--
-- Name: airlines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.airlines_id_seq OWNED BY public.airlines.id;


--
-- Name: car_rentals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.car_rentals (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.car_rentals OWNER TO postgres;

--
-- Name: car_rentals_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.car_rentals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.car_rentals_id_seq OWNER TO postgres;

--
-- Name: car_rentals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.car_rentals_id_seq OWNED BY public.car_rentals.id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    city character varying(30) NOT NULL,
    state character(2) NOT NULL
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_id_seq OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: customer_trips; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_trips (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    trip_id integer NOT NULL
);


ALTER TABLE public.customer_trips OWNER TO postgres;

--
-- Name: customer_trips_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_trips_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_trips_id_seq OWNER TO postgres;

--
-- Name: customer_trips_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_trips_id_seq OWNED BY public.customer_trips.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    first_name character varying(20) NOT NULL,
    last_name character varying(20) NOT NULL,
    user_name character varying(20) NOT NULL,
    email character varying(35) NOT NULL,
    phone_number bigint NOT NULL,
    dob date NOT NULL
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: flights; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flights (
    id integer NOT NULL,
    flight_number integer NOT NULL,
    orgin_city_id integer NOT NULL,
    destination_city_id integer NOT NULL,
    date date,
    airline_id integer NOT NULL
);


ALTER TABLE public.flights OWNER TO postgres;

--
-- Name: flights_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.flights_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flights_id_seq OWNER TO postgres;

--
-- Name: flights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.flights_id_seq OWNED BY public.flights.id;


--
-- Name: hotels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hotels (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.hotels OWNER TO postgres;

--
-- Name: hotels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hotels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hotels_id_seq OWNER TO postgres;

--
-- Name: hotels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hotels_id_seq OWNED BY public.hotels.id;


--
-- Name: trip_flights; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trip_flights (
    id integer NOT NULL,
    flight_id integer NOT NULL,
    trip_id integer NOT NULL
);


ALTER TABLE public.trip_flights OWNER TO postgres;

--
-- Name: trip_flights_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trip_flights_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trip_flights_id_seq OWNER TO postgres;

--
-- Name: trip_flights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trip_flights_id_seq OWNED BY public.trip_flights.id;


--
-- Name: trips; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trips (
    id integer NOT NULL,
    trip_number integer NOT NULL,
    date date NOT NULL,
    car_rental_id integer,
    hotel_id integer
);


ALTER TABLE public.trips OWNER TO postgres;

--
-- Name: trips_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trips_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trips_id_seq OWNER TO postgres;

--
-- Name: trips_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trips_id_seq OWNED BY public.trips.id;


--
-- Name: airlines id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airlines ALTER COLUMN id SET DEFAULT nextval('public.airlines_id_seq'::regclass);


--
-- Name: car_rentals id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car_rentals ALTER COLUMN id SET DEFAULT nextval('public.car_rentals_id_seq'::regclass);


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: customer_trips id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_trips ALTER COLUMN id SET DEFAULT nextval('public.customer_trips_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: flights id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flights ALTER COLUMN id SET DEFAULT nextval('public.flights_id_seq'::regclass);


--
-- Name: hotels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotels ALTER COLUMN id SET DEFAULT nextval('public.hotels_id_seq'::regclass);


--
-- Name: trip_flights id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trip_flights ALTER COLUMN id SET DEFAULT nextval('public.trip_flights_id_seq'::regclass);


--
-- Name: trips id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trips ALTER COLUMN id SET DEFAULT nextval('public.trips_id_seq'::regclass);


--
-- Data for Name: airlines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.airlines (id, name) FROM stdin;
1	Alaska Air
2	Delta Airlines
3	Horizon Air
4	Southwest Airlines
5	British Air
6	JetBlue
7	Allegiant Air
8	American Airlines
9	Frontier Airlines
10	SkyWest Airlines
\.


--
-- Data for Name: car_rentals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.car_rentals (id, name) FROM stdin;
1	Enterprise
2	National
3	Alamo
4	Hertz
5	Avis
6	Dollar
7	Budget
8	Thrifty
\.


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (id, city, state) FROM stdin;
1	Seattle	WA
2	Portland	OR
3	L.A.	CA
4	San Diego	CA
5	Sacramento	CA
6	San Fransico	CA
7	Spokane	WA
8	Boise	ID
9	New York City	NY
10	Chicago	IL
11	Houston	TX
12	Phoenix	AZ
13	San Antonio	TX
14	Dallas	TX
15	Austin	TX
16	Jacksonville	FL
17	Columbus	OH
18	Indianapolis	IN
19	Charlotte	NC
20	Denver	CO
21	Boston	MA
22	Las Vegas	NV
23	Memphis	TN
24	Baltimore	MD
25	Milwaukee	WI
26	Kansas City	KS
27	Maimi	FL
28	Tulsa	OK
29	Tampa	FL
30	Cleveland	OH
31	Newwark	NJ
32	Richmond	VA
\.


--
-- Data for Name: customer_trips; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_trips (id, customer_id, trip_id) FROM stdin;
1	2	1
2	10	3
3	2	5
4	6	5
5	9	4
6	7	2
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id, first_name, last_name, user_name, email, phone_number, dob) FROM stdin;
2	Elsie	Cunningham	DeckBrace	adah28@gmail.com	6066783060	1954-10-24
3	Nora	Hampton	Girlie	simone.jenkins@hotmail.com	5086847184	1976-04-11
4	Joseph	Ferguson	Grimplas	ohuel@gmail.com	5306737822	1989-06-20
5	Rex	Crawford	Fourve	sandra.rosenbaum@gmail.com	3192562994	1992-03-18
6	Devin	Estrada	Isoleph	ritchie.nina@yahoo.com	3219655347	1992-04-08
7	Cory	Summers	Bluentand	nicolas.padberg@schowalter.com	9158994665	1942-10-22
8	Dixie	Richardson	ThedevilShabby	jakob.lakin@schroeder.com	8634445703	1948-08-12
9	Arthur	Wood	Phathe	cassandra.krajcik@bosco.com	7193539182	1977-09-05
10	Travis	Mills	Beeag	nicolas11@hotmail.com	5024969275	1991-10-21
11	Wilbert	Cross	LedgerTwo	watsica.trenton@gmail.com	5309827974	1962-04-21
\.


--
-- Data for Name: flights; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flights (id, flight_number, orgin_city_id, destination_city_id, date, airline_id) FROM stdin;
8	302	2	24	2022-02-08	4
9	2123	30	3	2022-06-02	1
10	701	32	31	2022-06-05	10
11	564	1	11	2022-07-11	5
12	981	22	14	2022-09-11	7
13	1023	23	5	2022-02-20	2
14	309	29	9	2022-03-28	9
\.


--
-- Data for Name: hotels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hotels (id, name) FROM stdin;
1	Hilton
2	Marriot
3	Courtyard by Marriot
4	Holiday Inn
5	Holiday Inn Express
6	Hampton Inn
7	Hyatt
8	Best Western
9	Sheraton
10	Comfort Suites
11	Embassy Suites
12	Ritz-Carlton
13	Days Inn
14	Grand Hyatt
15	Hilton Garden Inn
16	Four Seasons
\.


--
-- Data for Name: trip_flights; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trip_flights (id, flight_id, trip_id) FROM stdin;
13	8	1
14	10	3
15	14	5
16	11	5
17	9	4
18	11	2
\.


--
-- Data for Name: trips; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trips (id, trip_number, date, car_rental_id, hotel_id) FROM stdin;
1	10	2022-02-20	1	\N
2	12	2022-03-28	2	10
3	14	2022-06-06	3	2
4	16	2022-08-20	\N	\N
5	18	2022-09-07	\N	5
\.


--
-- Name: airlines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.airlines_id_seq', 10, true);


--
-- Name: car_rentals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.car_rentals_id_seq', 8, true);


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_id_seq', 32, true);


--
-- Name: customer_trips_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_trips_id_seq', 6, true);


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_id_seq', 11, true);


--
-- Name: flights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.flights_id_seq', 14, true);


--
-- Name: hotels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hotels_id_seq', 16, true);


--
-- Name: trip_flights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trip_flights_id_seq', 18, true);


--
-- Name: trips_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trips_id_seq', 5, true);


--
-- Name: airlines airlines_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airlines
    ADD CONSTRAINT airlines_name_key UNIQUE (name);


--
-- Name: airlines airlines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airlines
    ADD CONSTRAINT airlines_pkey PRIMARY KEY (id);


--
-- Name: car_rentals car_rentals_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car_rentals
    ADD CONSTRAINT car_rentals_name_key UNIQUE (name);


--
-- Name: car_rentals car_rentals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.car_rentals
    ADD CONSTRAINT car_rentals_pkey PRIMARY KEY (id);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: customer_trips customer_trips_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_trips
    ADD CONSTRAINT customer_trips_pkey PRIMARY KEY (id);


--
-- Name: customers customers_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: customers customers_user_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_user_name_key UNIQUE (user_name);


--
-- Name: flights flights_flight_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_flight_number_key UNIQUE (flight_number);


--
-- Name: flights flights_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_pkey PRIMARY KEY (id);


--
-- Name: hotels hotels_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_name_key UNIQUE (name);


--
-- Name: hotels hotels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_pkey PRIMARY KEY (id);


--
-- Name: trip_flights trip_flights_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trip_flights
    ADD CONSTRAINT trip_flights_pkey PRIMARY KEY (id);


--
-- Name: trips trips_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trips
    ADD CONSTRAINT trips_pkey PRIMARY KEY (id);


--
-- Name: trips trips_trip_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trips
    ADD CONSTRAINT trips_trip_number_key UNIQUE (trip_number);


--
-- Name: flights fk_airline; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT fk_airline FOREIGN KEY (airline_id) REFERENCES public.airlines(id);


--
-- Name: trips fk_car_rental; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trips
    ADD CONSTRAINT fk_car_rental FOREIGN KEY (car_rental_id) REFERENCES public.car_rentals(id);


--
-- Name: customer_trips fk_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_trips
    ADD CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: trip_flights fk_flight; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trip_flights
    ADD CONSTRAINT fk_flight FOREIGN KEY (flight_id) REFERENCES public.flights(id);


--
-- Name: flights fk_flight_cities; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT fk_flight_cities FOREIGN KEY (orgin_city_id) REFERENCES public.cities(id);


--
-- Name: flights fk_flight_destination; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT fk_flight_destination FOREIGN KEY (destination_city_id) REFERENCES public.cities(id);


--
-- Name: trips fk_hotel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trips
    ADD CONSTRAINT fk_hotel FOREIGN KEY (hotel_id) REFERENCES public.hotels(id);


--
-- Name: customer_trips fk_trip; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_trips
    ADD CONSTRAINT fk_trip FOREIGN KEY (trip_id) REFERENCES public.trips(id);


--
-- Name: trip_flights fk_trip; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trip_flights
    ADD CONSTRAINT fk_trip FOREIGN KEY (trip_id) REFERENCES public.trips(id);


--
-- PostgreSQL database dump complete
--

