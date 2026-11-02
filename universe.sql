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
    description text,
    galaxy_types character varying(50) NOT NULL,
    name character varying(50),
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
    discover_date date,
    composition text,
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
    size numeric(5,2),
    description text,
    has_life boolean,
    is_spherical boolean,
    planet_id integer,
    name character varying(50) NOT NULL
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
    size numeric(10,2),
    description text,
    has_life boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric(10,2),
    is_sperical boolean,
    star_id integer,
    name character varying(50) NOT NULL
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
    name character varying(50),
    description text,
    location character varying(50),
    distance_from_earth numeric(5,2),
    is_magnetar boolean NOT NULL,
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

INSERT INTO public.galaxy VALUES (1, 'The galaxy containing our own Solar System.', 'Spiral', 'Milky Way', NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'The closest major galaxy to the Milky Way.', 'Spiral', 'Andromeda', NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'A small, irregular satellite galaxy of the Milky Way.', 'Irregular', 'Large Magellanic Cloud', NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'A dwarf satellite galaxy orbiting the Milky Way.', 'Irregular', 'Small Magellanic Cloud', NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'A massive elliptical galaxy in the Virgo Cluster.', 'Elliptical', 'Virgo A', NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'A grand design spiral galaxy in Ursa Major.', 'Spiral', 'Pinwheel Galaxy', NULL, NULL);


--
-- Data for Name: minor_body; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.minor_body VALUES (1, 'Ceres', '1801-01-01', 'Rock and ice mixture with a thin crust of carbonaceous material.', NULL);
INSERT INTO public.minor_body VALUES (2, 'Halley''s Comet', '1758-12-25', 'Volatile ices such as water, carbon monoxide, methane, and ammonia mixed with dust.', NULL);
INSERT INTO public.minor_body VALUES (3, 'Eris', '2005-01-05', 'Methane ice mixed with silicate rock core.', NULL);
INSERT INTO public.minor_body VALUES (4, 'Chiron', '1977-10-18', 'A mix of water ice, dust, and dark carbon compounds, acting as both an asteroid and a comet.', NULL);
INSERT INTO public.minor_body VALUES (5, 'Oumuamua', '2017-10-19', 'Dense, dark rock and metal substrate with no signs of active outgassing.', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 17.37, 'Earths only natural satellite.', false, true, 3, 'Moon');
INSERT INTO public.moon VALUES (2, 1.11, 'The larger, innermost moon of Mars.', false, false, 4, 'Phobos');
INSERT INTO public.moon VALUES (3, 0.62, 'The smaller, outer moon of Mars.', false, false, 4, 'Deimos');
INSERT INTO public.moon VALUES (4, 18.21, 'Volcanically active moon of Jupiter.', false, true, 5, 'Io');
INSERT INTO public.moon VALUES (5, 15.60, 'Subsurface ocean moon with potential for microbial life.', false, true, 5, 'Europa');
INSERT INTO public.moon VALUES (6, 26.34, 'The largest moon in the entire Solar System.', false, true, 5, 'Ganymede');
INSERT INTO public.moon VALUES (7, 24.10, 'A heavily cratered, ancient icy moon.', false, true, 5, 'Callisto');
INSERT INTO public.moon VALUES (8, 25.74, 'Saturns largest moon, featuring liquid methane lakes.', false, true, 6, 'Titan');
INSERT INTO public.moon VALUES (9, 7.63, 'An icy, highly cratered moon of Saturn.', false, true, 6, 'Rhea');
INSERT INTO public.moon VALUES (10, 7.34, 'Distinct two-toned moon with a massive equatorial ridge.', false, true, 6, 'Iapetus');
INSERT INTO public.moon VALUES (11, 5.61, 'An icy moon with bright, fractured cliffs.', false, true, 6, 'Dione');
INSERT INTO public.moon VALUES (12, 5.31, 'Composed almost entirely of water ice.', false, true, 6, 'Tethys');
INSERT INTO public.moon VALUES (13, 2.52, 'Shoots massive geysers of water vapor into space.', false, true, 6, 'Enceladus');
INSERT INTO public.moon VALUES (14, 5.78, 'The brightest moon orbiting Uranus.', false, true, 7, 'Ariel');
INSERT INTO public.moon VALUES (15, 5.84, 'The darkest moon orbiting Uranus.', false, true, 7, 'Umbriel');
INSERT INTO public.moon VALUES (16, 7.88, 'The largest moon orbiting Uranus.', false, true, 7, 'Titania');
INSERT INTO public.moon VALUES (17, 7.61, 'The outermost large moon of Uranus.', false, true, 7, 'Oberon');
INSERT INTO public.moon VALUES (18, 2.35, 'Features a bizarre, patchy, fractured surface.', false, true, 7, 'Miranda');
INSERT INTO public.moon VALUES (19, 13.53, 'Orbits backward relative to Neptunes rotation.', false, true, 8, 'Triton');
INSERT INTO public.moon VALUES (20, 2.10, 'A highly irregular, blocky moon of Neptune.', false, false, 8, 'Proteus');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 2439.70, 'The smallest and closest planet to the Sun.', false, 4503, 0.61, true, 1, 'Mercury');
INSERT INTO public.planet VALUES (2, 6051.80, 'A scorching hot planet with a thick toxic atmosphere.', false, 4503, 0.28, true, 1, 'Venus');
INSERT INTO public.planet VALUES (3, 6371.00, 'Our home planet and the only known body supporting life.', true, 4543, 0.00, true, 1, 'Earth');
INSERT INTO public.planet VALUES (4, 3389.50, 'The Red Planet, home to Olympus Mons.', false, 4603, 0.52, true, 1, 'Mars');
INSERT INTO public.planet VALUES (5, 69911.00, 'The largest gas giant in our solar system.', false, 4603, 4.20, true, 1, 'Jupiter');
INSERT INTO public.planet VALUES (6, 58232.00, 'Famous for its extensive and beautiful ring system.', false, 4503, 8.58, true, 1, 'Saturn');
INSERT INTO public.planet VALUES (7, 25362.00, 'An ice giant that rotates completely on its side.', false, 4503, 18.21, true, 1, 'Uranus');
INSERT INTO public.planet VALUES (8, 24622.00, 'The most distant gas giant with extreme winds.', false, 4503, 29.09, true, 1, 'Neptune');
INSERT INTO public.planet VALUES (9, 5500.00, 'An exoplanet orbiting Alpha Centauri A.', false, 5000, 4.37, true, 2, 'Centauri Prime');
INSERT INTO public.planet VALUES (10, 7200.00, 'A heavy rocky exoplanet orbiting Sirius A.', false, 200, 8.60, true, 3, 'Dog Star One');
INSERT INTO public.planet VALUES (11, 95000.00, 'A massive gas giant getting scorched by its star.', false, 10, 642.50, true, 4, 'Betelgeuse Outpost');
INSERT INTO public.planet VALUES (12, 4300.00, 'A frozen world on the rim of the Andromeda system.', false, 6000, 99.99, true, 5, 'Andromeda Outer Rock');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of the Solar System.', 'Orion Arm', 0.00, false, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 'The closest star system to Earth.', 'Centaurus', 4.37, false, 1);
INSERT INTO public.star VALUES (3, 'Sirius A', 'The brightest star in the night sky.', 'Canis Major', 8.60, false, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'A massive red supergiant star nearing its end.', 'Orion', 642.50, false, 1);
INSERT INTO public.star VALUES (5, 'Andromeda Prime Star', 'A hypothetical major star used for mapping.', 'Andromeda Core', 99.99, false, 2);
INSERT INTO public.star VALUES (6, 'SGR 1806-20', 'An ultra-dense neutron star with an extreme magnetic field.', 'Sagittarius', 500.00, true, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: minor_body_minor_body_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.minor_body_minor_body_id_seq', 5, true);


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
-- Name: minor_body minor_body_discover_date_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.minor_body
    ADD CONSTRAINT minor_body_discover_date_key UNIQUE (discover_date);


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
