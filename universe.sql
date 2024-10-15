--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    distance_from_earth numeric NOT NULL,
    has_life boolean NOT NULL,
    number_of_stars integer NOT NULL,
    discovery_year integer NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    radius numeric NOT NULL,
    has_life boolean NOT NULL,
    number_of_craters integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    composition text NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    mass numeric NOT NULL,
    is_habitable boolean NOT NULL,
    has_moons boolean NOT NULL,
    number_of_rings integer NOT NULL,
    orbital_period integer NOT NULL,
    atmosphere text NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(255) NOT NULL,
    launch_date date NOT NULL,
    orbit_type character varying(100) NOT NULL,
    is_operational boolean NOT NULL,
    planet_id integer,
    mass numeric NOT NULL
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    star_type character varying(100) NOT NULL,
    is_spherical boolean NOT NULL,
    temperature integer NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Vía Láctea', 0, true, 100000000, -13000, 'Nuestra galaxia local');
INSERT INTO public.galaxy VALUES (2, 'Andrómeda', 2537000, false, 1000000000, 964, 'La galaxia más cercana a la Vía Láctea');
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 29000000, false, 800000000, 1912, 'Una galaxia famosa por su forma similar a un sombrero');
INSERT INTO public.galaxy VALUES (4, 'Triángulo', 3000000, false, 500000000, 1850, 'Una de las galaxias más cercanas a la Tierra');
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 55000000, false, 1200000000, 1781, 'Famosa por tener un agujero negro supermasivo en su núcleo');
INSERT INTO public.galaxy VALUES (6, 'NGC 1300', 60000000, false, 100000000, 1834, 'Una galaxia espiral barrada ubicada en la constelación Eridanus');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1737.1, false, 5000, 4500, 'Composición rocosa', 1);
INSERT INTO public.moon VALUES (2, 'Fobos', 11.267, false, 1000, 4500, 'Composición rocosa', 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 6.2, false, 600, 4500, 'Composición rocosa', 2);
INSERT INTO public.moon VALUES (4, 'Europa', 1560.8, false, 2000, 4500, 'Hielo de agua y silicato', 3);
INSERT INTO public.moon VALUES (5, 'Io', 1821.6, false, 400, 4500, 'Roca y azufre', 3);
INSERT INTO public.moon VALUES (6, 'Ganimedes', 2631.2, false, 2000, 4500, 'Composición rocosa', 3);
INSERT INTO public.moon VALUES (7, 'Calisto', 2400.0, false, 4000, 4500, 'Composición rocosa', 3);
INSERT INTO public.moon VALUES (8, 'Titan', 2575.0, false, 1000, 4000, 'Hielo y roca', 4);
INSERT INTO public.moon VALUES (9, 'Encélado', 252.1, false, 150, 4000, 'Composición helada', 4);
INSERT INTO public.moon VALUES (10, 'Rhea', 763.8, false, 200, 4000, 'Composición rocosa y helada', 4);
INSERT INTO public.moon VALUES (11, 'Tritón', 1350.0, false, 2000, 4000, 'Composición rocosa y helada', 5);
INSERT INTO public.moon VALUES (12, 'Miranda', 471.6, false, 1000, 4500, 'Composición rocosa', 6);
INSERT INTO public.moon VALUES (13, 'Ariel', 578.8, false, 1500, 4500, 'Composición rocosa', 6);
INSERT INTO public.moon VALUES (14, 'Umbriel', 584.7, false, 2000, 4500, 'Composición rocosa', 6);
INSERT INTO public.moon VALUES (15, 'Oberón', 761.4, false, 3000, 4500, 'Composición rocosa', 6);
INSERT INTO public.moon VALUES (16, 'Titania', 788.4, false, 1500, 4500, 'Composición rocosa', 6);
INSERT INTO public.moon VALUES (17, 'Charon', 606.0, false, 2000, 4500, 'Composición rocosa', 7);
INSERT INTO public.moon VALUES (18, 'Haumea I', 165.0, false, 50, 4500, 'Composición helada', 8);
INSERT INTO public.moon VALUES (19, 'Makemake I', 80.0, false, 20, 4500, 'Composición rocosa', 9);
INSERT INTO public.moon VALUES (20, 'Eris I', 250.0, false, 100, 4500, 'Composición helada', 10);
INSERT INTO public.moon VALUES (21, 'Kallisto', 490.0, false, 1500, 4500, 'Composición rocosa', 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Tierra', 1.0, true, true, 0, 365, 'Atmosfera rica en oxígeno y nitrógeno', 1);
INSERT INTO public.planet VALUES (2, 'Marte', 0.107, false, true, 0, 687, 'Atmosfera delgada compuesta principalmente de dióxido de carbono', 1);
INSERT INTO public.planet VALUES (3, 'Júpiter', 317.8, false, true, 79, 4333, 'Principalmente hidrógeno y helio', 1);
INSERT INTO public.planet VALUES (4, 'Saturno', 95.2, false, true, 83, 10759, 'Famoso por sus anillos', 1);
INSERT INTO public.planet VALUES (5, 'Urano', 14.5, false, true, 27, 30687, 'Gas gigante con anillos tenues', 1);
INSERT INTO public.planet VALUES (6, 'Neptuno', 17.1, false, true, 14, 60190, 'Atmosfera densa con fuertes vientos', 1);
INSERT INTO public.planet VALUES (7, 'Mercurio', 0.055, false, false, 0, 88, 'Planeta más cercano al Sol', 1);
INSERT INTO public.planet VALUES (8, 'Venus', 0.815, false, false, 0, 225, 'Conocido como el planeta hermano de la Tierra', 1);
INSERT INTO public.planet VALUES (9, 'Plutón', 0.0022, false, true, 0, 90560, 'Planeta enano en el cinturón de Kuiper', 1);
INSERT INTO public.planet VALUES (10, 'Ceres', 0.0009, false, false, 0, 1680, 'El mayor objeto del cinturón de asteroides', 1);
INSERT INTO public.planet VALUES (11, 'Haumea', 0.0005, false, false, 0, 2830, 'Planeta enano con forma elipsoidal', 1);
INSERT INTO public.planet VALUES (12, 'Eris', 0.0026, false, false, 0, 558, 'Planeta enano en el cinturón de Kuiper', 1);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'Hubble Space Telescope', '1990-04-24', 'Baja órbita terrestre', true, 1, 11000.0);
INSERT INTO public.satellite VALUES (2, 'Mars Reconnaissance Orbiter', '2005-08-12', 'Órbita marciana', true, 2, 1000.0);
INSERT INTO public.satellite VALUES (3, 'Galileo', '1989-10-18', 'Órbita jupiteriana', false, 3, 4500.0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 4600, 'Enana amarilla', true, 5778, 1);
INSERT INTO public.star VALUES (2, 'Sirio', 242, 'Secuencia principal', true, 9940, 2);
INSERT INTO public.star VALUES (3, 'Vega', 455, 'Enana blanca', true, 9602, 2);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 800, 'Supergigante roja', true, 3500, 1);
INSERT INTO public.star VALUES (5, 'Antares', 120, 'Supergigante roja', true, 3500, 1);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 4400, 'Enana roja', true, 2340, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: satellite satellite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_name_key UNIQUE (name);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: satellite satellite_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

