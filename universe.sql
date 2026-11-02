--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(50) NOT NULL,
    galaxy_types character varying(50) NOT NULL,
    description text,
    distance_from_earth numeric(10,2),
    estimated_stars_in_billions integer
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
-- Name: minor_body; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.minor_body (
    minor_body_id integer NOT NULL,
    name character varying(50) NOT NULL,
    body_type character varying(50) NOT NULL,
    description text,
    discover_date date,
    orbital_period_in_days integer
);


ALTER TABLE public.minor_body OWNER TO freecodecamp;

--
-- Name: minor_body_minor_body_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.minor_body_minor_body_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.minor_body_minor_body_id_seq OWNER TO freecodecamp;

--
-- Name: minor_body_minor_body_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.minor_body_minor_body_id_seq OWNED BY public.minor_body.minor_body_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean NOT NULL,
    size numeric(10,2),
    planet_id integer NOT NULL
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
    name character varying(50) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(10,2),
    is_spherical boolean,
    star_id integer NOT NULL
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    location character varying(50),
    distance_from_earth numeric(10,2),
    is_magnetar boolean NOT NULL,
    galaxy_id integer NOT NULL
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
-- Name: minor_body minor_body_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.minor_body ALTER COLUMN minor_body_id SET DEFAULT nextval('public.minor_body_minor_body_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 'Our home galaxy.', 0.00, 100);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'The nearest major galaxy to the Milky Way.', 2537000.00, 1000);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 'Irregular', 'A satellite galaxy of the Milky Way.', 163000.00, 30);
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic Cloud', 'Irregular', 'A dwarf galaxy near the Milky Way.', 200000.00, 3);
INSERT INTO public.galaxy VALUES (5, 'Virgo A', 'Elliptical', 'A giant elliptical galaxy in the Virgo Cluster.', 53000000.00, 1000);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel Galaxy', 'Spiral', 'A grand design spiral galaxy.', 21000000.00, 100);


--
-- Data for Name: minor_body; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.minor_body VALUES (1, 'Ceres', 'Dwarf Planet', 'A dwarf planet located in the asteroid belt.', '1801-01-01', 1682);
INSERT INTO public.minor_body VALUES (2, 'Halley Comet', 'Comet', 'A periodic comet visible from Earth.', '1758-12-25', 27500);
INSERT INTO public.minor_body VALUES (3, 'Eris', 'Dwarf Planet', 'A dwarf planet beyond Neptune.', '2005-01-05', 203830);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth natural satellite.', false, true, 17.37, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'The larger inner moon of Mars.', false, false, 1.11, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'The smaller outer moon of Mars.', false, false, 0.62, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'A volcanically active moon of Jupiter.', false, true, 18.21, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'An icy moon with a subsurface ocean.', false, true, 15.60, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'The largest moon in the solar system.', false, true, 26.34, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'A heavily cratered moon of Jupiter.', false, true, 24.10, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'Saturn moon with methane lakes.', false, true, 25.74, 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 'An icy moon of Saturn.', false, true, 7.63, 6);
INSERT INTO public.moon VALUES (10, 'Iapetus', 'A two-toned moon of Saturn.', false, true, 7.34, 6);
INSERT INTO public.moon VALUES (11, 'Dione', 'An icy moon of Saturn.', false, true, 5.61, 6);
INSERT INTO public.moon VALUES (12, 'Tethys', 'A moon composed mainly of ice.', false, true, 5.31, 6);
INSERT INTO public.moon VALUES (13, 'Enceladus', 'A moon with water vapor geysers.', false, true, 2.52, 6);
INSERT INTO public.moon VALUES (14, 'Ariel', 'A moon orbiting Uranus.', false, true, 5.78, 7);
INSERT INTO public.moon VALUES (15, 'Umbriel', 'A dark moon of Uranus.', false, true, 5.84, 7);
INSERT INTO public.moon VALUES (16, 'Titania', 'The largest moon of Uranus.', false, true, 7.88, 7);
INSERT INTO public.moon VALUES (17, 'Oberon', 'An outer moon of Uranus.', false, true, 7.61, 7);
INSERT INTO public.moon VALUES (18, 'Miranda', 'A moon with a fractured surface.', false, true, 2.35, 7);
INSERT INTO public.moon VALUES (19, 'Triton', 'The largest moon of Neptune.', false, true, 13.53, 8);
INSERT INTO public.moon VALUES (20, 'Proteus', 'An irregular moon of Neptune.', false, false, 2.10, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'The smallest planet in our solar system.', false, 4500, 0.61, true, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'A very hot planet with a thick atmosphere.', false, 4500, 0.28, true, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Our home planet.', true, 4543, 0.00, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'The Red Planet.', false, 4600, 0.52, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The largest planet in our solar system.', false, 4600, 4.20, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'A gas giant famous for its rings.', false, 4500, 8.58, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'An ice giant that rotates on its side.', false, 4500, 18.21, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'A distant ice giant.', false, 4500, 29.09, true, 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 'An exoplanet orbiting Proxima Centauri.', false, 5000, 4.24, true, 2);
INSERT INTO public.planet VALUES (10, 'Sirius Prime', 'A fictional planet orbiting Sirius A.', false, 200, 8.60, true, 3);
INSERT INTO public.planet VALUES (11, 'Betelgeuse World', 'A fictional planet orbiting Betelgeuse.', false, 10, 642.50, true, 4);
INSERT INTO public.planet VALUES (12, 'Andromeda World', 'A fictional planet in the Andromeda galaxy.', false, 6000, 2537000.00, true, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of our solar system.', 'Milky Way', 0.00, false, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 'A star in the Alpha Centauri system.', 'Centaurus', 4.37, false, 1);
INSERT INTO public.star VALUES (3, 'Sirius A', 'The brightest star in the night sky.', 'Canis Major', 8.60, false, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'A red supergiant star.', 'Orion', 642.50, false, 1);
INSERT INTO public.star VALUES (5, 'Andromeda Prime Star', 'A star in the Andromeda galaxy.', 'Andromeda', 2537000.00, false, 2);
INSERT INTO public.star VALUES (6, 'SGR 1806-20', 'A highly magnetic neutron star.', 'Sagittarius', 500.00, true, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: minor_body_minor_body_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.minor_body_minor_body_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


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
-- Name: minor_body minor_body_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.minor_body
    ADD CONSTRAINT minor_body_name_key UNIQUE (name);


--
-- Name: minor_body minor_body_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.minor_body
    ADD CONSTRAINT minor_body_pkey PRIMARY KEY (minor_body_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

