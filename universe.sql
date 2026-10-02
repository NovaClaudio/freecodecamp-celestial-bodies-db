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

ALTER TABLE ONLY public.star DROP CONSTRAINT fk_star_galaxy;
ALTER TABLE ONLY public.planet DROP CONSTRAINT fk_planet_star;
ALTER TABLE ONLY public.moon DROP CONSTRAINT fk_moon_planet;
ALTER TABLE ONLY public.asteroid DROP CONSTRAINT fk_asteroid_galaxy;
ALTER TABLE ONLY public.star DROP CONSTRAINT unique_star_id;
ALTER TABLE ONLY public.planet DROP CONSTRAINT unique_planet_id;
ALTER TABLE ONLY public.moon DROP CONSTRAINT unique_moon_id;
ALTER TABLE ONLY public.galaxy DROP CONSTRAINT unique_galaxy_id;
ALTER TABLE ONLY public.asteroid DROP CONSTRAINT unique_asteroid_id;
ALTER TABLE ONLY public.star DROP CONSTRAINT star_pkey;
ALTER TABLE ONLY public.planet DROP CONSTRAINT planet_pkey;
ALTER TABLE ONLY public.planet DROP CONSTRAINT planet_name_key;
ALTER TABLE ONLY public.moon DROP CONSTRAINT moon_pkey;
ALTER TABLE ONLY public.moon DROP CONSTRAINT moon_name_key;
ALTER TABLE ONLY public.galaxy DROP CONSTRAINT galaxy_pkey;
ALTER TABLE ONLY public.asteroid DROP CONSTRAINT asteroid_pkey;
ALTER TABLE ONLY public.asteroid DROP CONSTRAINT asteroid_name_key;
ALTER TABLE public.star ALTER COLUMN star_id DROP DEFAULT;
ALTER TABLE public.planet ALTER COLUMN planet_id DROP DEFAULT;
ALTER TABLE public.moon ALTER COLUMN moon_id DROP DEFAULT;
ALTER TABLE public.galaxy ALTER COLUMN galaxy_id DROP DEFAULT;
ALTER TABLE public.asteroid ALTER COLUMN asteroid_id DROP DEFAULT;
DROP SEQUENCE public.star_star_id_seq;
DROP TABLE public.star;
DROP SEQUENCE public.planet_planet_id_seq;
DROP TABLE public.planet;
DROP SEQUENCE public.moon_moon_id_seq;
DROP TABLE public.moon;
DROP SEQUENCE public.galaxy_galaxy_id_seq;
DROP TABLE public.galaxy;
DROP SEQUENCE public.asteroid_asteroid_id_seq;
DROP TABLE public.asteroid;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(20) NOT NULL,
    composition text,
    hazard_level integer,
    estimated_velocity integer,
    estimated_mass numeric,
    is_monitored boolean,
    has_ice boolean,
    galaxy_id integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    galaxy_types integer,
    star_count integer,
    distance_from_earth numeric,
    has_life boolean,
    is_spherical boolean
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
    name character varying(20) NOT NULL,
    discovery_history text,
    crater_count integer,
    gravity_percentage integer,
    diameter_km numeric,
    has_atmosphere boolean,
    is_spherical boolean,
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
    name character varying(20) NOT NULL,
    orbital_period integer,
    population_millions integer,
    radius_km numeric,
    has_life boolean,
    is_spherical boolean,
    star_id integer,
    planet_types text
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
    name character varying(20) NOT NULL,
    spectral_type text,
    age_in_millions integer,
    temperature integer,
    mass numeric,
    is_stable boolean,
    has_planets boolean,
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.asteroid (asteroid_id, name, composition, hazard_level, estimated_velocity, estimated_mass, is_monitored, has_ice, galaxy_id) FROM stdin;
1	Ceres	Rocher argileux et glace d'eau	0	17	939.3000	t	t	1
2	Vesta	Roche basaltique et pyroxène	0	19	259.0000	t	f	1
3	Pallas	Silicates riches en eau et carbone	0	21	211.0000	t	t	1
4	Hygiea	Composition carbonée primitive C	0	18	86.0000	t	t	1
5	Apophis	Silicates et métaux fer-nickel	2	30	0.0610	t	f	1
6	Bennu	Agrégat de débris carbonés instables	1	28	0.0730	t	t	1
7	Bathyly	Roche silicatée S	0	15	0.0120	f	f	1
8	Psyche	Noyau métallique fer-nickel pur	0	17	22.3000	t	f	1
9	Eros	Astéroïde géocroiseur rocheux S	0	24	0.0067	t	f	1
10	Itokawa	Agrégat de graviers et silicates	0	25	0.0001	t	f	1
11	Ryugu	Riche en carbone et matière organique	0	26	0.4500	t	t	1
12	Chiron	Centaur cométaire roche-glace	0	11	4.0000	t	t	1
13	Chariklo	Astéroïde doté de deux anneaux	0	12	6.0000	t	t	1
14	Toutatis	Objet bilitonné en rotation chaotique	1	32	0.0050	t	f	1
15	Mathilde	Astéroïde de type C très poreux	0	23	0.1033	t	f	1
16	Ida	Possède sa propre mini-lune Dactyl	0	16	0.0420	t	f	1
17	Gaspra	Premier astéroïde frôlé par une sonde	0	19	0.0250	f	f	1
18	Cleopatra	Astéroïde en forme d'os de chien	0	15	4.6000	t	f	1
19	Hector	Astéroïde troyen de Jupiter géant	0	13	14.0000	t	t	1
20	Braille	Astéroïde hautement incliné et allongé	0	18	0.0001	f	f	1
\.


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.galaxy (galaxy_id, name, description, galaxy_types, star_count, distance_from_earth, has_life, is_spherical) FROM stdin;
1	Voie Lactee	Notre galaxie spirale	1	200000	0.00	t	f
2	Andromede	La plus proche grande voisine	1	400000	2.54	f	f
3	Triangle	Petite galaxie spirale du Groupe Local	1	40000	2.73	f	f
4	Grand Nuage	Galaxie naine satellite de la notre	2	30000	0.16	f	f
5	Petit Nuage	Autre satellite irrégulier	2	7000	0.20	f	f
6	Bode	Magnifique galaxie spirale	1	250000	11.70	f	f
7	Cigare	Galaxie à sursaut d'étoiles	2	90000	11.40	f	f
8	Tourbillon	Spirale avec des bras très marqués	1	100000	23.00	f	f
9	Sombrero	Bulbe central immense et sombre	3	80000	29.30	f	f
10	Centaurus A	Galaxie lenticulaire géante	3	150000	13.00	f	f
11	Moulinet	Grande spirale vue de face	1	100000	20.90	f	f
12	Roue de Charette	Galaxie à anneau spectaculaire	2	50000	500.00	f	f
13	Tetard	Galaxie perturbée avec une longue queue	2	20000	420.00	f	f
14	Antennes A	En pleine collision fusion	2	60000	45.00	f	f
15	Antennes B	La deuxième partie de la collision	2	60000	45.00	f	f
16	Oeil Noir	Bande de poussière absorbante sombre	1	80000	17.00	f	f
17	Condor	Spirale barrée extrêmement étirée	1	120000	212.00	f	f
18	Malin 1	Galaxie à faible brillance de surface	1	300000	1190.00	f	f
19	Sagittaire	Naine elliptique proche du bulbe	3	1000	0.07	f	f
20	Sculpteur	Galaxie naine du groupe du Sculpteur	2	5000	11.40	f	f
\.


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.moon (moon_id, name, discovery_history, crater_count, gravity_percentage, diameter_km, has_atmosphere, is_spherical, planet_id) FROM stdin;
1	Lune	Connue depuis la Préhistoire	5000	16	3474.20	f	t	3
2	Phobos	Découverte en 1877 par Asaph Hall	150	1	22.20	f	f	4
3	Deimos	Découverte en 1877 par Asaph Hall	80	1	12.40	f	f	4
4	Io	Découverte en 1610 par Galilée	0	18	3643.20	t	t	5
5	Europe	Découverte en 1610 par Galilée	40	13	3121.60	t	t	5
6	Ganymede	Plus grande lune du système solaire	3500	15	5262.40	t	t	5
7	Callisto	Corps le plus cratérisé	8000	12	4820.60	t	t	5
8	Titan	Atmosphère d'azote super épaisse	200	14	5149.50	t	t	6
9	Encelade	Geysers de glace et océan global	300	1	504.20	t	t	6
10	Mimas	Ressemble à l'Étoile de la Mort	1200	1	396.40	f	t	6
11	Iapet	Lune bicolore intrigante	2500	1	1468.60	f	t	6
12	Rhea	Deuxième plus grande lune de Saturne	4000	3	1527.60	f	t	6
13	Dione	Lune glacée avec falaises blanches	1800	2	1122.80	f	t	6
14	Tethys	Grand canyon Ithaca Chasma	2200	1	1062.20	f	t	6
15	Amalthee	Lune rouge irrégulière de Jupiter	90	1	167.00	f	f	5
16	Himalia	Plus grande lune irrégulière externe	50	1	170.00	f	f	5
17	Hyperion	Lune éponge chaotique	950	1	270.00	f	f	6
18	Phoebe	Objet capturé de la ceinture de Kuiper	1400	1	213.00	f	t	6
19	Janus	Partage son orbite avec Epiméthée	400	1	179.00	f	f	6
20	Epimethee	Lune co-orbitale de Saturne	350	1	116.20	f	f	6
\.


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.planet (planet_id, name, orbital_period, population_millions, radius_km, has_life, is_spherical, star_id, planet_types) FROM stdin;
1	Mercure	88	0	2439.70	f	t	1	Tellurique métallique
2	Venus	224	0	6051.80	f	t	1	Tellurique atmosphère dense
3	Terre	365	8000	6371.00	t	t	1	Tellurique silicates avec eau liquide
4	Mars	687	0	3389.50	f	t	1	Tellurique oxyde de fer
5	Jupiter	4333	0	69911.00	f	t	1	Géante gazeuse hydrogène
6	Saturne	10759	0	58232.00	f	t	1	Géante gazeuse à anneaux
7	Uranus	30687	0	25362.00	f	t	1	Géante de glace inclinée
8	Neptune	60190	0	24622.00	f	t	1	Géante de glace active
9	Proxima b	11	0	6500.00	f	t	3	Tellurique en zone habitable
10	Proxima c	1900	0	15000.00	f	t	3	Super-Terre froide externe
11	Pluton	90560	0	1188.30	f	t	1	Planète naine de glace
12	Eris	203600	0	1163.00	f	t	1	Planète naine transneptunienne
13	Haumea	103774	0	816.00	f	f	1	Planète naine allongée
14	Makemake	112897	0	715.00	f	t	1	Planète naine du système externe
15	Ceres_Planete	1682	0	469.70	f	t	1	Planète naine de la ceinture
16	Sedna	4164000	0	500.00	f	t	1	Objet transneptunien lointain
17	Quaoar	105120	0	555.00	f	t	1	Cubewano de la ceinture de Kuiper
18	Orcus	90410	0	458.00	f	t	1	Plutino avec grande lune
19	Gonggong	201840	0	615.00	f	t	1	Objet résonnant rouge
20	Salacia	100100	0	423.00	f	t	1	Gros objet de Kuiper sombre
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.star (star_id, name, spectral_type, age_in_millions, temperature, mass, is_stable, has_planets, galaxy_id) FROM stdin;
1	Soleil	Naine jaune G2V	4600	5778	1.00	t	t	1
2	Sirius A	Étoile blanche de la séquence principale	240	9940	2.06	t	f	1
3	Proxima	Naine rouge la plus proche	4850	3042	0.12	f	t	1
4	Alpha Centauri A	Naine jaune similaire au Soleil	5000	5790	1.10	t	t	1
5	Betelgeuse	Supergéante rouge instable	10	3500	16.50	f	f	1
6	Rigel	Supergéante bleue très lumineuse	8	12100	21.00	t	f	1
7	Vega	Étoile blanche à rotation rapide	455	9602	2.13	t	t	1
8	Arcturus	Géante orange évoluée	7100	4286	1.08	t	f	1
9	Aldebaran	Géante rouge dans le Taureau	6600	3910	1.16	t	t	1
10	Antares	Supergéante rouge en fin de vie	11	3400	12.00	f	f	1
11	Canopus	Supergéante blanche	25	7350	8.00	t	f	1
12	Capella A	Géante jaune en système binaire	620	4970	2.56	t	f	1
13	Procyon A	Sous-géante blanche-jaune	1870	6530	1.50	t	f	1
14	Altair	Étoile de type A très aplatie	1200	6900	1.79	t	f	1
15	Spica	Binaire spectroscopique bleue	12	22400	11.43	t	f	1
16	Pollux	Géante orange la plus proche	724	4666	1.91	t	t	1
17	Fomalhaut	Étoile jeune avec anneau de poussière	440	8590	1.92	t	t	1
18	Deneb	Supergéante blanche lointaine	10	8500	19.00	t	f	1
19	Regulus	Système quadruple bleu	1000	12460	3.80	t	f	1
20	Castor A	Étoile blanche du système sextuple	290	9300	2.76	t	f	1
\.


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 20, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 20, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 20, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid unique_asteroid_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT unique_asteroid_id UNIQUE (asteroid_id);


--
-- Name: galaxy unique_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_id UNIQUE (galaxy_id);


--
-- Name: moon unique_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_id UNIQUE (moon_id);


--
-- Name: planet unique_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_id UNIQUE (planet_id);


--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


--
-- Name: asteroid fk_asteroid_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT fk_asteroid_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

