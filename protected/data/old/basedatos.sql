/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  jrojas
 * Created: 15/08/2016
 */

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.8
-- Dumped by pg_dump version 9.4.8
-- Started on 2016-08-15 08:42:04 VET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1 (class 3079 OID 11861)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2265 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 177 (class 1259 OID 19564)
-- Name: AuthAssignment; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "AuthAssignment" (
    itemname character varying(64) NOT NULL,
    userid character varying(64) NOT NULL,
    bizrule text,
    data text
);


ALTER TABLE "AuthAssignment" OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 19570)
-- Name: AuthItem; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "AuthItem" (
    name character varying(64) NOT NULL,
    type integer NOT NULL,
    description text,
    bizrule text,
    data text
);


ALTER TABLE "AuthItem" OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 19576)
-- Name: AuthItemChild; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "AuthItemChild" (
    parent character varying(64) NOT NULL,
    child character varying(64) NOT NULL
);


ALTER TABLE "AuthItemChild" OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 28202)
-- Name: alimento; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE alimento (
    id integer NOT NULL,
    descripcion character varying(50),
    tipo_alimento integer
);


ALTER TABLE alimento OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 28200)
-- Name: alimento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE alimento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alimento_id_seq OWNER TO postgres;

--
-- TOC entry 2266 (class 0 OID 0)
-- Dependencies: 206
-- Name: alimento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE alimento_id_seq OWNED BY alimento.id;


--
-- TOC entry 189 (class 1259 OID 28090)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cliente (
    id integer NOT NULL,
    cedula integer,
    nombre character varying(100),
    apellido character varying(100),
    sexo integer,
    direccion text,
    telefono character varying(16),
    telefono_casa character varying(16),
    correo_electronico character varying(100),
    created_date date,
    modified_date date,
    created_by integer,
    modified_by integer
);


ALTER TABLE cliente OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 28088)
-- Name: cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cliente_id_seq OWNER TO postgres;

--
-- TOC entry 2267 (class 0 OID 0)
-- Dependencies: 188
-- Name: cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cliente_id_seq OWNED BY cliente.id;


--
-- TOC entry 213 (class 1259 OID 28271)
-- Name: dieta; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE dieta (
    id integer NOT NULL,
    fecha date,
    id_cliente integer,
    id_mascota integer,
    precio_diario double precision,
    dias integer,
    precio_dias double precision,
    iva integer,
    monto_iva double precision,
    precio_total double precision,
    created_date date,
    modified_date date,
    created_by integer,
    modified_by integer
);


ALTER TABLE dieta OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 28289)
-- Name: dieta_detalle; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE dieta_detalle (
    id integer NOT NULL,
    id_dieta integer,
    id_alimento integer,
    cantidad_gramos double precision,
    costo_gramos double precision,
    precio_gramos double precision,
    created_date date,
    modified_date date,
    created_by integer,
    modified_by integer
);


ALTER TABLE dieta_detalle OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 28287)
-- Name: dieta_detalle_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE dieta_detalle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dieta_detalle_id_seq OWNER TO postgres;

--
-- TOC entry 2268 (class 0 OID 0)
-- Dependencies: 214
-- Name: dieta_detalle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE dieta_detalle_id_seq OWNED BY dieta_detalle.id;


--
-- TOC entry 212 (class 1259 OID 28269)
-- Name: dieta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE dieta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dieta_id_seq OWNER TO postgres;

--
-- TOC entry 2269 (class 0 OID 0)
-- Dependencies: 212
-- Name: dieta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE dieta_id_seq OWNED BY dieta.id;


--
-- TOC entry 180 (class 1259 OID 19604)
-- Name: divisa_id_divisa_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE divisa_id_divisa_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE divisa_id_divisa_pk_seq OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 28165)
-- Name: edad_mascota; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE edad_mascota (
    id integer NOT NULL,
    tipo character varying(30),
    descripcion character varying(30),
    edad_desde double precision,
    edad_hasta double precision
);


ALTER TABLE edad_mascota OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 28163)
-- Name: edad_mascota_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE edad_mascota_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE edad_mascota_id_seq OWNER TO postgres;

--
-- TOC entry 2270 (class 0 OID 0)
-- Dependencies: 198
-- Name: edad_mascota_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE edad_mascota_id_seq OWNED BY edad_mascota.id;


--
-- TOC entry 193 (class 1259 OID 28126)
-- Name: mascota; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mascota (
    id_mascota integer NOT NULL,
    id_cliente integer,
    nombre character varying(100),
    tipo integer,
    raza integer,
    fecha_nacimiento date,
    edad integer,
    clasificacion integer,
    sexo integer,
    color character varying(100),
    esterilizado integer,
    longitud integer,
    longitud_medida integer,
    peso integer,
    peso_medida integer,
    foto character varying(100),
    observacion text,
    created_date date,
    modified_date date,
    created_by integer,
    modified_by integer
);


ALTER TABLE mascota OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 28124)
-- Name: mascota_id_mascota_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mascota_id_mascota_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mascota_id_mascota_seq OWNER TO postgres;

--
-- TOC entry 2271 (class 0 OID 0)
-- Dependencies: 192
-- Name: mascota_id_mascota_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mascota_id_mascota_seq OWNED BY mascota.id_mascota;


--
-- TOC entry 173 (class 1259 OID 19389)
-- Name: perfil; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE perfil (
    id integer NOT NULL,
    nombre_perfil character varying(150)
);


ALTER TABLE perfil OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 19401)
-- Name: perfil_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE perfil_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE perfil_id_seq OWNER TO postgres;

--
-- TOC entry 2272 (class 0 OID 0)
-- Dependencies: 174
-- Name: perfil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE perfil_id_seq OWNED BY perfil.id;


--
-- TOC entry 203 (class 1259 OID 28181)
-- Name: peso_mascota; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE peso_mascota (
    id integer NOT NULL,
    cantidad integer,
    medida character varying(12),
    unidad_medida integer
);


ALTER TABLE peso_mascota OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 28179)
-- Name: peso_mascota_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE peso_mascota_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE peso_mascota_id_seq OWNER TO postgres;

--
-- TOC entry 2273 (class 0 OID 0)
-- Dependencies: 202
-- Name: peso_mascota_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE peso_mascota_id_seq OWNED BY peso_mascota.id;


--
-- TOC entry 211 (class 1259 OID 28229)
-- Name: porcion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE porcion (
    id integer NOT NULL,
    id_peso integer,
    id_edad integer,
    cantidad_gramos double precision,
    porcentaje_grasa integer,
    porcentaje_proteina integer,
    porcentaje_vegetal double precision
);


ALTER TABLE porcion OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 28227)
-- Name: porcion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE porcion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE porcion_id_seq OWNER TO postgres;

--
-- TOC entry 2274 (class 0 OID 0)
-- Dependencies: 210
-- Name: porcion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE porcion_id_seq OWNED BY porcion.id;


--
-- TOC entry 209 (class 1259 OID 28215)
-- Name: precio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE precio (
    id integer NOT NULL,
    id_alimento integer,
    precio_kilo double precision,
    precio_gramo double precision,
    fecha date
);


ALTER TABLE precio OWNER TO postgres;

--
-- TOC entry 2275 (class 0 OID 0)
-- Dependencies: 209
-- Name: COLUMN precio.precio_kilo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN precio.precio_kilo IS '
';


--
-- TOC entry 208 (class 1259 OID 28213)
-- Name: precio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE precio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE precio_id_seq OWNER TO postgres;

--
-- TOC entry 2276 (class 0 OID 0)
-- Dependencies: 208
-- Name: precio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE precio_id_seq OWNED BY precio.id;


--
-- TOC entry 197 (class 1259 OID 28150)
-- Name: raza_mascota; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE raza_mascota (
    id integer NOT NULL,
    id_tipo integer,
    descripcion character varying(100),
    foto character varying(50)
);


ALTER TABLE raza_mascota OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 28148)
-- Name: raza_mascota_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE raza_mascota_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE raza_mascota_id_seq OWNER TO postgres;

--
-- TOC entry 2277 (class 0 OID 0)
-- Dependencies: 196
-- Name: raza_mascota_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE raza_mascota_id_seq OWNED BY raza_mascota.id;


--
-- TOC entry 191 (class 1259 OID 28117)
-- Name: sexo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sexo (
    id integer NOT NULL,
    descripcion character varying(50)
);


ALTER TABLE sexo OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 28115)
-- Name: sexo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sexo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sexo_id_seq OWNER TO postgres;

--
-- TOC entry 2278 (class 0 OID 0)
-- Dependencies: 190
-- Name: sexo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sexo_id_seq OWNED BY sexo.id;


--
-- TOC entry 217 (class 1259 OID 28297)
-- Name: si_no; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE si_no (
    id integer NOT NULL,
    descripcion character varying(2)
);


ALTER TABLE si_no OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 28295)
-- Name: si_no_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE si_no_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE si_no_id_seq OWNER TO postgres;

--
-- TOC entry 2279 (class 0 OID 0)
-- Dependencies: 216
-- Name: si_no_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE si_no_id_seq OWNED BY si_no.id;


--
-- TOC entry 182 (class 1259 OID 19651)
-- Name: tbl_contratista_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tbl_contratista_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tbl_contratista_id_seq OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 19608)
-- Name: tbl_estado; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tbl_estado (
    id integer NOT NULL,
    descripcion character varying(20),
    longitud text,
    latitud text
);


ALTER TABLE tbl_estado OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 19653)
-- Name: tbl_estado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tbl_estado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tbl_estado_id_seq OWNER TO postgres;

--
-- TOC entry 2280 (class 0 OID 0)
-- Dependencies: 183
-- Name: tbl_estado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tbl_estado_id_seq OWNED BY tbl_estado.id;


--
-- TOC entry 184 (class 1259 OID 19655)
-- Name: tbl_municipio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tbl_municipio (
    id integer NOT NULL,
    descripcion character varying(40),
    id_estado integer
);


ALTER TABLE tbl_municipio OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 19658)
-- Name: tbl_municipio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tbl_municipio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tbl_municipio_id_seq OWNER TO postgres;

--
-- TOC entry 2281 (class 0 OID 0)
-- Dependencies: 185
-- Name: tbl_municipio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tbl_municipio_id_seq OWNED BY tbl_municipio.id;


--
-- TOC entry 186 (class 1259 OID 19660)
-- Name: tbl_parroquia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tbl_parroquia (
    id integer NOT NULL,
    descripcion character varying(40),
    id_municipio integer
);


ALTER TABLE tbl_parroquia OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 19663)
-- Name: tbl_parroquia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tbl_parroquia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tbl_parroquia_id_seq OWNER TO postgres;

--
-- TOC entry 2282 (class 0 OID 0)
-- Dependencies: 187
-- Name: tbl_parroquia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tbl_parroquia_id_seq OWNED BY tbl_parroquia.id;


--
-- TOC entry 205 (class 1259 OID 28194)
-- Name: tipo_alimento; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_alimento (
    id integer NOT NULL,
    descripcion character varying(30)
);


ALTER TABLE tipo_alimento OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 28192)
-- Name: tipo_alimento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_alimento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_alimento_id_seq OWNER TO postgres;

--
-- TOC entry 2283 (class 0 OID 0)
-- Dependencies: 204
-- Name: tipo_alimento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_alimento_id_seq OWNED BY tipo_alimento.id;


--
-- TOC entry 195 (class 1259 OID 28142)
-- Name: tipo_mascota; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_mascota (
    id integer NOT NULL,
    descripcion character varying(50)
);


ALTER TABLE tipo_mascota OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 28140)
-- Name: tipo_mascota_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_mascota_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_mascota_id_seq OWNER TO postgres;

--
-- TOC entry 2284 (class 0 OID 0)
-- Dependencies: 194
-- Name: tipo_mascota_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_mascota_id_seq OWNED BY tipo_mascota.id;


--
-- TOC entry 201 (class 1259 OID 28173)
-- Name: unidad_medida; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE unidad_medida (
    id integer NOT NULL,
    descripcion character varying(12)
);


ALTER TABLE unidad_medida OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 28171)
-- Name: unidad_medida_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE unidad_medida_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE unidad_medida_id_seq OWNER TO postgres;

--
-- TOC entry 2285 (class 0 OID 0)
-- Dependencies: 200
-- Name: unidad_medida_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE unidad_medida_id_seq OWNED BY unidad_medida.id;


--
-- TOC entry 175 (class 1259 OID 19470)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuario (
    id integer NOT NULL,
    username character varying(128) NOT NULL,
    password character varying(128) NOT NULL,
    blnborrado boolean DEFAULT false,
    created_date date,
    modified_date date,
    created_by integer,
    modified_by integer,
    id_perfil integer,
    str_nombre character varying(150),
    str_apellido character varying(150),
    int_cedula integer
);


ALTER TABLE usuario OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 19479)
-- Name: usuario_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuario_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuario_id_seq1 OWNER TO postgres;

--
-- TOC entry 2286 (class 0 OID 0)
-- Dependencies: 176
-- Name: usuario_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuario_id_seq1 OWNED BY usuario.id;


--
-- TOC entry 2036 (class 2604 OID 28205)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alimento ALTER COLUMN id SET DEFAULT nextval('alimento_id_seq'::regclass);


--
-- TOC entry 2027 (class 2604 OID 28093)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente ALTER COLUMN id SET DEFAULT nextval('cliente_id_seq'::regclass);


--
-- TOC entry 2039 (class 2604 OID 28274)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dieta ALTER COLUMN id SET DEFAULT nextval('dieta_id_seq'::regclass);


--
-- TOC entry 2040 (class 2604 OID 28292)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dieta_detalle ALTER COLUMN id SET DEFAULT nextval('dieta_detalle_id_seq'::regclass);


--
-- TOC entry 2032 (class 2604 OID 28168)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY edad_mascota ALTER COLUMN id SET DEFAULT nextval('edad_mascota_id_seq'::regclass);


--
-- TOC entry 2029 (class 2604 OID 28129)
-- Name: id_mascota; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mascota ALTER COLUMN id_mascota SET DEFAULT nextval('mascota_id_mascota_seq'::regclass);


--
-- TOC entry 2021 (class 2604 OID 26282)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY perfil ALTER COLUMN id SET DEFAULT nextval('perfil_id_seq'::regclass);


--
-- TOC entry 2034 (class 2604 OID 28184)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY peso_mascota ALTER COLUMN id SET DEFAULT nextval('peso_mascota_id_seq'::regclass);


--
-- TOC entry 2038 (class 2604 OID 28232)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY porcion ALTER COLUMN id SET DEFAULT nextval('porcion_id_seq'::regclass);


--
-- TOC entry 2037 (class 2604 OID 28218)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY precio ALTER COLUMN id SET DEFAULT nextval('precio_id_seq'::regclass);


--
-- TOC entry 2031 (class 2604 OID 28153)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY raza_mascota ALTER COLUMN id SET DEFAULT nextval('raza_mascota_id_seq'::regclass);


--
-- TOC entry 2028 (class 2604 OID 28120)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sexo ALTER COLUMN id SET DEFAULT nextval('sexo_id_seq'::regclass);


--
-- TOC entry 2041 (class 2604 OID 28300)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY si_no ALTER COLUMN id SET DEFAULT nextval('si_no_id_seq'::regclass);


--
-- TOC entry 2024 (class 2604 OID 26311)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tbl_estado ALTER COLUMN id SET DEFAULT nextval('tbl_estado_id_seq'::regclass);


--
-- TOC entry 2025 (class 2604 OID 26312)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tbl_municipio ALTER COLUMN id SET DEFAULT nextval('tbl_municipio_id_seq'::regclass);


--
-- TOC entry 2026 (class 2604 OID 26313)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tbl_parroquia ALTER COLUMN id SET DEFAULT nextval('tbl_parroquia_id_seq'::regclass);


--
-- TOC entry 2035 (class 2604 OID 28197)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_alimento ALTER COLUMN id SET DEFAULT nextval('tipo_alimento_id_seq'::regclass);


--
-- TOC entry 2030 (class 2604 OID 28145)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_mascota ALTER COLUMN id SET DEFAULT nextval('tipo_mascota_id_seq'::regclass);


--
-- TOC entry 2033 (class 2604 OID 28176)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY unidad_medida ALTER COLUMN id SET DEFAULT nextval('unidad_medida_id_seq'::regclass);


--
-- TOC entry 2023 (class 2604 OID 26294)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario ALTER COLUMN id SET DEFAULT nextval('usuario_id_seq1'::regclass);


--
-- TOC entry 2217 (class 0 OID 19564)
-- Dependencies: 177
-- Data for Name: AuthAssignment; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Administrador', '9', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Alto Rango', '30', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Alto Rango', '2', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Avanzado', '34', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Administrador', '13', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '73', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Basico', '18', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Avanzado', '17', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Administrador', '33', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Administrador', '25', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Basico', '26', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Basico', '27', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Basico', '29', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Basico', '28', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '67', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Avanzado', '19', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '88', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '40', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '44', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Administrador', '8', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Administrador', '47', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Basico', '68', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Basico', '69', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Alto Rango', '51', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Administrador', '45', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '70', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '36', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '37', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '42', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Basico', '71', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '31', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '43', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '59', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Administrador', '48', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Administrador', '49', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '55', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '54', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Administrador', '16', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '39', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '89', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '50', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Administrador', '12', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Basico', '90', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '72', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '91', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Basico', '61', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Basico', '62', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Administrador', '46', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '63', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '64', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '75', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '53', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '65', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '66', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '74', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Avanzado', '32', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Basico', '60', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '76', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Basico', '77', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Basico', '78', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '57', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Alto Rango', '79', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Alto Rango', '80', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Alto Rango', '81', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '82', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '83', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Administrador', '10', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Basico', '84', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Avanzado', '85', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '86', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Basico', '87', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Administrador', '35', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '92', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Basico', '93', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '94', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '58', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '95', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '96', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '56', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Basico', '98', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Administrador', '100', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Administrador', '101', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Administrador', '99', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '41', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '97', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Medio', '38', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Avanzado', '102', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Alto Rango', '103', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Administrador', '104', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Administrador', '106', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Basico', '105', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Administrador', '108', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Avanzado', '52', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Avanzado', '107', NULL, 'N;');
INSERT INTO "AuthAssignment" (itemname, userid, bizrule, data) VALUES ('Administrador', '1', NULL, 'N;');


--
-- TOC entry 2218 (class 0 OID 19570)
-- Dependencies: 178
-- Data for Name: AuthItem; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "AuthItem" (name, type, description, bizrule, data) VALUES ('obra', 1, 'Distintos modulos de obra', NULL, 'N;');
INSERT INTO "AuthItem" (name, type, description, bizrule, data) VALUES ('Administrador', 2, 'Rol para administrador', NULL, 'N;');
INSERT INTO "AuthItem" (name, type, description, bizrule, data) VALUES ('Basico', 2, 'Rol para Basico', NULL, 'N;');
INSERT INTO "AuthItem" (name, type, description, bizrule, data) VALUES ('crear', 0, 'operacion para crear', NULL, 'N;');
INSERT INTO "AuthItem" (name, type, description, bizrule, data) VALUES ('ver', 0, 'operacion para ver', NULL, 'N;');
INSERT INTO "AuthItem" (name, type, description, bizrule, data) VALUES ('eliminar', 0, 'operacion para eliminar', NULL, 'N;');
INSERT INTO "AuthItem" (name, type, description, bizrule, data) VALUES ('actualizar', 0, 'operacion para actualizar', NULL, 'N;');
INSERT INTO "AuthItem" (name, type, description, bizrule, data) VALUES ('administrar', 0, 'operacion para administrar', NULL, 'N;');
INSERT INTO "AuthItem" (name, type, description, bizrule, data) VALUES ('Alto Rango', 2, 'Rol para alto rango', NULL, 'N;');
INSERT INTO "AuthItem" (name, type, description, bizrule, data) VALUES ('Medio', 2, 'Rol para medio', NULL, 'N;');
INSERT INTO "AuthItem" (name, type, description, bizrule, data) VALUES ('Avanzado', 2, 'Rol para avanzado', NULL, 'N;');


--
-- TOC entry 2219 (class 0 OID 19576)
-- Dependencies: 179
-- Data for Name: AuthItemChild; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "AuthItemChild" (parent, child) VALUES ('obra', 'ver');
INSERT INTO "AuthItemChild" (parent, child) VALUES ('obra', 'administrar');
INSERT INTO "AuthItemChild" (parent, child) VALUES ('Basico', 'obra');
INSERT INTO "AuthItemChild" (parent, child) VALUES ('Alto Rango', 'obra');
INSERT INTO "AuthItemChild" (parent, child) VALUES ('Avanzado', 'Medio');
INSERT INTO "AuthItemChild" (parent, child) VALUES ('Basico', 'crear');
INSERT INTO "AuthItemChild" (parent, child) VALUES ('Medio', 'Basico');
INSERT INTO "AuthItemChild" (parent, child) VALUES ('Administrador', 'Avanzado');
INSERT INTO "AuthItemChild" (parent, child) VALUES ('Avanzado', 'actualizar');
INSERT INTO "AuthItemChild" (parent, child) VALUES ('Administrador', 'eliminar');


--
-- TOC entry 2247 (class 0 OID 28202)
-- Dependencies: 207
-- Data for Name: alimento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO alimento (id, descripcion, tipo_alimento) VALUES (1, 'RES', 1);
INSERT INTO alimento (id, descripcion, tipo_alimento) VALUES (2, 'POLLO', 1);
INSERT INTO alimento (id, descripcion, tipo_alimento) VALUES (3, 'PESCADO', 1);
INSERT INTO alimento (id, descripcion, tipo_alimento) VALUES (4, 'HIGADO', 1);
INSERT INTO alimento (id, descripcion, tipo_alimento) VALUES (5, 'HUEVO', 4);
INSERT INTO alimento (id, descripcion, tipo_alimento) VALUES (6, 'CORAZON', 1);
INSERT INTO alimento (id, descripcion, tipo_alimento) VALUES (7, 'GRASA ANIMAL', 3);
INSERT INTO alimento (id, descripcion, tipo_alimento) VALUES (8, 'CHIA', 2);
INSERT INTO alimento (id, descripcion, tipo_alimento) VALUES (9, 'QUINOA', 2);
INSERT INTO alimento (id, descripcion, tipo_alimento) VALUES (10, 'CAMBUR', 5);
INSERT INTO alimento (id, descripcion, tipo_alimento) VALUES (11, 'LECHOZA', 5);
INSERT INTO alimento (id, descripcion, tipo_alimento) VALUES (12, 'MANZANA', 5);
INSERT INTO alimento (id, descripcion, tipo_alimento) VALUES (13, 'ESPINACA', 2);
INSERT INTO alimento (id, descripcion, tipo_alimento) VALUES (14, 'BROCOLI', 2);
INSERT INTO alimento (id, descripcion, tipo_alimento) VALUES (15, 'AUYAMA', 2);
INSERT INTO alimento (id, descripcion, tipo_alimento) VALUES (16, 'ALCACHOFA', 2);
INSERT INTO alimento (id, descripcion, tipo_alimento) VALUES (17, 'CALABACIN', 2);
INSERT INTO alimento (id, descripcion, tipo_alimento) VALUES (18, 'BERENJENA', 2);
INSERT INTO alimento (id, descripcion, tipo_alimento) VALUES (19, 'ZANAHORIA', 2);
INSERT INTO alimento (id, descripcion, tipo_alimento) VALUES (20, 'ALBAHACA', 2);
INSERT INTO alimento (id, descripcion, tipo_alimento) VALUES (21, 'CEBADA', 2);


--
-- TOC entry 2287 (class 0 OID 0)
-- Dependencies: 206
-- Name: alimento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('alimento_id_seq', 1, false);


--
-- TOC entry 2229 (class 0 OID 28090)
-- Dependencies: 189
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cliente (id, cedula, nombre, apellido, sexo, direccion, telefono, telefono_casa, correo_electronico, created_date, modified_date, created_by, modified_by) VALUES (1, 18043559, 'Jiuly', 'Rojas', 2, 'El Paraiso', '(0412)-295-6779', '(0212)-483-1757', 'jiuly256@gmail.com', '2016-08-13', '2016-08-13', 2, 2);


--
-- TOC entry 2288 (class 0 OID 0)
-- Dependencies: 188
-- Name: cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cliente_id_seq', 1, true);


--
-- TOC entry 2253 (class 0 OID 28271)
-- Dependencies: 213
-- Data for Name: dieta; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2255 (class 0 OID 28289)
-- Dependencies: 215
-- Data for Name: dieta_detalle; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2289 (class 0 OID 0)
-- Dependencies: 214
-- Name: dieta_detalle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('dieta_detalle_id_seq', 1, false);


--
-- TOC entry 2290 (class 0 OID 0)
-- Dependencies: 212
-- Name: dieta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('dieta_id_seq', 1, false);


--
-- TOC entry 2291 (class 0 OID 0)
-- Dependencies: 180
-- Name: divisa_id_divisa_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('divisa_id_divisa_pk_seq', 1, false);


--
-- TOC entry 2239 (class 0 OID 28165)
-- Dependencies: 199
-- Data for Name: edad_mascota; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO edad_mascota (id, tipo, descripcion, edad_desde, edad_hasta) VALUES (1, 'Cachorro A', '2-6 Meses', 0.200000000000000011, 0.599999999999999978);
INSERT INTO edad_mascota (id, tipo, descripcion, edad_desde, edad_hasta) VALUES (2, 'Cachorro B', '6-12 Meses', 0.599999999999999978, 1);
INSERT INTO edad_mascota (id, tipo, descripcion, edad_desde, edad_hasta) VALUES (3, 'Adulto Normal', '1 Año+', 1, 25);
INSERT INTO edad_mascota (id, tipo, descripcion, edad_desde, edad_hasta) VALUES (4, 'Adulto Activo', '1 Año+', 1, 25);
INSERT INTO edad_mascota (id, tipo, descripcion, edad_desde, edad_hasta) VALUES (5, 'Adulto Sedentario', '1 Año+', 1, 25);
INSERT INTO edad_mascota (id, tipo, descripcion, edad_desde, edad_hasta) VALUES (6, 'Adulto Esterilizado', '1 Año+', 1, 25);


--
-- TOC entry 2292 (class 0 OID 0)
-- Dependencies: 198
-- Name: edad_mascota_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('edad_mascota_id_seq', 1, false);


--
-- TOC entry 2233 (class 0 OID 28126)
-- Dependencies: 193
-- Data for Name: mascota; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2293 (class 0 OID 0)
-- Dependencies: 192
-- Name: mascota_id_mascota_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('mascota_id_mascota_seq', 1, false);


--
-- TOC entry 2213 (class 0 OID 19389)
-- Dependencies: 173
-- Data for Name: perfil; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO perfil (id, nombre_perfil) VALUES (1, 'Administrador');
INSERT INTO perfil (id, nombre_perfil) VALUES (2, 'Basico');
INSERT INTO perfil (id, nombre_perfil) VALUES (3, 'Alto Rango');
INSERT INTO perfil (id, nombre_perfil) VALUES (4, 'Medio');
INSERT INTO perfil (id, nombre_perfil) VALUES (5, 'Avanzado');


--
-- TOC entry 2294 (class 0 OID 0)
-- Dependencies: 174
-- Name: perfil_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('perfil_id_seq', 2, true);


--
-- TOC entry 2243 (class 0 OID 28181)
-- Dependencies: 203
-- Data for Name: peso_mascota; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO peso_mascota (id, cantidad, medida, unidad_medida) VALUES (1, 1, 'KG', 1);
INSERT INTO peso_mascota (id, cantidad, medida, unidad_medida) VALUES (2, 5, 'KG', 1);
INSERT INTO peso_mascota (id, cantidad, medida, unidad_medida) VALUES (3, 10, 'KG', 1);
INSERT INTO peso_mascota (id, cantidad, medida, unidad_medida) VALUES (4, 15, 'KG', 1);
INSERT INTO peso_mascota (id, cantidad, medida, unidad_medida) VALUES (5, 20, 'KG', 1);
INSERT INTO peso_mascota (id, cantidad, medida, unidad_medida) VALUES (6, 25, 'KG', 1);
INSERT INTO peso_mascota (id, cantidad, medida, unidad_medida) VALUES (7, 30, 'KG', 1);
INSERT INTO peso_mascota (id, cantidad, medida, unidad_medida) VALUES (8, 35, 'KG', 1);
INSERT INTO peso_mascota (id, cantidad, medida, unidad_medida) VALUES (9, 40, 'KG', 1);
INSERT INTO peso_mascota (id, cantidad, medida, unidad_medida) VALUES (10, 45, 'KG', 1);
INSERT INTO peso_mascota (id, cantidad, medida, unidad_medida) VALUES (11, 50, 'KG', 1);


--
-- TOC entry 2295 (class 0 OID 0)
-- Dependencies: 202
-- Name: peso_mascota_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('peso_mascota_id_seq', 1, false);


--
-- TOC entry 2251 (class 0 OID 28229)
-- Dependencies: 211
-- Data for Name: porcion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (1, 1, 1, 100, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (2, 1, 2, 60, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (3, 1, 3, 30, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (4, 1, 4, 25, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (5, 1, 5, 20, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (6, 2, 1, 500, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (7, 2, 2, 300, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (8, 2, 3, 159, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (9, 2, 4, 125, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (10, 2, 5, 100, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (11, 3, 1, 1000, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (12, 3, 2, 600, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (13, 3, 3, 300, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (14, 3, 4, 250, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (15, 3, 5, 200, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (16, 4, 1, 1500, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (17, 4, 2, 900, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (18, 4, 3, 450, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (19, 4, 4, 375, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (20, 4, 5, 300, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (21, 5, 1, 2000, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (22, 5, 2, 1200, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (23, 5, 3, 600, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (24, 5, 4, 500, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (25, 5, 5, 400, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (26, 6, 1, 2500, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (27, 6, 2, 1500, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (28, 6, 3, 750, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (29, 6, 4, 625, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (30, 6, 5, 500, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (31, 7, 2, 1800, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (32, 7, 3, 900, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (33, 7, 4, 750, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (34, 7, 5, 600, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (35, 8, 2, 2100, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (36, 8, 3, 1050, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (37, 8, 4, 875, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (38, 8, 5, 700, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (39, 9, 2, 2400, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (40, 9, 3, 1200, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (41, 9, 4, 1000, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (42, 9, 5, 800, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (43, 10, 2, 2700, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (44, 10, 3, 1350, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (45, 10, 4, 1125, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (46, 10, 5, 900, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (47, 11, 2, 3000, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (48, 11, 3, 1500, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (49, 11, 4, 1250, 0, 70, 30);
INSERT INTO porcion (id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal) VALUES (50, 11, 5, 1000, 0, 70, 30);


--
-- TOC entry 2296 (class 0 OID 0)
-- Dependencies: 210
-- Name: porcion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('porcion_id_seq', 1, false);


--
-- TOC entry 2249 (class 0 OID 28215)
-- Dependencies: 209
-- Data for Name: precio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO precio (id, id_alimento, precio_kilo, precio_gramo, fecha) VALUES (1, 1, 5000, 5, '2016-08-15');
INSERT INTO precio (id, id_alimento, precio_kilo, precio_gramo, fecha) VALUES (2, 2, 2500, 2.5, '2016-08-15');
INSERT INTO precio (id, id_alimento, precio_kilo, precio_gramo, fecha) VALUES (3, 3, 500, 0.5, '2016-08-15');
INSERT INTO precio (id, id_alimento, precio_kilo, precio_gramo, fecha) VALUES (4, 4, 1500, 1.5, '2016-08-15');
INSERT INTO precio (id, id_alimento, precio_kilo, precio_gramo, fecha) VALUES (5, 5, 60, 60, '2016-08-15');
INSERT INTO precio (id, id_alimento, precio_kilo, precio_gramo, fecha) VALUES (6, 6, 1500, 1.5, '2016-08-15');
INSERT INTO precio (id, id_alimento, precio_kilo, precio_gramo, fecha) VALUES (7, 7, 100, 0.100000000000000006, '2016-08-15');
INSERT INTO precio (id, id_alimento, precio_kilo, precio_gramo, fecha) VALUES (8, 8, 6000, 6, '2016-08-15');
INSERT INTO precio (id, id_alimento, precio_kilo, precio_gramo, fecha) VALUES (9, 9, 6000, 6, '2016-08-15');
INSERT INTO precio (id, id_alimento, precio_kilo, precio_gramo, fecha) VALUES (10, 11, 700, 0.699999999999999956, '2016-08-15');
INSERT INTO precio (id, id_alimento, precio_kilo, precio_gramo, fecha) VALUES (11, 13, 850, 0.849999999999999978, '2016-08-15');
INSERT INTO precio (id, id_alimento, precio_kilo, precio_gramo, fecha) VALUES (12, 14, 850, 0.849999999999999978, '2016-08-15');
INSERT INTO precio (id, id_alimento, precio_kilo, precio_gramo, fecha) VALUES (13, 15, 850, 0.849999999999999978, '2016-08-15');
INSERT INTO precio (id, id_alimento, precio_kilo, precio_gramo, fecha) VALUES (14, 16, 1300, 1.30000000000000004, '2016-08-15');
INSERT INTO precio (id, id_alimento, precio_kilo, precio_gramo, fecha) VALUES (15, 17, 850, 0.849999999999999978, '2016-08-15');
INSERT INTO precio (id, id_alimento, precio_kilo, precio_gramo, fecha) VALUES (16, 18, 900, 0.900000000000000022, '2016-08-15');
INSERT INTO precio (id, id_alimento, precio_kilo, precio_gramo, fecha) VALUES (17, 19, 900, 0.900000000000000022, '2016-08-15');
INSERT INTO precio (id, id_alimento, precio_kilo, precio_gramo, fecha) VALUES (18, 20, 1300, 1.30000000000000004, '2016-08-15');
INSERT INTO precio (id, id_alimento, precio_kilo, precio_gramo, fecha) VALUES (19, 21, 4166, 4.16600000000000037, '2016-08-15');


--
-- TOC entry 2297 (class 0 OID 0)
-- Dependencies: 208
-- Name: precio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('precio_id_seq', 1, false);


--
-- TOC entry 2237 (class 0 OID 28150)
-- Dependencies: 197
-- Data for Name: raza_mascota; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (1, 1, 'Affenpinscher ', '22-Affenpinscher.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (2, 1, 'Afgano ', '23-Afgano .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (3, 1, 'Airedale Terrier ', '24-Airedale Terrier .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (4, 1, 'Akita ', '25-Akita .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (5, 1, 'American Eskimo Dog ', '26-American Eskimo Dog .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (6, 1, 'American Staffordshire Terrier ', '27-American Staffordshire Terrier .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (7, 1, 'Australian Cattle Dog ', '28-Australian Cattle Dog .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (8, 1, 'Azawakh ', '2977-Azawakh .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (9, 1, 'Barbet ', '29-Barbet .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (10, 1, 'Basenji ', '30-Basenji .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (11, 1, 'Basset Hound ', '31-Basset Hound .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (12, 1, 'Beagle ', '32-Beagle .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (13, 1, 'Beauceron ', '33-Beauceron .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (14, 1, 'Bedlington Terrier ', '34-Bedlington Terrier .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (15, 1, 'Bergamasco ', '2981-Bergamasco .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (16, 1, 'Bernés de la Montaña ', '35-Bernés de la Montaña .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (17, 1, 'Bichon Frise ', '36-Bichon Frise .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (18, 1, 'Bichón Habanero ', '37-Bichón Habanero .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (19, 1, 'Black Russian Terrier ', '38-Black Russian Terrier .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (20, 1, 'Bloodhound ', '39-Bloodhound .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (21, 1, 'Bluetick Coonhound ', '2982-Bluetick Coonhound .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (22, 1, 'Bobtail ', '40-Bobtail .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (23, 1, 'Boerboel ', '2983-Boerboel .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (24, 1, 'Border Collie ', '41-Border Collie .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (25, 1, 'Border Terrier ', '42-Border Terrier .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (26, 1, 'Borzoi', '43-Borzoi.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (27, 1, 'Boston Terrier ', '44-Boston Terrier .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (28, 1, 'Bouvier des Flandres', '45-Bouvier des Flandres.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (29, 1, 'Bóxer ', '46-Bóxer .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (30, 1, 'Boykin Spaniel ', '47-Boykin Spaniel .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (31, 1, 'Braco Alemán Pelo Corto ', '48-Braco Alemán Pelo Corto .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (32, 1, 'Braco Alemán Pelo Duro ', '49-Braco Alemán Pelo Duro .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (33, 1, 'Braco Italiano ', '50-Braco Italiano .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (34, 1, 'Briard', '51-Briard.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (35, 1, 'Brittany Spaniel ', '52-Brittany Spaniel .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (36, 1, 'Broholmer ', '2984-Broholmer .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (37, 1, 'Buhund Noruego ', '53-Buhund Noruego .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (38, 1, 'Bull Terrier ', '54-Bull Terrier .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (39, 1, 'Bulldog Francés ', '55-Bulldog Francés .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (40, 1, 'Bulldog Inglés ', '56-Bulldog Inglés .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (41, 1, 'Bulldog Americano ', '57-Bulldog Americano .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (42, 1, 'Bullmastin ', '58-Bullmastin .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (43, 1, 'Bullterrier Miniatura ', '59-Bullterrier Miniatura .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (44, 1, 'Cairn Terrier ', '60-Cairn Terrier .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (45, 1, 'Canaan ', '61-Canaan .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (46, 1, 'Cardigan Welsh Corgi ', '62-Cardigan Welsh Corgi .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (47, 1, 'Catahoula Leopard Dog ', '63-Catahoula Leopard Dog .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (48, 1, 'Cavalier King Charles Spaniel', '64-Cavalier King Charles Spaniel.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (49, 1, 'Cesky Terrier ', '65-Cesky Terrier .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (50, 1, 'Chesapeake Bay Retriever ', '66-Chesapeake Bay Retriever .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (51, 1, 'Chihuahua ', '67-Chihuahua .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (52, 1, 'Chin Japones ', '68-Chin Japones .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (53, 1, 'Chow Chow ', '69-Chow Chow .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (54, 1, 'Cirneco dell´Etna ', '2987-Cirneco dell´Etna .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (55, 1, 'Clumber Spaniel ', '70-Clumber Spaniel .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (56, 1, 'Cocker Spaniel Americano ', '71-Cocker Spaniel Americano .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (57, 1, 'Cocker Spaniel Inglés ', '72-Cocker Spaniel Inglés .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (58, 1, 'Collie ', '73-Collie .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (59, 1, 'Collie Barbudo ', '74-Collie Barbudo .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (60, 1, 'Coonhound de Redbone ', '75-Coonhound de Redbone .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (61, 1, 'Coonhound Inglés ', '76-Coonhound Inglés .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (62, 1, 'Coonhound Negro y Fuego ', '77-Coonhound Negro y Fuego .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (63, 1, 'Crestado Chino ', '78-Crestado Chino .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (64, 1, 'Dachshund (Salchicha) ', '79-Dachshund (Salchicha) .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (65, 1, 'Dálmata ', '80-Dálmata .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (66, 1, 'Dandie Dinmont Terrier ', '81-Dandie Dinmont Terrier .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (67, 1, 'Deerhound Escocés ', '82-Deerhound Escocés .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (68, 1, 'Doberman ', '83-Doberman .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (69, 1, 'Dogo Argentino ', '84-Dogo Argentino .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (70, 1, 'Dogue des Bordeaux ', '85-Dogue des Bordeaux .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (71, 1, 'East Siberian Laika ', '86-East Siberian Laika .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (72, 1, 'Faraón Hound ', '87-Faraón Hound .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (73, 1, 'Field Spaniel ', '88-Field Spaniel .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (74, 1, 'Fila Brasileiro ', '89-Fila Brasileiro .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (75, 1, 'Finnish Lapphund ', '90-Finnish Lapphund .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (76, 1, 'Fox Terrier (Toy) ', '91-Fox Terrier (Toy) .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (77, 1, 'Fox Terrier de Pelo Duro ', '92-Fox Terrier de Pelo Duro .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (78, 1, 'Fox Terrier de Pelo Liso ', '93-Fox Terrier de Pelo Liso .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (79, 1, 'Foxhound Américano ', '94-Foxhound Américano .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (80, 1, 'Foxhound Inglés ', '95-Foxhound Inglés .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (81, 1, 'Galgo Español ', '97-Galgo Español .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (82, 1, 'Galgo Italiano ', '98-Galgo Italiano .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (83, 1, 'German Hunting Terrier ', '99-German Hunting Terrier .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (84, 1, 'Glen of Imaal Terrier', '100-Glen of Imaal Terrier.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (85, 1, 'Golden Retriever ', '101-Golden Retriever .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (86, 1, 'Gordon Setter', '102-Gordon Setter.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (87, 1, 'Gran Danés ', '103-Gran Danés .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (88, 1, 'Gran Pirineo ', '104-Gran Pirineo .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (89, 1, 'Gran Suizo de la Montaña ', '105-Gran Suizo de la Montaña .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (90, 1, 'Greenland Dog ', '151-Greenland Dog .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (91, 1, 'Greyhound ', '96-Greyhound .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (92, 1, 'Griffon de Bruselas ', '106-Griffon de Bruselas .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (93, 1, 'Harrier ', '107-Harrier .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (94, 1, 'Husky Siberiano ', '108-Husky Siberiano .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (95, 1, 'Icelandic Sheepdog', '109-Icelandic Sheepdog.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (96, 1, 'Jack Russell Terrier ', '110-Jack Russell Terrier .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (97, 1, 'Kai', '111-Kai.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (98, 1, 'Kangal', '112-Kangal.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (99, 1, 'Keeshound ', '113-Keeshound .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (100, 1, 'Kelpie Australiano ', '114-Kelpie Australiano .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (101, 1, 'Kerry Blue Terrier ', '115-Kerry Blue Terrier .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (102, 1, 'Komondor ', '116-Komondor .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (103, 1, 'Kuvasz ', '117-Kuvasz .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (104, 1, 'Labrador Retriever ', '118-Labrador Retriever .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (105, 1, 'Lakeland Terrier ', '119-Lakeland Terrier .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (106, 1, 'Leonberger ', '120-Leonberger .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (107, 1, 'Lhasa Apso ', '121-Lhasa Apso .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (108, 1, 'Löwchen ', '122-Löwchen .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (109, 1, 'Lundenhund Noruego ', '123-Lundenhund Noruego .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (110, 1, 'Malamute de Alaska ', '124-Malamute de Alaska .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (111, 1, 'Maltese ', '125-Maltese .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (112, 1, 'Manchester Terrier (Toy) ', '126-Manchester Terrier (Toy) .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (113, 1, 'Manchester Terrier Estandár ', '127-Manchester Terrier Estandár .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (114, 1, 'Mastín ', '128-Mastín .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (115, 1, 'Mastín Napolitano ', '129-Mastín Napolitano .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (116, 1, 'Mastín Tibetano ', '130-Mastín Tibetano .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (117, 1, 'Mudi ', '2994-Mudi .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (118, 1, 'Norfolk Terrier ', '131-Norfolk Terrier .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (119, 1, 'Norwegian Elkhound ', '132-Norwegian Elkhound .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (120, 1, 'Norwich Terrier ', '133-Norwich Terrier .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (121, 1, 'Nova Scotia Duck Tolling Retriever ', '134-Nova Scotia Duck Tolling Retriever .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (122, 1, 'Otterhound ', '135-Otterhound .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (123, 1, 'Papillon ', '136-Papillon .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (124, 1, 'Parson Russell Terrier ', '137-Parson Russell Terrier .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (125, 1, 'Pastor Alemán ', '138-Pastor Alemán .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (126, 1, 'Pastor Australiano ', '139-Pastor Australiano .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (127, 1, 'Pastor Belga de Lakenois ', '140-Pastor Belga de Lakenois .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (128, 1, 'Pastor Belga Malinois ', '141-Pastor Belga Malinois .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (129, 1, 'Pastor Belga Tervueren ', '142-Pastor Belga Tervueren .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (130, 1, 'Pastor de Anatolia ', '143-Pastor de Anatolia .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (131, 1, 'Pastor de los Pirineos ', '144-Pastor de los Pirineos .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (132, 1, 'Pastor de Maremma ', '145-Pastor de Maremma .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (133, 1, 'Pekinés ', '146-Pekinés .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (134, 1, 'Pembroke Welsh Corgi ', '147-Pembroke Welsh Corgi .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (135, 1, 'Perro de Aguas Americano', '148-Perro de Aguas Americano.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (136, 1, 'Perro de Aguas Español', '2995-Perro de Aguas Español.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (137, 1, 'Perro de Aguas Irlandés', '149-Perro de Aguas Irlandés.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (138, 1, 'Perro de Aguas Portugués', '150-Perro de Aguas Portugués.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (139, 1, 'Perro sin Pelo del Perú ', '152-Perro sin Pelo del Perú .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (140, 1, 'Petit Basset Griffon Vendéen', '153-Petit Basset Griffon Vendéen.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (141, 1, 'Pinscher Alemán', '154-Pinscher Alemán.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (142, 1, 'Pinscher Miniatura ', '155-Pinscher Miniatura .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (143, 1, 'Pit Bull Terrier ', '156-Pit Bull Terrier .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (144, 1, 'Plott Hound', '157-Plott Hound.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (145, 1, 'Podenco Ibicenico', '158-Podenco Ibicenico.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (146, 1, 'Podenco Portugués Pequeño', '2996-Podenco Portugués Pequeño.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (147, 1, 'Pointer ', '159-Pointer .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (148, 1, 'Polish Lowland Sheepdog', '160-Polish Lowland Sheepdog.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (149, 1, 'Pomerania ', '161-Pomerania .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (150, 1, 'Poodle (Caniche) ', '164-Poodle (Caniche) .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (151, 1, 'Poodle Gigante ', '163-Poodle Gigante .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (152, 1, 'Poodle Toy (Caniche)', '162-Poodle Toy (Caniche).jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (153, 1, 'Pug (Carlino) ', '163-Pug (Carlino) .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (154, 1, 'Puli ', '165-Puli .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (155, 1, 'Pumi', '2997-Pumi.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (156, 1, 'Rat Terrier', '2998-Rat Terrier.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (157, 1, 'Retriever de Pelo Liso ', '167-Retriever de Pelo Liso .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (158, 1, 'Retriever de Pelo Rizado ', '168-Retriever de Pelo Rizado .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (159, 1, 'Rhodesian Ridgeback ', '169-Rhodesian Ridgeback .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (160, 1, 'Rottweiler ', '170-Rottweiler .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (161, 1, 'Russian European Laika ', '171-Russian European Laika .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (162, 1, 'Saluki', '172-Saluki.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (163, 1, 'Samoyedo ', '173-Samoyedo .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (164, 1, 'San Bernardo ', '174-San Bernardo .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (165, 1, 'Schipperke ', '175-Schipperke .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (166, 1, 'Schnauzer Estándard', '176-Schnauzer Estándard.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (167, 1, 'Schnauzer Gigante', '177-Schnauzer Gigante.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (168, 1, 'Schnauzer Miniatura', '178-Schnauzer Miniatura.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (169, 1, 'Scottish Terrier ', '201-Scottish Terrier .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (170, 1, 'Sealyham Terrier', '179-Sealyham Terrier.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (171, 1, 'Setter Ingles', '180-Setter Ingles.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (172, 1, 'Setter Irlandés ', '181-Setter Irlandés .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (173, 1, 'Setter Rojo y Blanco Irlandés', '182-Setter Rojo y Blanco Irlandés.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (174, 1, 'Shar Pei ', '183-Shar Pei .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (175, 1, 'Shetland Sheepdog ', '184-Shetland Sheepdog .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (176, 1, 'Shiba Inu ', '185-Shiba Inu .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (177, 1, 'Shih Tzu ', '186-Shih Tzu .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (178, 1, 'Silky Terrier', '187-Silky Terrier.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (179, 1, 'Skye Terrier', '188-Skye Terrier.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (180, 1, 'Sloughi', '2999-Sloughi.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (181, 1, 'Soft Coated Wheaten Terrier ', '189-Soft Coated Wheaten Terrier .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (182, 1, 'Spaniel Tibetano', '190-Spaniel Tibetano.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (183, 1, 'Spinone Italiano', '191-Spinone Italiano.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (184, 1, 'Spitz ', '192-Spitz .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (185, 1, 'Springer Spaniel Inglés ', '193-Springer Spaniel Inglés .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (186, 1, 'Staffordhire Bull Terrier', '3000-Staffordhire Bull Terrier.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (187, 1, 'Sussex Spaniel', '194-Sussex Spaniel.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (188, 1, 'Swedish Elkhound ', '195-Swedish Elkhound .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (189, 1, 'Swedish Lapphund', '196-Swedish Lapphund.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (190, 1, 'Swedish Vallhund', '197-Swedish Vallhund.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (191, 1, 'Terranova ', '198-Terranova .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (192, 1, 'Terrier Australiano ', '199-Terrier Australiano .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (193, 1, 'Terrier Brasileiro ', '200-Terrier Brasileiro .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (194, 1, 'Terrier Galés', '202-Terrier Galés.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (195, 1, 'Terrier Irlandés ', '203-Terrier Irlandés .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (196, 1, 'Terrier Japones ', '204-Terrier Japones .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (197, 1, 'Terrier Tibetano ', '205-Terrier Tibetano .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (198, 1, 'Tosa Inu', '206-Tosa Inu.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (199, 1, 'Toy Spaniel Inglés ', '207-Toy Spaniel Inglés .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (200, 1, 'Treeing Walker Coonhound', '208-Treeing Walker Coonhound.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (201, 1, 'Vizsla ', '208-Vizsla .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (202, 1, 'Weimaraner ', '209-Weimaraner .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (203, 1, 'Welsh Springer Spaniel ', '210-Welsh Springer Spaniel .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (204, 1, 'West Highland White Terrier ', '211-West Highland White Terrier .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (205, 1, 'West Siberian Laika ', '212-West Siberian Laika .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (206, 1, 'Whippet ', '213-Whippet .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (207, 1, 'Wirehaired Pointing Griffon ', '214-Wirehaired Pointing Griffon .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (208, 1, 'Wolfhound Irlandés', '215-Wolfhound Irlandés.jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (209, 1, 'Xoloitzcuintle ', '216-Xoloitzcuintle .jpg');
INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (210, 1, 'Yorkshire Terrier', '217-Yorkshire Terrier.jpg');


--
-- TOC entry 2298 (class 0 OID 0)
-- Dependencies: 196
-- Name: raza_mascota_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('raza_mascota_id_seq', 1, false);


--
-- TOC entry 2231 (class 0 OID 28117)
-- Dependencies: 191
-- Data for Name: sexo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO sexo (id, descripcion) VALUES (1, 'Femenino');
INSERT INTO sexo (id, descripcion) VALUES (2, 'Masculino');
INSERT INTO sexo (id, descripcion) VALUES (3, 'Hembra');
INSERT INTO sexo (id, descripcion) VALUES (4, 'Macho');


--
-- TOC entry 2299 (class 0 OID 0)
-- Dependencies: 190
-- Name: sexo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sexo_id_seq', 4, true);


--
-- TOC entry 2257 (class 0 OID 28297)
-- Dependencies: 217
-- Data for Name: si_no; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO si_no (id, descripcion) VALUES (1, 'SI');
INSERT INTO si_no (id, descripcion) VALUES (2, 'NO');


--
-- TOC entry 2300 (class 0 OID 0)
-- Dependencies: 216
-- Name: si_no_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('si_no_id_seq', 2, true);


--
-- TOC entry 2301 (class 0 OID 0)
-- Dependencies: 182
-- Name: tbl_contratista_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tbl_contratista_id_seq', 1, false);


--
-- TOC entry 2221 (class 0 OID 19608)
-- Dependencies: 181
-- Data for Name: tbl_estado; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tbl_estado (id, descripcion, longitud, latitud) VALUES (1, 'DISTRITO CAPITAL', '10.554', '-66.8483');
INSERT INTO tbl_estado (id, descripcion, longitud, latitud) VALUES (2, 'AMAZONAS', '4.36', '-64.27');
INSERT INTO tbl_estado (id, descripcion, longitud, latitud) VALUES (4, 'APURE', '7.133598', '-68.556519');
INSERT INTO tbl_estado (id, descripcion, longitud, latitud) VALUES (5, 'ARAGUA', '10.260871', '-67.286224');
INSERT INTO tbl_estado (id, descripcion, longitud, latitud) VALUES (6, 'BARINAS', '8.633128', '-70.211248');
INSERT INTO tbl_estado (id, descripcion, longitud, latitud) VALUES (8, 'CARABOBO', '10.141932', '-68.046799');
INSERT INTO tbl_estado (id, descripcion, longitud, latitud) VALUES (9, 'COJEDES', '9.443643', '-68.332672');
INSERT INTO tbl_estado (id, descripcion, longitud, latitud) VALUES (10, 'DELTA AMACURO', '8.982749', '-61.496887');
INSERT INTO tbl_estado (id, descripcion, longitud, latitud) VALUES (13, 'LARA', '10.206813', '-69.851532');
INSERT INTO tbl_estado (id, descripcion, longitud, latitud) VALUES (15, 'MIRANDA', '10.271681', '-66.427689');
INSERT INTO tbl_estado (id, descripcion, longitud, latitud) VALUES (16, 'MONAGAS', '9.370483', '-63.012543');
INSERT INTO tbl_estado (id, descripcion, longitud, latitud) VALUES (17, 'NUEVA ESPARTA', '11.015341', '-63.911819');
INSERT INTO tbl_estado (id, descripcion, longitud, latitud) VALUES (18, 'PORTUGUESA', '9.148198', '-69.098969');
INSERT INTO tbl_estado (id, descripcion, longitud, latitud) VALUES (19, 'SUCRE', '10.455402', '-63.295441');
INSERT INTO tbl_estado (id, descripcion, longitud, latitud) VALUES (21, 'TRUJILLO', '9.367519', '-70.433192');
INSERT INTO tbl_estado (id, descripcion, longitud, latitud) VALUES (22, 'YARACUY', '10.444598', '-68.714218');
INSERT INTO tbl_estado (id, descripcion, longitud, latitud) VALUES (23, 'ZULIA', '10.04999410.049994', '-72.538147');
INSERT INTO tbl_estado (id, descripcion, longitud, latitud) VALUES (24, 'VARGAS', '10.549922', '-67.073135');
INSERT INTO tbl_estado (id, descripcion, longitud, latitud) VALUES (99, 'NACIONAL', '10.549922', '-67.073135');
INSERT INTO tbl_estado (id, descripcion, longitud, latitud) VALUES (3, 'ANZOATEGUI', '8.711359', '-63.924866');
INSERT INTO tbl_estado (id, descripcion, longitud, latitud) VALUES (7, 'BOLIVAR', '6.54456', '-63.546753');
INSERT INTO tbl_estado (id, descripcion, longitud, latitud) VALUES (11, 'FALCON', '11.24845', '-69.862976');
INSERT INTO tbl_estado (id, descripcion, longitud, latitud) VALUES (14, 'MERIDA', '8.601389', '-71.149721');
INSERT INTO tbl_estado (id, descripcion, longitud, latitud) VALUES (12, 'GUARICO', '8.890499', '-66.210022');
INSERT INTO tbl_estado (id, descripcion, longitud, latitud) VALUES (20, 'TACHIRA', '7.944996', '-72.136688');
INSERT INTO tbl_estado (id, descripcion, longitud, latitud) VALUES (25, 'INSULAR', NULL, NULL);
INSERT INTO tbl_estado (id, descripcion, longitud, latitud) VALUES (9999, 'SIN INFORMACION', NULL, NULL);


--
-- TOC entry 2302 (class 0 OID 0)
-- Dependencies: 183
-- Name: tbl_estado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tbl_estado_id_seq', 1, false);


--
-- TOC entry 2224 (class 0 OID 19655)
-- Dependencies: 184
-- Data for Name: tbl_municipio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (157, 'ARZOBISPO CHACON', 14);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (318, 'JESUS ENRIQUE LOSSADA', 23);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (9, 'FERNANDO DE PEÑALVER', 3);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (226, 'MONSEÑOR JOSE VICENTE DE UNDA', 18);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (262, 'BOLIVAR', 20);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (2, 'AUTONOMO ALTO ORINOCO', 2);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (3, 'AUTONOMO ATABAPO', 2);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (4, 'AUTONOMO ATURES', 2);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (5, 'AUTONOMO AUTANA', 2);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (6, 'AUTONOMO MAROA', 2);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (7, 'AUTONOMO MANAPIARE', 2);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (21, 'PÍRITU', 3);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (11, 'ANACO', 3);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (22, 'SIR ARTHUR MC GREGOR', 3);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (1, 'LIBERTADOR', 1);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (10, 'ARAGUA', 3);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (12, 'FRANCISCO DEL CARMEN CARVAJAL', 3);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (13, 'FRANCISCO DE MIRANDA', 3);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (14, 'GUANTA', 3);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (15, 'INDEPENDENCIA', 3);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (16, 'JUAN ANTONIO SOTILLO', 3);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (17, 'JUAN MANUEL CAJIGAL', 3);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (18, 'JOSé GREGORIO MONAGAS', 3);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (19, 'LIBERTAD', 3);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (20, 'MANUEL EZEQUIEL BRUZUAL', 3);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (24, 'SAN JUAN DE CAPISTRANO', 3);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (25, 'SANTA ANA', 3);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (28, 'SIR ARTHUR MC GREGOR', 3);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (29, 'DIEGO BAUTISTA URBANEJA', 3);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (30, 'ACHAGUAS', 4);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (31, 'BIRUACA', 4);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (33, 'PáEZ', 4);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (34, 'PEDRO CAMEJO', 4);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (36, 'SAN FERNANDO', 4);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (38, 'CAMATAGUA', 5);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (39, 'GIRARDOT', 5);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (43, 'LIBERTADOR', 5);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (45, 'SAN CASIMIRO', 5);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (48, 'SANTOS MICHELENA', 5);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (49, 'SUCRE', 5);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (50, 'TOVAR', 5);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (51, 'URDANETA', 5);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (52, 'ZAMORA', 5);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (53, 'FRANCISCO LINARES ALCáNTARA', 5);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (54, 'OCUMARE DE LA COSTA DE ORO', 5);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (55, 'ALBERTO ARVELO TORREALBA', 6);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (57, 'ARISMENDI', 6);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (58, 'BARINAS', 6);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (60, 'CRUZ PAREDES', 6);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (61, 'EZEQUIEL ZAMORA', 6);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (62, 'OBISPOS', 6);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (63, 'PEDRAZA', 6);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (64, 'ROJAS', 6);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (65, 'SOSA', 6);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (69, 'EL CALLAO', 7);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (70, 'GRAN SABANA', 7);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (71, 'HERES', 7);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (72, 'PIAR', 7);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (73, 'ROSCIO', 7);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (74, 'SIFONTES', 7);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (75, 'SUCRE', 7);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (76, 'PADRE PEDRO CHIEN', 7);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (77, 'BEJUMA', 8);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (78, 'CARLOS ARVELO', 8);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (79, 'DIEGO IBARRA', 8);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (80, 'GUACARA', 8);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (82, 'LIBERTADOR', 8);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (83, 'LOS GUAYOS', 8);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (84, 'MIRANDA', 8);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (86, 'NAGUANAGUA', 8);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (87, 'PUERTO CABELLO', 8);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (88, 'SAN DIEGO', 8);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (90, 'VALENCIA', 8);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (93, 'GIRARDOT', 9);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (94, 'LIMA BLANCO', 9);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (95, 'PAO DE SAN JUAN BAUTISTA', 9);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (96, 'RICAURTE', 9);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (98, 'SAN CARLOS', 9);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (99, 'TINACO', 9);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (100, 'ANTONIO DíAZ', 10);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (101, 'CASACOIMA', 10);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (102, 'PEDERNALES', 10);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (103, 'TUCUPITA', 10);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (104, 'ACOSTA', 11);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (106, 'BUCHIVACOA', 11);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (107, 'CACIQUE MANAURE', 11);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (108, 'CARIRUBANA', 11);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (109, 'COLINA', 11);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (110, 'DABAJURO', 11);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (111, 'DEMOCRACIA', 11);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (114, 'JACURA', 11);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (115, 'LOS TAQUES', 11);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (116, 'MAUROA', 11);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (117, 'MIRANDA', 11);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (119, 'PALMASOLA', 11);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (120, 'PETIT', 11);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (121, 'PíRITU', 11);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (122, 'SAN FRANCISCO', 11);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (123, 'SILVA', 11);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (124, 'SUCRE', 11);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (125, 'TOCóPERO', 11);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (127, 'URUMACO', 11);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (128, 'ZAMORA', 11);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (129, 'CAMAGUáN', 12);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (130, 'CHAGUARAMAS', 12);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (131, 'EL SOCORRO', 12);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (133, 'LEONARDO INFANTE', 12);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (134, 'LAS MERCEDES', 12);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (136, 'FRANCISCO DE MIRANDA', 12);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (138, 'ORTIZ', 12);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (143, 'PEDRO ZARAZA', 12);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (145, 'CRESPO', 13);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (146, 'IRIBARREN', 13);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (149, 'PALAVECINO', 13);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (151, 'TORRES', 13);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (152, 'URDANETA', 13);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (153, 'ALBERTO ADRIANI', 14);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (26, 'SIMON BOLIVAR', 3);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (23, 'SAN JOSE DE GUANIPA', 3);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (27, 'SIMON RODRIGUEZ', 3);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (32, 'MUÑOZ', 4);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (44, 'MARIO BRICEÑO IRAGORRY', 5);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (35, 'ROMULO GALLEGOS', 4);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (37, 'BOLIVAR', 5);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (40, 'JOSE ANGEL LAMAS', 5);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (41, 'JOSE FELIX RIBAS', 5);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (42, 'JOSE RAFAEL REVENGA', 5);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (47, 'SANTIAGO MARIÑO', 5);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (46, 'SAN SEBASTIAN', 5);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (68, 'CEDEÑO', 7);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (56, 'ANTONIO JOSE DE SUCRE', 6);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (59, 'BOLIVAR', 6);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (66, 'ANDRES ELOY BLANCO', 6);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (105, 'BOLIVAR', 11);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (67, 'CARONI', 7);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (89, 'SAN JOAQUIN', 8);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (85, 'MONTALBAN', 8);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (81, 'JUAN JOSE MORA', 8);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (91, 'ANZOATEGUI', 9);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (92, 'FALCON', 9);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (97, 'ROMULO GALLEGOS', 9);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (118, 'MONSEÑOR ITURRIZA', 11);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (112, 'FALCON', 11);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (113, 'FEDERACION', 11);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (126, 'UNION', 11);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (132, 'SAN GERONIMO DE GUAYABAL', 12);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (135, 'JULIAN MELLADO', 12);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (137, 'JOSE TADEO MONAGAS', 12);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (140, 'JUAN GERMAN ROSCIO', 12);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (139, 'JOSE FELIX RIBAS', 12);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (141, 'SAN JOSE DE GUARIBE', 12);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (142, 'SANTA MARIA DE IPIRE', 12);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (144, 'ANDRES ELOY BLANCO', 13);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (147, 'JIMENEZ', 13);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (148, 'MORON', 13);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (150, 'SIMON PLANAS', 13);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (8, 'AUTONOMO RIO NEGRO ', 2);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (155, 'ANTONIO PINTO SALINAS', 14);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (156, 'ARICAGUA', 14);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (159, 'CARACCIOLO PARRA OLMEDO', 14);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (160, 'CARDENAL QUINTERO', 14);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (161, 'GUARAQUE', 14);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (164, 'LIBERTADOR', 14);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (165, 'MIRANDA', 14);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (166, 'OBISPO RAMOS DE LORA', 14);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (167, 'PADRE NOGUERA', 14);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (168, 'PUEBLO LLANO', 14);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (169, 'RANGEL', 14);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (171, 'SANTOS MARQUINA', 14);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (172, 'SUCRE', 14);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (173, 'TOVAR', 14);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (174, 'TULIO FEBRES CORDERO', 14);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (175, 'ZEA', 14);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (176, 'ACEVEDO', 15);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (178, 'BARUTA', 15);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (180, 'BUROZ', 15);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (181, 'CARRIZAL', 15);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (182, 'CHACAO', 15);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (184, 'EL HATILLO', 15);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (185, 'GUAICAIPURO', 15);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (186, 'INDEPENDENCIA', 15);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (187, 'LANDER', 15);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (188, 'LOS SALIAS', 15);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (190, 'PAZ CASTILLO', 15);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (191, 'PEDRO GUAL', 15);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (192, 'PLAZA', 15);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (194, 'SUCRE', 15);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (195, 'URDANETA', 15);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (196, 'ZAMORA', 15);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (197, 'ACOSTA', 16);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (198, 'AGUASAY', 16);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (200, 'CARIPE', 16);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (202, 'EZEQUIEL ZAMORA', 16);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (203, 'LIBERTADOR', 16);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (205, 'PIAR', 16);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (206, 'PUNCERES', 16);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (208, 'SOTILLO', 16);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (209, 'URACOA', 16);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (211, 'ARISMENDI', 17);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (214, 'GóMEZ', 17);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (215, 'MANEIRO', 17);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (216, 'MARCANO', 17);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (218, 'PENíNSULA DE MACANAO', 17);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (219, 'TUBORES', 17);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (220, 'VILLALBA', 17);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (221, 'AGUA BLANCA', 18);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (222, 'ARAURE', 18);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (223, 'ESTELLER', 18);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (224, 'GUANARE', 18);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (225, 'GUANARITO', 18);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (227, 'OSPINO', 18);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (230, 'SAN GENARO DE BOCONOITO', 18);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (231, 'SAN RAFAEL DE ONOTO', 18);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (232, 'SANTA ROSALíA', 18);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (233, 'SUCRE', 18);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (237, 'ARISMENDI', 19);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (241, 'CAJIGAL', 19);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (243, 'LIBERTADOR', 19);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (246, 'MONTES', 19);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (247, 'RIBERO', 19);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (248, 'SUCRE', 19);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (249, 'VALDEZ', 19);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (252, 'AYACUCHO', 20);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (257, 'FRANCISCO DE MIRANDA', 20);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (258, 'GARCíA DE HEVIA', 20);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (260, 'INDEPENDENCIA', 20);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (264, 'LIBERTAD', 20);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (265, 'LIBERTADOR', 20);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (266, 'LOBATERA', 20);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (267, 'MICHELENA', 20);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (268, 'PANAMERICANO', 20);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (270, 'RAFAEL URDANETA', 20);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (273, 'SEBORUCO', 20);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (275, 'SUCRE', 20);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (276, 'TORBES', 20);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (277, 'URIBANTE', 20);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (278, 'SAN JUDAS TADEO', 20);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (282, 'CANDELARIA', 21);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (283, 'CARACHE', 21);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (284, 'ESCUQUE', 21);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (287, 'LA CEIBA', 21);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (288, 'MIRANDA', 21);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (289, 'MONTE CARMELO', 21);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (292, 'PAMPANITO', 21);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (293, 'RAFAEL RANGEL', 21);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (294, 'SAN RAFAEL DE CARVAJAL', 21);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (295, 'SUCRE', 21);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (296, 'TRUJILLO', 21);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (297, 'URDANETA', 21);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (298, 'VALERA', 21);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (301, 'BRUZUAL', 22);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (302, 'COCOROTE', 22);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (303, 'INDEPENDENCIA', 22);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (305, 'LA TRINIDAD', 22);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (306, 'MANUEL MONGE', 22);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (307, 'NIRGUA', 22);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (308, 'SAN FELIPE', 22);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (309, 'SUCRE', 22);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (310, 'URACHICHE', 22);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (311, 'VEROES', 22);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (312, 'ALMIRANTE PADILLA', 23);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (313, 'BARALT', 23);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (314, 'CABIMAS', 23);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (315, 'CATATUMBO', 23);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (317, 'FRANCISCO JAVIER PULGAR', 23);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (154, 'ANDRES BELLO', 14);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (158, 'CAMPO ELIAS', 14);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (162, 'JULIO CESAR SALAS', 14);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (170, 'RIVAS DAVILA', 14);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (177, 'ANDRES BELLO', 15);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (179, 'BRION', 15);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (183, 'CRISTOBAL ROJAS', 15);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (189, 'PAEZ', 15);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (193, 'SIMON BOLIVAR', 15);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (199, 'BOLIVAR', 16);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (210, 'ANTOLIN DEL CAMPO', 17);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (204, 'MATURIN', 16);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (207, 'SANTA BARBARA', 16);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (213, 'GARCIA', 17);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (240, 'MARIÑO', 19);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (228, 'PAEZ', 18);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (229, 'PAPELON', 18);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (236, 'ANDRES MATA', 19);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (235, 'ANDRES ELOY BLANCO', 19);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (238, 'BENITEZ', 19);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (239, 'BERMUDEZ', 19);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (242, 'CRUZ SALMERON ACOSTA', 19);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (245, 'BOLIVAR', 19);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (253, 'PEDRO MARIA UREÑA', 20);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (217, 'MARIÑO', 17);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (212, 'DIAZ', 17);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (244, 'MEJIAS', 19);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (234, 'TUREN', 18);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (250, 'ANDRES BELLO', 20);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (251, 'ANTONIO ROMULO COSTA', 20);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (254, 'CARDENAS', 20);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (271, 'DARIO MALDONADO', 20);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (255, 'CORDOBA', 20);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (256, 'FERNANDEZ FEO', 20);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (259, 'GUASIMOS', 20);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (261, 'JAUREGUI', 20);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (263, 'JUNIN', 20);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (281, 'BOLIVAR', 21);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (286, 'JOSE FELIPE MARQUEZ CAÑIZALES', 21);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (272, 'SAN CRISTOBAL', 20);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (274, 'SIMON RODRIGUEZ', 20);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (279, 'ANDRES BELLO', 21);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (280, 'BOCONO', 21);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (285, 'JUAN VICENTE CAMPO ELIAS', 21);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (299, 'PEÑA', 22);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (290, 'MOTATAN', 21);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (291, 'PAMPAN', 21);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (300, 'BOLIVAR', 22);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (304, 'JOSE ANTONIO PAEZ', 22);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (316, 'COLON', 23);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (201, 'CEDEÑO', 16);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (320, 'LA CAñADA DE URDANETA', 23);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (321, 'LAGUNILLAS', 23);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (323, 'MARA', 23);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (324, 'MARACAIBO', 23);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (325, 'MIRANDA', 23);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (328, 'SAN FRANCISCO', 23);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (329, 'SANTA RITA', 23);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (331, 'SUCRE', 23);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (333, 'VARGAS', 24);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (335, 'ANGOSTURA', 7);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (319, 'JESUS MARIA SEMPRUN', 23);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (322, 'MACHIQUES DE PERIJA', 23);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (326, 'PAEZ', 23);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (327, 'ROSARIO DE PERIJA', 23);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (334, 'ARISTIDES BASTIDAS', 22);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (330, 'SIMON BOLIVAR', 23);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (332, 'VALMORE RODRIGUEZ', 23);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (336, 'RAUL LEONI', 19);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (337, 'GUAJIRA', 23);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (338, 'CIRCUNVALACION 3', 23);
INSERT INTO tbl_municipio (id, descripcion, id_estado) VALUES (9999, 'SIN INFORMACION', NULL);


--
-- TOC entry 2303 (class 0 OID 0)
-- Dependencies: 185
-- Name: tbl_municipio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tbl_municipio_id_seq', 338, true);


--
-- TOC entry 2226 (class 0 OID 19660)
-- Dependencies: 186
-- Data for Name: tbl_parroquia; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1, 'Altagracia', 1);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (2, 'Antímano', 1);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (3, 'Candelaria', 1);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (4, 'Caricuao', 1);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (5, 'Catedral', 1);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (6, 'Coche', 1);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (7, 'El Junquito', 1);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (8, 'EL Paraíso', 1);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (9, 'El Recreo', 1);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (10, 'El Valle', 1);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (11, 'La Pastora', 1);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (12, 'La Vega', 1);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (13, 'Macarao', 1);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (14, 'San Agustín', 1);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (15, 'San Bernardino', 1);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (16, 'San José', 1);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (17, 'San Juan', 1);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (18, 'San Pedro', 1);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (19, 'Santa Rosalía', 1);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (20, 'Santa Teresa', 1);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (21, 'Sucre', 1);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (22, '23 de Enero', 1);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (23, 'Capital Alto Orinoco', 2);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (24, 'Ucata', 3);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (25, 'Parhueña', 4);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (26, 'Platanillal', 4);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (27, 'Samariapo', 5);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (28, 'Victorino', 6);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (29, 'Alto Ventuari', 7);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (30, 'Capital Río Negro', 8);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (31, 'Capital Anaco', 9);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (32, 'San Joaquín', 9);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (33, 'Capital Aragua', 10);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (34, 'Cachipo', 10);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (35, 'Capital Fernando de Peñalver', 11);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (36, 'San Miguel', 11);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (37, 'Sucre', 11);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (38, 'Valle de Guanape', 12);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (39, 'Santa Bárbara', 12);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (40, 'Capital Francisco de Miranda', 13);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (41, 'Atapirire', 13);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (42, 'Boca del Pao', 13);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (43, 'El Pao', 13);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (44, 'Guanta', 14);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (45, 'Chorrerón', 14);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (46, 'Capital Independencia', 15);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (47, 'Mamo', 15);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (48, 'Capital Puerto La Cruz', 16);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (49, 'Pozuelos', 16);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (50, 'Capital Onoto', 17);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (51, 'San Pablo', 17);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (52, 'Capital José Gregorio Monagas', 18);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (53, 'Piar', 18);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (54, 'San Diego de Cabrutica', 18);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (55, 'Santa Clara', 18);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (56, 'Uverito', 18);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (57, 'Zuata', 18);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (58, 'Capital Libertad', 19);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (59, 'El Carito', 19);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (60, 'Santa Inés', 19);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (61, 'Capital Clarines', 20);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (62, 'Guanape', 20);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (63, 'Sabana de Uchire', 20);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (64, 'Capital Pedro María Freites', 21);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (65, 'Libertador', 21);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (66, 'Santa Rosa', 21);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (67, 'Urica', 21);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (68, 'Capital Píritu', 22);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (69, 'San Francisco', 22);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (70, 'Capital San José de Guanipa', 23);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (71, 'Capital Boca de Uchire', 24);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (72, 'Boca de Chávez', 24);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (73, 'Capital Santa Ana', 25);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (74, 'Pueblo Nuevo', 25);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (75, 'El Carmen', 26);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (76, 'San Cristóbal', 26);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (77, 'Bergantín', 26);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (78, 'Caigua', 26);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (79, 'El Pilar', 26);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (80, 'Naricual', 26);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (81, 'Parroquia Capital Simón Rodríguez', 27);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (82, 'El Chaparro', 28);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (83, 'Tomás Alfaro Calatrava', 28);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (84, 'Lecherías', 29);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (85, 'El Morro', 29);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (86, 'Urbana Achaguas', 30);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (87, 'Apurito', 30);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (88, 'El Yagual', 30);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (89, 'Guachara', 30);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (90, 'Mucuritas', 30);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (91, 'Queseras del Medio', 30);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (92, 'Urbana Biruaca', 31);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (93, 'Urbana Bruzual', 32);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (94, 'Mantecal', 32);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (95, 'Quintero', 32);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (96, 'Rincón Hondo', 32);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (97, 'San Vicente', 32);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (98, 'Urbana Guasdualito', 33);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (99, 'Aramendi', 33);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (100, 'El Amparo', 33);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (101, 'San Camilo', 33);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (102, 'Urdaneta', 33);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (103, 'Urbana San Juan de Payara', 34);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (104, 'Codazzi', 34);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (105, 'Cunaviche', 34);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (106, 'Urbana Elorza', 35);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (107, 'La Trinidad', 35);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (108, 'Urbana San Fernando', 36);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (109, 'El Recreo', 36);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (110, 'Peñalver', 36);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (111, 'San Rafael de Atamaica', 36);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (112, 'Capital Bolívar', 37);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (113, 'Capital Camatagua', 38);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (114, 'No Urbana Carmen de Cura', 38);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (115, 'No Urbana Choroní', 39);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (116, 'Urbana Las Delicias', 39);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (117, 'Urbana Madre María de San José', 39);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (118, 'Urbana Joaquín Crespo', 39);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (119, 'Urbana Pedro José Ovalles', 39);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (120, 'Urbana José Casanova Godoy', 39);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (121, 'Urbana Andrés Eloy Blanco', 39);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (122, 'Urbana Los Tacariguas', 39);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (123, 'Capital José Angel Lamas', 40);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (124, 'Capital José Félix Ribas', 41);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (125, 'Castor Nieves Ríos', 41);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (126, 'No Urbana Las Guacamayas', 41);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (127, 'No Urbana Pao de Zárate', 41);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (128, 'No Urbana Zuata', 41);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (129, 'Capital José Rafael Revenga', 42);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (130, 'Capital Libertador', 43);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (131, 'No Urbana San Martín de Porres', 43);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (132, 'Capital Mario Briceño Iragorry', 44);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (133, 'Caña de Azúcar', 44);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (134, 'Capital San Casimiro', 45);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (135, 'No Urbana Güiripa', 45);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (136, 'No Urbana Ollas de Caramacate', 45);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (137, 'No Urbana Valle Morín', 45);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (138, 'Capital San Sebastián', 46);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (139, 'Capital Santiago Mariño', 47);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (140, 'No Urbana Arévalo Aponte', 47);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (141, 'No Urbana Chuao', 47);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (142, 'No Urbana Samán de Güere', 47);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (143, 'No Urbana Alfredo Pacheco Miranda', 47);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (144, 'Capital Santos Michelena', 48);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (145, 'No Urbana Tiara', 48);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (146, 'Capital Sucre', 49);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (147, 'No Urbana Bella Vista', 49);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (148, 'Capital Tovar', 50);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (149, 'Capital Urdaneta', 51);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (150, 'No Urbana Las Peñitas', 51);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (151, 'No Urbana San Francisco de Cara', 51);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (152, 'No Urbana Taguay', 51);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (153, 'Capital Zamora', 52);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (154, 'No Urbana Magdaleno', 52);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (155, 'No Urbana San Francisco de Asís', 52);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (156, 'No Urbana Valles de Tucutunemo', 52);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (157, 'No Urbana Augusto Mijares', 52);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (158, 'Capital Francisco Linares Alcántara', 53);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (159, 'No Urbana Francisco de Miranda', 53);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (160, 'No Urbana Monseñor Feliciano González', 53);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (161, 'Capital Ocumare de La Costa de Oro', 54);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (162, 'Sabaneta', 55);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (163, 'Rodríguez Domínguez', 55);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (164, 'Ticoporo', 56);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (165, 'Andrés Bello', 56);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (166, 'Nicolás Pulido', 56);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (167, 'Arismendi', 57);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (168, 'Guadarrama', 57);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (169, 'La Unión', 57);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (170, 'San Antonio', 57);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (171, 'Barinas', 58);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (172, 'Alfredo Arvelo Larriva', 58);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (173, 'San Silvestre', 58);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (174, 'Santa Inés', 58);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (175, 'Santa Lucía', 58);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (176, 'Torunos', 58);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (177, 'El Carmen', 58);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (178, 'Rómulo Betancourt', 58);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (179, 'Corazón de Jesús', 58);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (180, 'Ramón Ignacio Méndez', 58);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (181, 'Alto Barinas', 58);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (182, 'Manuel Palacio Fajardo', 58);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (183, 'Juan Antonio Rodríguez Domínguez', 58);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (184, 'Dominga Ortiz de Páez', 58);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (185, 'Barinitas', 59);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (186, 'Altamira', 59);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (187, 'Calderas', 59);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (188, 'Barrancas', 60);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (189, 'El Socorro', 60);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (190, 'Masparrito', 60);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (191, 'Santa Bárbara', 61);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (192, 'José Ignacio del Pumar', 61);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (193, 'Pedro Briceño Méndez', 61);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (194, 'Ramón Ignacio Méndez', 61);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (195, 'Obispos', 62);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (196, 'El Real', 62);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (197, 'La Luz', 62);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (198, 'Los Guasimitos', 62);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (199, 'Ciudad Bolivia', 63);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (200, 'Ignacio Briceño', 63);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (201, 'José Félix Ribas', 63);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (202, 'Páez', 63);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (203, 'Libertad', 64);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (204, 'Dolores', 64);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (205, 'Palacios Fajardo', 64);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (206, 'Santa Rosa', 64);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (207, 'Ciudad de Nutrias', 65);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (208, 'El Regalo', 65);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (209, 'Puerto de Nutrias', 65);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (210, 'Santa Catalina', 65);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (211, 'El Cantón', 66);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (212, 'Santa Cruz de Guacas', 66);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (213, 'Puerto Vivas', 66);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (214, 'Cachamay', 67);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (215, 'Chirica', 67);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (216, 'Dalla Costa', 67);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (217, 'Once de Abril', 67);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (218, 'Simón Bolívar', 67);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (219, 'Unare', 67);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (220, 'Universidad', 67);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (221, 'Vista al Sol', 67);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (222, 'Pozo Verde', 67);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (223, 'Yocoima', 67);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (224, 'Sección Capital Cedeño', 68);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (225, 'Altagracia', 68);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (226, 'Ascensión Farreras', 68);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (227, 'Guaniamo', 68);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (228, 'La Urbana', 68);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (229, 'Pijiguaos', 68);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (230, 'Capital El Callao', 69);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (231, 'Sección Capital Gran Sabana', 70);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (232, 'Ikabarú', 70);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (233, 'Agua Salada', 71);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (234, 'Catedral', 71);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (235, 'José Antonio Páez', 71);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (236, 'La Sabanita', 71);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (237, 'Marhuanta', 71);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (238, 'Vista Hermosa', 71);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (239, 'Orinoco', 71);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (240, 'Panapana', 71);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (241, 'Zea', 71);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (242, 'Sección Capital Piar', 72);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (243, 'Andrés Eloy Blanco', 72);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (244, 'Pedro Cova', 72);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (245, 'Sección Capital Raúl Leoni', 335);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (246, 'Barceloneta', 335);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (247, 'San Francisco', 335);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (248, 'Santa Bárbara', 335);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (249, 'Sección Capital Roscio', 73);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (250, 'Salom', 73);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (251, 'Sección Capital Sifontes', 74);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (252, 'Dalla Costa', 74);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (253, 'San Isidro', 74);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (254, 'Sección Capital Sucre', 75);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (255, 'Aripao', 75);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (256, 'Guarataro', 75);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (257, 'Las Majadas', 75);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (258, 'Moitaco', 75);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (259, 'Capital Padre Pedro Chien', 76);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (260, 'Urbana Bejuma', 77);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (261, 'No Urbana Canoabo', 77);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (262, 'No Urbana Simón Bolívar', 77);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (263, 'Urbana Güigüe', 78);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (264, 'No Urbana Belén', 78);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (265, 'No Urbana Tacarigua', 78);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (266, 'Urbana Aguas Calientes', 79);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (267, 'Urbana Mariara', 79);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (268, 'Urbana Ciudad Alianza', 80);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (269, 'Urbana Guacara', 80);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (270, 'No Urbana Yagua', 80);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (271, 'Urbana Morón', 81);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (272, 'No Urbana Urama', 81);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (273, 'Urbana Tocuyito', 82);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (274, 'Urbana Independencia', 82);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (275, 'Urbana Los Guayos', 83);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (276, 'Urbana Miranda', 84);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (277, 'Urbana Montalbán', 85);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (278, 'Urbana Naguanagua', 86);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (279, 'Urbana Bartolomé Salom', 87);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (280, 'Urbana Democracia', 87);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (281, 'Urbana Fraternidad', 87);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (282, 'Urbana Goaigoaza', 87);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (283, 'Urbana Juan José Flores', 87);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (284, 'Urbana Unión', 87);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (285, 'No Urbana Borburata', 87);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (286, 'No Urbana Patanemo', 87);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (287, 'Urbana San Diego', 88);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (288, 'Urbana San Joaquín', 89);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (289, 'Urbana Candelaria', 90);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (290, 'Urbana Catedral', 90);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (291, 'Urbana El Socorro', 90);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (292, 'Urbana Miguel Peña', 90);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (293, 'Urbana Rafael Urdaneta', 90);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (294, 'Urbana San Blas', 90);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (295, 'Urbana San José', 90);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (296, 'Urbana Santa Rosa', 90);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (297, 'No Urbana Negro Primero', 90);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (298, 'Cojedes', 91);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (299, 'Juan de Mata Suárez', 91);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (300, 'Tinaquillo', 92);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (301, 'El Baúl', 93);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (302, 'Sucre', 93);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (303, 'Macapo', 94);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (304, 'La Aguadita', 94);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (305, 'El Pao', 95);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (306, 'Libertad de Cojedes', 96);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (307, 'El Amparo', 96);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (308, 'Rómulo Gallegos', 97);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (309, 'San Carlos de Austria', 98);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (310, 'Juan Angel Bravo', 98);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (311, 'Manuel Manrique', 98);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (312, 'General en Jefe José Laurencio Silva', 99);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (313, 'Curiapo', 100);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (314, 'Almirante Luis Brión', 100);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (315, 'Francisco Aniceto Lugo', 100);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (316, 'Manuel Renaud', 100);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (317, 'Padre Barral', 100);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (318, 'Santos de Abelgas', 100);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (319, 'Imataca', 101);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (320, 'Cinco de Julio', 101);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (321, 'Juan Bautista Arismendi', 101);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (322, 'Manuel Piar', 101);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (323, 'Rómulo Gallegos', 101);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (324, 'Pedernales', 102);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (325, 'Luis Beltrán Prieto Figueroa', 102);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (326, 'San José', 103);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (327, 'José Vidal Marcano', 103);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (328, 'Juan Millán', 103);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (329, 'Leonardo Ruíz Pineda', 103);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (330, 'Mariscal Antonio José de Sucre', 103);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (331, 'Monseñor Argimiro García', 103);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (332, 'San Rafael', 103);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (333, 'Virgen del Valle', 103);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (334, 'San Juan de los Cayos', 104);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (335, 'Capadare', 104);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (336, 'La Pastora', 104);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (337, 'Libertador', 104);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (338, 'San Luis', 105);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (339, 'Aracua', 105);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (340, 'La Peña', 105);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (341, 'Capatárida', 106);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (342, 'Bariro', 106);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (343, 'Borojó', 106);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (344, 'Guajiro', 106);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (345, 'Seque', 106);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (346, 'Zazárida', 106);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (347, 'Capital Cacique Manaure', 107);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (348, 'Carirubana', 108);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (349, 'Norte', 108);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (350, 'Punta Cardón', 108);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (351, 'Santa Ana', 108);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (352, 'La Vela de Coro', 109);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (353, 'Acurigua', 109);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (354, 'Guaibacoa', 109);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (355, 'Las Calderas', 109);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (356, 'Macoruca', 109);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (357, 'Capital Dabajuro', 110);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (358, 'Pedregal', 111);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (359, 'Agua Clara', 111);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (360, 'Avaria', 111);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (361, 'Piedra Grande', 111);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (362, 'Purureche', 111);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (363, 'Pueblo Nuevo', 112);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (364, 'Adícora', 112);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (365, 'Baraived', 112);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (366, 'Buena Vista', 112);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (367, 'Jadacaquiva', 112);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (368, 'Moruy', 112);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (369, 'Adaure', 112);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (370, 'El Hato', 112);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (371, 'El Vínculo', 112);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (372, 'Churuguara', 113);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (373, 'Agua Larga', 113);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (374, 'El Paují', 113);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (375, 'Independencia', 113);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (376, 'Mapararí', 113);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (377, 'Jacura', 114);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (378, 'Agua Linda', 114);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (379, 'Araurima', 114);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (380, 'Los Taques', 115);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (381, 'Judibana', 115);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (382, 'Mene de Mauroa', 116);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (383, 'Casigua', 116);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (384, 'San Félix', 116);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (385, 'San Antonio', 117);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (386, 'San Gabriel', 117);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (387, 'Santa Ana', 117);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (388, 'Guzmán Guillermo', 117);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (389, 'Mitare', 117);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (390, 'Río Seco', 117);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (391, 'Sabaneta', 117);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (392, 'Chichiriviche', 118);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (393, 'Boca de Tocuyo', 118);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (394, 'Tocuyo de la Costa', 118);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (395, 'Capital Palmasola', 119);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (396, 'Cabure', 120);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (397, 'Colina', 120);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (398, 'Curimagua', 120);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (399, 'Píritu', 121);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (400, 'San José de la Costa', 121);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (401, 'Capital San Francisco', 122);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (402, 'Tucacas', 123);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (403, 'Boca de Aroa', 123);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (404, 'Sucre', 124);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (405, 'Pecaya', 124);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (406, 'Capital Tocópero', 125);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (407, 'Santa Cruz de Bucaral', 126);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (408, 'El Charal', 126);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (409, 'Las Vegas del Tuy', 126);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (410, 'Urumaco', 127);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (411, 'Bruzual', 127);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (412, 'Puerto Cumarebo', 128);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (413, 'La Ciénaga', 128);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (414, 'La Soledad', 128);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (415, 'Pueblo Cumarebo', 128);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (416, 'Zazárida', 128);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (417, 'Capital Camaguán', 129);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (418, 'Puerto Miranda', 129);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (419, 'Uverito', 129);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (420, 'Chaguaramas', 130);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (421, 'El Socorro', 131);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (422, 'Capital San Gerónimo de Guayabal', 132);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (423, 'Cazorla', 132);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (424, 'Capital Valle de La Pascua', 133);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (425, 'Espino', 133);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (426, 'Capital Las Mercedes', 134);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (427, 'Cabruta', 134);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (428, 'Santa Rita de Manapire', 134);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (429, 'Capital El Sombrero', 135);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (430, 'Sosa', 135);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (431, 'Capital Calabozo', 136);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (432, 'El Calvario', 136);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (433, 'El Rastro', 136);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (434, 'Guardatinajas', 136);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (435, 'Capital Altagracia de Orituco', 137);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (436, 'Lezama', 137);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (437, 'Libertad de Orituco', 137);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (438, 'Paso Real de Macaira', 137);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (439, 'San Francisco de Macaira', 137);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (440, 'San Rafael de Orituco', 137);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (441, 'Soublette', 137);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (442, 'Capital Ortiz', 138);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (443, 'San Francisco de Tiznados', 138);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (444, 'San José de Tiznados', 138);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (445, 'San Lorenzo de Tiznados', 138);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (446, 'Capital Tucupido', 139);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (447, 'San Rafael de Laya', 139);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (448, 'Capital San Juan de Los Morros', 140);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (449, 'Cantagallo', 140);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (450, 'Parapara', 140);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (451, 'San José de Guaribe', 141);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (452, 'Capital Santa María de Ipire', 142);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (453, 'Altamira', 142);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (454, 'Capital Zaraza', 143);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (455, 'San José de Unare', 143);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (456, 'Pío Tamayo', 144);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (457, 'Quebrada Honda de Guache', 144);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (458, 'Yacambú', 144);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (459, 'Fréitez', 145);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (460, 'José María Blanco', 145);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (461, 'Catedral', 146);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (462, 'Concepción', 146);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (463, 'El Cují', 146);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (464, 'Juan de Villegas', 146);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (465, 'Santa Rosa', 146);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (466, 'Tamaca', 146);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (467, 'Unión', 146);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (468, 'Aguedo Felipe Alvarado', 146);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (469, 'Buena Vista', 146);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (470, 'Juárez', 146);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (471, 'Juan Bautista Rodríguez', 147);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (472, 'Cuara', 147);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (473, 'Diego de Lozada', 147);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (474, 'Paraíso de San José', 147);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (475, 'San Miguel', 147);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (476, 'Tintorero', 147);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (477, 'José Bernardo Dorante', 147);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (478, 'Coronel Mariano Peraza', 147);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (479, 'Bolívar', 148);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (480, 'Anzoátegui', 148);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (481, 'Guárico', 148);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (482, 'Hilario Luna y Luna', 148);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (483, 'Humocaro Alto', 148);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (484, 'Humocaro Bajo', 148);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (485, 'La Candelaria', 148);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (486, 'Morán', 148);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (487, 'Cabudare', 149);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (488, 'José Gregorio Bastidas', 149);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (489, 'Agua Viva', 149);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (490, 'Sarare', 150);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (491, 'Buría', 150);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (492, 'Gustavo Vegas León', 150);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (493, 'Trinidad Samuel', 151);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (494, 'Antonio Díaz', 151);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (495, 'Camacaro', 151);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (496, 'Castañeda', 151);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (497, 'Cecilio Zubillaga', 151);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (498, 'Chiquinquirá', 151);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (499, 'El Blanco', 151);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (500, 'Espinoza de los Monteros', 151);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (501, 'Lara', 151);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (502, 'Las Mercedes', 151);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (503, 'Manuel Morillo', 151);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (504, 'Montaña Verde', 151);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (505, 'Montes de Oca', 151);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (506, 'Torres', 151);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (507, 'Reyes Vargas', 151);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (508, 'Altagracia', 151);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (509, 'Siquisique', 152);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (510, 'Moroturo', 152);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (511, 'San Miguel', 152);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (512, 'Xaguas', 152);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (513, 'Presidente Betancourt', 153);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (514, 'Presidente Páez', 153);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (515, 'Presidente Rómulo Gallegos', 153);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (516, 'Gabriel Picón González', 153);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (517, 'Héctor Amable Mora', 153);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (518, 'José Nucete Sardi', 153);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (519, 'Pulido Méndez', 153);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (520, 'Capital Andrés Bello', 154);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (521, 'Capital Antonio Pinto Salinas', 155);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (522, 'Mesa Bolívar', 155);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (523, 'Mesa de Las Palmas', 155);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (524, 'Capital Aricagua', 156);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (525, 'San Antonio', 156);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (526, 'Capital Arzobispo Chacón', 157);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (527, 'Capurí', 157);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (528, 'Chacantá', 157);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (529, 'El Molino', 157);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (530, 'Guaimaral', 157);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (531, 'Mucutuy', 157);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (532, 'Mucuchachí', 157);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (533, 'Fernández Peña', 158);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (534, 'Matriz', 158);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (535, 'Montalbán', 158);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (536, 'Acequias', 158);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (537, 'Jají', 158);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (538, 'La Mesa', 158);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (539, 'San José del Sur', 158);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (540, 'Capital Caracciolo Parra Olmedo', 159);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (541, 'Florencio Ramírez', 159);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (542, 'Capital Cardenal Quintero', 160);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (543, 'Las Piedras', 160);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (544, 'Capital Guaraque', 161);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (545, 'Mesa de Quintero', 161);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (546, 'Río Negro', 161);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (547, 'Capital Julio César Salas', 162);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (548, 'Palmira', 162);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (551, 'Antonio Spinetti Dini', 164);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (552, 'Arias', 164);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (553, 'Caracciolo Parra Pérez', 164);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (554, 'Domingo Peña', 164);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (555, 'El Llano', 164);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (556, 'Gonzalo Picón Febres', 164);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (557, 'Jacinto Plaza', 164);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (558, 'Juan Rodríguez Suárez', 164);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (559, 'Lasso de la Vega', 164);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (560, 'Mariano Picón Salas', 164);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (561, 'Milla', 164);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (562, 'Osuna Rodríguez', 164);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (563, 'Sagrario', 164);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (564, 'El Morro', 164);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (565, 'Los Nevados', 164);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (566, 'Capital Miranda', 165);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (567, 'Andrés Eloy Blanco', 165);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (568, 'La Venta', 165);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (569, 'Piñango', 165);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (570, 'Capital Obispo Ramos de Lora', 166);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (571, 'Eloy Paredes', 166);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (572, 'San Rafael de Alcázar', 166);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (573, 'Capital Padre Noguera', 167);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (574, 'Capital Pueblo Llano', 168);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (575, 'Capital Rangel', 169);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (576, 'Cacute', 169);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (577, 'La Toma', 169);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (578, 'Mucurubá', 169);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (579, 'San Rafael', 169);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (580, 'Capital Rivas Dávila', 170);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (581, 'Gerónimo Maldonado', 170);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (582, 'Capital Santos Marquina', 171);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (583, 'Capital Sucre', 172);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (584, 'Chiguará', 172);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (585, 'Estánquez', 172);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (586, 'La Trampa', 172);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (587, 'Pueblo Nuevo del Sur', 172);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (588, 'San Juan', 172);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (589, 'El Amparo', 173);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (590, 'El Llano', 173);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (591, 'San Francisco', 173);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (592, 'Tovar', 173);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (593, 'Capital Tulio Febres Cordero', 174);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (594, 'Independencia', 174);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (747, 'Santa Fe', 231);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (595, 'María de la Concepción Palacios Blanco', 174);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (596, 'Santa Apolonia', 174);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (597, 'Capital Zea', 175);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (598, 'Caño El Tigre', 175);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (599, 'Caucagua', 176);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (600, 'Aragüita', 176);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (601, 'Arévalo González', 176);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (602, 'Capaya', 176);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (603, 'El Café', 176);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (604, 'Marizapa', 176);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (605, 'Panaquire', 176);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (606, 'Ribas', 176);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (607, 'San José de Barlovento', 177);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (608, 'Cumbo', 177);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (609, 'Baruta', 178);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (610, 'El Cafetal', 178);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (611, 'Las Minas de Baruta', 178);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (612, 'Higuerote', 179);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (613, 'Curiepe', 179);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (614, 'Tacarigua', 179);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (615, 'Mamporal', 180);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (616, 'Carrizal', 181);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (617, 'Chacao', 182);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (618, 'Charallave', 183);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (619, 'Las Brisas', 183);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (620, 'El Hatillo', 184);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (621, 'Los Teques', 185);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (622, 'Altagracia de La Montaña', 185);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (623, 'Cecilio Acosta', 185);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (624, 'El Jarillo', 185);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (625, 'Paracotos', 185);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (626, 'San Pedro', 185);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (627, 'Tácata', 185);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (628, 'Santa Teresa del Tuy', 186);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (629, 'El Cartanal', 186);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (630, 'Ocumare del Tuy', 187);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (631, 'La Democracia', 187);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (632, 'Santa Bárbara', 187);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (633, 'San Antonio de Los Altos', 188);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (634, 'Río Chico', 189);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (635, 'El Guapo', 189);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (636, 'Tacarigua de La Laguna', 189);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (637, 'Paparo', 189);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (638, 'San Fernando del Guapo', 189);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (639, 'Santa Lucía', 190);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (640, 'Cúpira', 191);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (641, 'Machurucuto', 191);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (642, 'Guarenas', 192);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (643, 'San Francisco de Yare', 193);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (644, 'San Antonio de Yare', 193);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (645, 'Petare', 194);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (646, 'Caucagüita', 194);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (647, 'Fila de Mariches', 194);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (648, 'La Dolorita', 194);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (649, 'Leoncio Martínez', 194);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (650, 'Cúa', 195);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (651, 'Nueva Cúa', 195);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (652, 'Guatire', 196);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (653, 'Bolívar', 196);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (654, 'Capital Acosta', 197);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (655, 'San Francisco', 197);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (656, 'Capital Aguasay', 198);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (657, 'Capital Bolívar', 199);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (658, 'Capital Caripe', 200);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (659, 'El Guácharo', 200);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (660, 'La Guanota', 200);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (661, 'Sabana de Piedra', 200);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (662, 'San Agustín', 200);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (663, 'Teresén', 200);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (664, 'Capital Cedeño', 201);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (665, 'Areo', 201);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (666, 'San Félix', 201);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (667, 'Viento Fresco', 201);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (668, 'Capital Ezequiel Zamora', 202);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (669, 'El Tejero', 202);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (670, 'Capital Libertador', 203);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (671, 'Chaguaramas', 203);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (672, 'Las Alhuacas', 203);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (673, 'Tabasca', 203);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (674, 'Capital Maturín', 204);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (675, 'Alto de los Godos', 204);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (676, 'Boquerón', 204);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (677, 'Las Cocuizas', 204);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (678, 'San Simón', 204);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (679, 'Santa Cruz', 204);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (680, 'El Corozo', 204);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (681, 'El Furrial', 204);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (682, 'Jusepín', 204);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (683, 'La Pica', 204);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (684, 'San Vicente', 204);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (685, 'Capital Piar', 205);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (686, 'Aparicio', 205);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (687, 'Chaguaramal', 205);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (688, 'El Pinto', 205);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (689, 'Guanaguana', 205);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (690, 'La Toscana', 205);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (691, 'Taguaya', 205);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (692, 'Capital Punceres', 206);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (693, 'Cachipo', 206);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (694, 'Capital Santa Bárbara', 207);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (695, 'Capital Sotillo', 208);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (696, 'Los Barrancos de Fajardo', 208);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (697, 'Capital Uracoa', 209);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (698, 'Capital Antolín del Campo', 210);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (699, 'Capital Arismendi', 211);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (700, 'Capital Díaz', 212);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (701, 'Zabala', 212);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (702, 'Capital García', 213);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (703, 'Francisco Fajardo', 213);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (704, 'Capital Gómez', 214);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (705, 'Bolívar', 214);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (706, 'Guevara', 214);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (707, 'Matasiete', 214);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (708, 'Sucre', 214);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (709, 'Capital Maneiro', 215);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (710, 'Aguirre', 215);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (711, 'Capital Marcano', 216);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (712, 'Adrián', 216);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (713, 'Capital Mariño', 217);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (714, 'Capital Península de Macanao', 218);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (715, 'San Francisco', 218);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (716, 'Capital Tubores', 219);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (717, 'Los Barales', 219);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (718, 'Capital Villalba', 220);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (719, 'Vicente Fuentes', 220);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (720, 'Capital Agua Blanca', 221);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (721, 'Capital Araure', 222);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (722, 'Río Acarigua', 222);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (723, 'Capital Esteller', 223);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (724, 'Uveral', 223);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (725, 'Capital Guanare', 224);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (726, 'Córdoba', 224);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (727, 'San José de la Montaña', 224);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (728, 'San Juan de Guanaguanare', 224);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (729, 'Virgen de la Coromoto', 224);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (730, 'Capital Guanarito', 225);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (731, 'Trinidad de la Capilla', 225);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (732, 'Divina Pastora', 225);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (733, 'Capital Monseñor José Vicente de Unda', 226);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (734, 'Peña Blanca', 226);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (735, 'Capital Ospino', 227);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (736, 'Aparición', 227);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (737, 'La Estación', 227);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (738, 'Capital Páez', 228);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (739, 'Payara', 228);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (740, 'Pimpinela', 228);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (741, 'Ramón Peraza', 228);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (742, 'Capital Papelón', 229);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (743, 'Caño Delgadito', 229);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (744, 'Capital San Genaro de Boconoito', 230);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (745, 'Antolín Tovar', 230);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (746, 'Capital San Rafael de Onoto', 231);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (748, 'Thermo Morles', 231);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (749, 'Capital Santa Rosalía', 232);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (750, 'Florida', 232);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (751, 'Capital Sucre', 233);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (752, 'Concepción', 233);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (753, 'San Rafael de Palo Alzado', 233);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (754, 'Uvencio Antonio Velásquez', 233);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (755, 'San José de Saguaz', 233);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (756, 'Villa Rosa', 233);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (757, 'Capital Turén', 234);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (758, 'Canelones', 234);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (759, 'Santa Cruz', 234);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (760, 'San Isidro Labrador', 234);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (761, 'Mariño', 235);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (762, 'Rómulo Gallegos', 235);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (763, 'San José de Aerocuar', 236);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (764, 'Tavera Acosta', 236);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (765, 'Río Caribe', 237);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (766, 'Antonio José de Sucre', 237);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (767, 'El Morro de Puerto Santo', 237);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (768, 'Puerto Santo', 237);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (769, 'San Juan de Las Galdonas', 237);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (770, 'El Pilar', 238);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (771, 'El Rincón', 238);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (772, 'General Francisco Antonio Vásquez', 238);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (773, 'Guaraúnos', 238);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (774, 'Tunapuicito', 238);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (775, 'Unión', 238);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (776, 'Bolívar', 239);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (777, 'Macarapana', 239);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (778, 'Santa Catalina', 239);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (779, 'Santa Rosa', 239);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (780, 'Santa Teresa', 239);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (781, 'Capital Bolívar', 240);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (782, 'Yaguaraparo', 241);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (783, 'El Paujil', 241);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (784, 'Libertad', 241);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (785, 'Araya', 242);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (786, 'Chacopata', 242);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (787, 'Manicuare', 242);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (788, 'Tunapuy', 243);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (789, 'Campo Elías', 243);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (790, 'Irapa', 244);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (791, 'Campo Claro', 244);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (792, 'Marabal', 244);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (793, 'San Antonio de Irapa', 244);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (794, 'Soro', 244);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (795, 'Capital Mejía', 245);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (796, 'Cumanacoa', 246);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (797, 'Arenas', 246);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (798, 'Aricagua', 246);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (799, 'Cocollar', 246);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (800, 'San Fernando', 246);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (801, 'San Lorenzo', 246);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (802, 'Villa Frontado (Muelle de Cariaco)', 247);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (803, 'Catuaro', 247);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (804, 'Rendón', 247);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (805, 'Santa Cruz', 247);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (806, 'Santa María', 247);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (807, 'Altagracia', 248);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (808, 'Ayacucho', 248);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (809, 'Santa Inés', 248);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (810, 'Valentín Valiente', 248);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (811, 'San Juan', 248);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (812, 'Raúl Leoni', 248);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (813, 'Santa Fe', 248);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (814, 'Güiria', 249);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (815, 'Bideau', 249);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (816, 'Cristóbal Colón', 249);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (817, 'Punta de Piedras', 249);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (818, 'Capital Andrés Bello', 250);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (819, 'Capital Antonio Rómulo Costa', 251);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (820, 'Ayacucho', 252);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (821, 'Rivas Berti', 252);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (822, 'San Pedro del Río', 252);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (823, 'Bolívar', 253);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (824, 'Palotal', 253);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (825, 'Juan Vicente Gómez', 253);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (826, 'Isaías Medina Angarita', 253);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (827, 'Cárdenas', 254);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (828, 'Amenodoro Rangel Lamús', 254);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (829, 'La Florida', 254);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (830, 'Capital Córdoba', 255);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (831, 'Fernández Feo', 256);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (832, 'Alberto Adriani', 256);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (833, 'Santo Domingo', 256);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (834, 'Capital Francisco de Miranda', 257);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (835, 'Capital García de Hevia', 258);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (836, 'Boca de Grita', 258);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (837, 'José Antonio Páez', 258);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (838, 'Capital Guásimos', 259);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (839, 'Independencia', 260);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (840, 'Juan Germán Roscio', 260);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (841, 'Román Cárdenas', 260);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (842, 'Jáuregui', 261);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (843, 'Emilio Constantino Guerrero', 261);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (844, 'Monseñor Miguel Antonio Salas', 261);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (845, 'Capital José María Vargas', 262);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (846, 'Junín', 263);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (847, 'La Petrólia', 263);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (848, 'Quinimarí', 263);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (849, 'Bramón', 263);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (850, 'Libertad', 264);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (851, 'Cipriano Castro', 264);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (852, 'Manuel Felipe Rugeles', 264);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (853, 'Libertador', 265);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (854, 'Emeterio Ochoa', 265);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (855, 'Doradas', 265);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (856, 'San Joaquín de Navay', 265);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (857, 'Lobatera', 266);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (858, 'Constitución', 266);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (859, 'Capital Michelena', 267);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (860, 'Panamericano', 268);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (861, 'La Palmita', 268);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (864, 'Capital Rafael Urdaneta', 270);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (865, 'Samuel Darío Maldonado', 271);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (866, 'Boconó', 271);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (867, 'Hernández', 271);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (868, 'La Concordia', 272);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (869, 'Pedro María Morantes', 272);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (870, 'San Juan Bautista', 272);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (871, 'San Sebastián', 272);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (872, 'Dr. Francisco Romero Lobo', 272);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (873, 'Capital Seboruco', 273);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (874, 'Capital Simón Rodríguez', 274);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (875, 'Sucre', 275);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (876, 'Eleazar López Contreras', 275);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (877, 'San Pablo', 275);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (878, 'Capital Torbes', 276);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (879, 'Capital Uribante', 277);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (880, 'Cárdenas', 277);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (881, 'Juan Pablo Peñaloza', 277);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (882, 'Potosí', 277);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (883, 'Capital San Judas Tadeo', 278);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (884, 'Santa Isabel', 279);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (885, 'Araguaney', 279);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (886, 'El Jagüito', 279);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (887, 'La Esperanza', 279);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (888, 'Boconó', 280);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (889, 'El Carmen', 280);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (890, 'Mosquey', 280);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (891, 'Ayacucho', 280);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (892, 'Burbusay', 280);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (893, 'General Rivas', 280);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (894, 'Guaramacal', 280);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (895, 'Vega de Guaramacal', 280);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (896, 'Monseñor Jáuregui', 280);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (897, 'Rafael Rangel', 280);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (898, 'San Miguel', 280);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (899, 'San José', 280);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (900, 'Sabana Grande', 281);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (901, 'Cheregüé', 281);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (902, 'Granados', 281);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (903, 'Chejendé', 282);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (904, 'Arnoldo Gabaldón', 282);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (905, 'Bolivia', 282);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (906, 'Carrillo', 282);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (907, 'Cegarra', 282);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (908, 'Manuel Salvador Ulloa', 282);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (909, 'San José', 282);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (910, 'Carache', 283);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (911, 'Cuicas', 283);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (912, 'La Concepción', 283);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (913, 'Panamericana', 283);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (914, 'Santa Cruz', 283);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (915, 'Escuque', 284);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (916, 'La Unión', 284);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (917, 'Sabana Libre', 284);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (918, 'Santa Rita', 284);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (919, 'El Socorro', 285);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (920, 'Antonio José de Sucre', 285);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (921, 'Los Caprichos', 285);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (922, 'Campo Elías', 286);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (923, 'Arnoldo Gabaldón', 286);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (924, 'Santa Apolonia', 287);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (925, 'El Progreso', 287);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (926, 'La Ceiba', 287);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (927, 'Tres de Febrero', 287);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (928, 'El Dividive', 288);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (929, 'Agua Santa', 288);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (930, 'Agua Caliente', 288);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (931, 'El Cenizo', 288);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (932, 'Valerita', 288);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (933, 'Monte Carmelo', 289);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (934, 'Buena Vista', 289);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (935, 'Santa María del Horcón', 289);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (936, 'Motatán', 290);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (937, 'El Baño', 290);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (938, 'Jalisco', 290);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (939, 'Pampán', 291);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (940, 'Flor de Patria', 291);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (941, 'La Paz', 291);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (942, 'Santa Ana', 291);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (943, 'Pampanito', 292);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (944, 'La Concepción', 292);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (945, 'Pampanito II', 292);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (946, 'Betijoque', 293);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (947, 'La Pueblita', 293);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (948, 'Los Cedros', 293);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (949, 'José Gregorio Hernández', 293);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (950, 'Carvajal', 294);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (951, 'Antonio Nicolás Briceño', 294);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (952, 'Campo Alegre', 294);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (953, 'José Leonardo Suárez', 294);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (954, 'Sabana de Mendoza', 295);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (955, 'El Paraíso', 295);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (956, 'Junín', 295);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (957, 'Valmore Rodríguez', 295);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (958, 'Andrés Linares', 296);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (959, 'Chiquinquirá', 296);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (960, 'Cristóbal Mendoza', 296);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (961, 'Cruz Carrillo', 296);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (962, 'Matriz', 296);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (963, 'Monseñor Carrillo', 296);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (964, 'Tres Esquinas', 296);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (965, 'La Quebrada', 297);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (966, 'Cabimbú', 297);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (967, 'Jajó', 297);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (968, 'La Mesa', 297);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (969, 'Santiago', 297);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (970, 'Tuñame', 297);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (971, 'Juan Ignacio Montilla', 298);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (972, 'La Beatriz', 298);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (973, 'Mercedes Díaz', 298);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (974, 'San Luis', 298);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (975, 'La Puerta', 298);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (976, 'Mendoza', 298);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (977, 'Capital Arístides Bastidas', 299);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (978, 'Capital Bolívar', 300);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (979, 'Capital Bruzual', 301);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (980, 'Campo Elías', 301);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (981, 'Capital Cocorote', 302);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (982, 'Capital Independencia', 303);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (983, 'Capital José Antonio Páez', 304);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (984, 'Capital La Trinidad', 305);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (985, 'Capital Manuel Monge', 306);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (986, 'Capital Nirgua', 307);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (987, 'Salom', 307);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (988, 'Temerla', 307);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (989, 'Capital Peña', 334);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (990, 'San Andrés', 334);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (991, 'Capital San Felipe', 308);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (992, 'Albarico', 308);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (993, 'San Javier', 308);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (994, 'Capital Sucre', 309);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (995, 'Capital Urachiche', 310);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (996, 'Capital Veroes', 311);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (997, 'El Guayabo', 311);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (998, 'Isla de Toas', 312);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (999, 'Monagas', 312);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1000, 'San Timoteo', 313);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1001, 'General Urdaneta', 313);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1002, 'Libertador', 313);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1003, 'Manuel Guanipa Matos', 313);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1004, 'Marcelino Briceño', 313);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1005, 'Pueblo Nuevo', 313);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1006, 'Ambrosio', 314);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1007, 'Carmen Herrera', 314);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1008, 'Germán Ríos Linares', 314);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1009, 'La Rosa', 314);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1010, 'Jorge Hernández', 314);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1011, 'Rómulo Betancourt', 314);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1012, 'San Benito', 314);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1013, 'Arístides Calvani', 314);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1014, 'Punta Gorda', 314);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1015, 'Encontrados', 315);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1016, 'Udón Pérez', 315);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1017, 'San Carlos del Zulia', 316);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1018, 'Moralito', 316);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1019, 'Santa Bárbara', 316);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1020, 'Santa Cruz del Zulia', 316);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1021, 'Urribarri', 316);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1022, 'Simón Rodríguez', 317);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1023, 'Carlos Quevedo', 317);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1024, 'Francisco Javier Pulgar', 317);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1025, 'La Concepción', 318);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1026, 'José Ramón Yepes', 318);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1027, 'Mariano Parra León', 318);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1028, 'San José', 318);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1029, 'Jesús María Semprún', 319);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1030, 'Barí', 319);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1031, 'Concepción', 320);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1032, 'Andrés Bello', 320);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1033, 'Chiquinquirá', 320);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1034, 'El Carmelo', 320);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1035, 'Potreritos', 320);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1036, 'Alonso de Ojeda', 321);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1037, 'Libertad', 321);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1038, 'Campo Lara', 321);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1039, 'Eleazar López Contreras', 321);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1040, 'Venezuela', 321);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1041, 'Libertad', 322);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1042, 'Bartolomé de las Casas', 322);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1043, 'Río Negro', 322);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1044, 'San José de Perijá', 322);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1045, 'San Rafael', 323);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1046, 'La Sierrita', 323);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1047, 'Las Parcelas', 323);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1048, 'Luis de Vicente', 323);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1049, 'Monseñor Marcos Sergio Godoy', 323);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1050, 'Ricaurte', 323);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1051, 'Tamare', 323);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1052, 'Antonio Borjas Romero', 324);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1053, 'Bolívar', 324);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1054, 'Cacique Mara', 324);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1055, 'Caracciolo Parra Pérez', 324);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1056, 'Cecilio Acosta', 324);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1057, 'Cristo de Aranza', 324);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1058, 'Coquivacoa', 324);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1059, 'Chiquinquirá', 324);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1060, 'Francisco Eugenio Bustamante', 324);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1061, 'Idelfonso Vásquez', 324);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1062, 'Juana de Avila', 324);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1063, 'Luis Hurtado Higuera', 324);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1064, 'Manuel Dagnino', 324);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1065, 'Olegario Villalobos', 324);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1066, 'Raúl Leoni', 324);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1067, 'Santa Lucía', 324);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1068, 'Venancio Pulgar', 324);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1069, 'San Isidro', 324);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1070, 'Altagracia', 325);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1071, 'Ana María Campos', 325);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1072, 'Faría', 325);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1073, 'San Antonio', 325);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1074, 'San José', 325);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1075, 'Sinamaica', 326);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1076, 'Alta Guajira', 326);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1077, 'Elías Sánchez Rubio', 326);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1078, 'Guajira', 326);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1079, 'El Rosario', 327);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1080, 'Donaldo García', 327);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1081, 'Sixto Zambrano', 327);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1082, 'San Francisco', 328);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1083, 'El Bajo', 328);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1084, 'Domitila Flores', 328);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1085, 'Francisco Ochoa', 328);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1086, 'Los Cortijos', 328);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1087, 'Marcial Hernández', 328);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1088, 'Santa Rita', 329);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1089, 'El Mene', 329);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1090, 'José Cenovio Urribarri', 329);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1091, 'Pedro Lucas Urribarri', 329);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1092, 'Manuel Manrique', 330);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1093, 'Rafael María Baralt', 330);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1094, 'Rafael Urdaneta', 330);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1095, 'Bobures', 331);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1096, 'El Batey', 331);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1097, 'Gibraltar', 331);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1098, 'Heras', 331);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1099, 'Monseñor Arturo Celestino Alvarez', 331);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1100, 'Rómulo Gallegos', 331);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1101, 'La Victoria', 332);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1102, 'Rafael Urdaneta', 332);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1103, 'Raúl Cuenca', 332);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1104, 'Caraballeda', 333);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1105, 'Carayaca', 333);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1106, 'Caruao', 333);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1107, 'Catia La Mar', 333);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1108, 'El Junko', 333);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1109, 'La Guaira', 333);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1110, 'Macuto', 333);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1111, 'Maiquetía', 333);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1112, 'Naiguatá', 333);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1113, 'Carlos Soublette', 333);
INSERT INTO tbl_parroquia (id, descripcion, id_municipio) VALUES (1114, 'Urimare', 333);


--
-- TOC entry 2304 (class 0 OID 0)
-- Dependencies: 187
-- Name: tbl_parroquia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tbl_parroquia_id_seq', 1, false);


--
-- TOC entry 2245 (class 0 OID 28194)
-- Dependencies: 205
-- Data for Name: tipo_alimento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tipo_alimento (id, descripcion) VALUES (1, 'Proteína');
INSERT INTO tipo_alimento (id, descripcion) VALUES (2, 'Vegetal');
INSERT INTO tipo_alimento (id, descripcion) VALUES (3, 'Grasa');
INSERT INTO tipo_alimento (id, descripcion) VALUES (4, 'Complemento');
INSERT INTO tipo_alimento (id, descripcion) VALUES (5, 'Fruta');
INSERT INTO tipo_alimento (id, descripcion) VALUES (6, 'Frutas');


--
-- TOC entry 2305 (class 0 OID 0)
-- Dependencies: 204
-- Name: tipo_alimento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipo_alimento_id_seq', 6, true);


--
-- TOC entry 2235 (class 0 OID 28142)
-- Dependencies: 195
-- Data for Name: tipo_mascota; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tipo_mascota (id, descripcion) VALUES (1, 'Perro');


--
-- TOC entry 2306 (class 0 OID 0)
-- Dependencies: 194
-- Name: tipo_mascota_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipo_mascota_id_seq', 1, true);


--
-- TOC entry 2241 (class 0 OID 28173)
-- Dependencies: 201
-- Data for Name: unidad_medida; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO unidad_medida (id, descripcion) VALUES (1, 'KG');
INSERT INTO unidad_medida (id, descripcion) VALUES (2, 'CM');


--
-- TOC entry 2307 (class 0 OID 0)
-- Dependencies: 200
-- Name: unidad_medida_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('unidad_medida_id_seq', 2, true);


--
-- TOC entry 2215 (class 0 OID 19470)
-- Dependencies: 175
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usuario (id, username, password, blnborrado, created_date, modified_date, created_by, modified_by, id_perfil, str_nombre, str_apellido, int_cedula) VALUES (3, 'usuario', 'f8032d5cae3de20fcec887f395ec9a6a', false, '2016-08-13', '2016-08-13', 1, 1, 2, 'usuario', '', NULL);
INSERT INTO usuario (id, username, password, blnborrado, created_date, modified_date, created_by, modified_by, id_perfil, str_nombre, str_apellido, int_cedula) VALUES (2, 'admin', '21232f297a57a5a743894a0e4a801fc3', false, '2016-08-13', '2016-08-13', 1, 1, 1, 'Admin', '', NULL);
INSERT INTO usuario (id, username, password, blnborrado, created_date, modified_date, created_by, modified_by, id_perfil, str_nombre, str_apellido, int_cedula) VALUES (1, 'jirojas', '53a95281bf80b66231f952510f0a55d2', false, '2013-04-08', '2016-08-13', 1, 2, 1, 'Jiuly', 'Rojas Delgado', 18043559);


--
-- TOC entry 2308 (class 0 OID 0)
-- Dependencies: 176
-- Name: usuario_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuario_id_seq1', 3, true);


--
-- TOC entry 2047 (class 2606 OID 20518)
-- Name: AuthAssignment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "AuthAssignment"
    ADD CONSTRAINT "AuthAssignment_pkey" PRIMARY KEY (itemname, userid);


--
-- TOC entry 2051 (class 2606 OID 20520)
-- Name: AuthItemChild_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "AuthItemChild"
    ADD CONSTRAINT "AuthItemChild_pkey" PRIMARY KEY (parent, child);


--
-- TOC entry 2049 (class 2606 OID 20522)
-- Name: AuthItem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "AuthItem"
    ADD CONSTRAINT "AuthItem_pkey" PRIMARY KEY (name);


--
-- TOC entry 2079 (class 2606 OID 28207)
-- Name: alimento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY alimento
    ADD CONSTRAINT alimento_pkey PRIMARY KEY (id);


--
-- TOC entry 2061 (class 2606 OID 28098)
-- Name: cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);


--
-- TOC entry 2087 (class 2606 OID 28294)
-- Name: dieta_detalle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY dieta_detalle
    ADD CONSTRAINT dieta_detalle_pkey PRIMARY KEY (id);


--
-- TOC entry 2085 (class 2606 OID 28276)
-- Name: dieta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY dieta
    ADD CONSTRAINT dieta_pkey PRIMARY KEY (id);


--
-- TOC entry 2071 (class 2606 OID 28170)
-- Name: edad_mascota_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY edad_mascota
    ADD CONSTRAINT edad_mascota_pkey PRIMARY KEY (id);


--
-- TOC entry 2065 (class 2606 OID 28134)
-- Name: mascota_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mascota
    ADD CONSTRAINT mascota_pkey PRIMARY KEY (id_mascota);


--
-- TOC entry 2043 (class 2606 OID 20466)
-- Name: perfiles; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY perfil
    ADD CONSTRAINT perfiles PRIMARY KEY (id);


--
-- TOC entry 2075 (class 2606 OID 28186)
-- Name: peso_mascota_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY peso_mascota
    ADD CONSTRAINT peso_mascota_pkey PRIMARY KEY (id);


--
-- TOC entry 2083 (class 2606 OID 28234)
-- Name: porcion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY porcion
    ADD CONSTRAINT porcion_pkey PRIMARY KEY (id);


--
-- TOC entry 2081 (class 2606 OID 28220)
-- Name: precio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY precio
    ADD CONSTRAINT precio_pkey PRIMARY KEY (id);


--
-- TOC entry 2069 (class 2606 OID 28155)
-- Name: raza_mascota_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY raza_mascota
    ADD CONSTRAINT raza_mascota_pkey PRIMARY KEY (id);


--
-- TOC entry 2063 (class 2606 OID 28122)
-- Name: sexo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sexo
    ADD CONSTRAINT sexo_pkey PRIMARY KEY (id);


--
-- TOC entry 2089 (class 2606 OID 28302)
-- Name: si_no_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY si_no
    ADD CONSTRAINT si_no_pkey PRIMARY KEY (id);


--
-- TOC entry 2053 (class 2606 OID 20538)
-- Name: tbl_estado_descripcion_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tbl_estado
    ADD CONSTRAINT tbl_estado_descripcion_key UNIQUE (descripcion);


--
-- TOC entry 2055 (class 2606 OID 20540)
-- Name: tbl_estado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tbl_estado
    ADD CONSTRAINT tbl_estado_pkey PRIMARY KEY (id);


--
-- TOC entry 2057 (class 2606 OID 20542)
-- Name: tbl_municipio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tbl_municipio
    ADD CONSTRAINT tbl_municipio_pkey PRIMARY KEY (id);


--
-- TOC entry 2059 (class 2606 OID 20544)
-- Name: tbl_parroquia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tbl_parroquia
    ADD CONSTRAINT tbl_parroquia_pkey PRIMARY KEY (id);


--
-- TOC entry 2077 (class 2606 OID 28199)
-- Name: tipo_alimento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_alimento
    ADD CONSTRAINT tipo_alimento_pkey PRIMARY KEY (id);


--
-- TOC entry 2067 (class 2606 OID 28147)
-- Name: tipo_mascota_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_mascota
    ADD CONSTRAINT tipo_mascota_pkey PRIMARY KEY (id);


--
-- TOC entry 2073 (class 2606 OID 28178)
-- Name: unidad_medida_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY unidad_medida
    ADD CONSTRAINT unidad_medida_pkey PRIMARY KEY (id);


--
-- TOC entry 2045 (class 2606 OID 20494)
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 2090 (class 2606 OID 20740)
-- Name: AuthAssignment_itemname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "AuthAssignment"
    ADD CONSTRAINT "AuthAssignment_itemname_fkey" FOREIGN KEY (itemname) REFERENCES "AuthItem"(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2091 (class 2606 OID 20745)
-- Name: AuthItemChild_child_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "AuthItemChild"
    ADD CONSTRAINT "AuthItemChild_child_fkey" FOREIGN KEY (child) REFERENCES "AuthItem"(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2092 (class 2606 OID 20750)
-- Name: AuthItemChild_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "AuthItemChild"
    ADD CONSTRAINT "AuthItemChild_parent_fkey" FOREIGN KEY (parent) REFERENCES "AuthItem"(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2098 (class 2606 OID 28208)
-- Name: alimento_tipo_alimento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alimento
    ADD CONSTRAINT alimento_tipo_alimento_fkey FOREIGN KEY (tipo_alimento) REFERENCES tipo_alimento(id);


--
-- TOC entry 2102 (class 2606 OID 28277)
-- Name: dieta_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dieta
    ADD CONSTRAINT dieta_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES cliente(id);


--
-- TOC entry 2103 (class 2606 OID 28282)
-- Name: dieta_id_mascota_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dieta
    ADD CONSTRAINT dieta_id_mascota_fkey FOREIGN KEY (id_mascota) REFERENCES mascota(id_mascota);


--
-- TOC entry 2095 (class 2606 OID 28135)
-- Name: mascota_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mascota
    ADD CONSTRAINT mascota_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES cliente(id);


--
-- TOC entry 2097 (class 2606 OID 28187)
-- Name: peso_mascota_unidad_medida_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY peso_mascota
    ADD CONSTRAINT peso_mascota_unidad_medida_fkey FOREIGN KEY (unidad_medida) REFERENCES unidad_medida(id);


--
-- TOC entry 2101 (class 2606 OID 28240)
-- Name: porcion_id_edad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY porcion
    ADD CONSTRAINT porcion_id_edad_fkey FOREIGN KEY (id_edad) REFERENCES edad_mascota(id);


--
-- TOC entry 2100 (class 2606 OID 28235)
-- Name: porcion_id_peso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY porcion
    ADD CONSTRAINT porcion_id_peso_fkey FOREIGN KEY (id_peso) REFERENCES peso_mascota(id);


--
-- TOC entry 2099 (class 2606 OID 28221)
-- Name: precio_id_alimento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY precio
    ADD CONSTRAINT precio_id_alimento_fkey FOREIGN KEY (id_alimento) REFERENCES alimento(id);


--
-- TOC entry 2096 (class 2606 OID 28156)
-- Name: raza_mascota_id_tipo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY raza_mascota
    ADD CONSTRAINT raza_mascota_id_tipo_fkey FOREIGN KEY (id_tipo) REFERENCES tipo_mascota(id);


--
-- TOC entry 2093 (class 2606 OID 20755)
-- Name: tbl_municipio_id_estado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tbl_municipio
    ADD CONSTRAINT tbl_municipio_id_estado_fkey FOREIGN KEY (id_estado) REFERENCES tbl_estado(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2094 (class 2606 OID 20760)
-- Name: tbl_parroquia_id_municipio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tbl_parroquia
    ADD CONSTRAINT tbl_parroquia_id_municipio_fkey FOREIGN KEY (id_municipio) REFERENCES tbl_municipio(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2264 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-08-15 08:42:05 VET

--
-- PostgreSQL database dump complete
--
