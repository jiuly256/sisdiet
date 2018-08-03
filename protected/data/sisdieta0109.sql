--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.18
-- Dumped by pg_dump version 9.1.18
-- Started on 2016-09-02 21:53:00 VET

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 203 (class 3079 OID 11645)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2095 (class 0 OID 0)
-- Dependencies: 203
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- TOC entry 216 (class 1255 OID 74705)
-- Dependencies: 618 6
-- Name: edad(date); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION edad(fechanacimiento date) RETURNS character varying
    LANGUAGE plpgsql
    AS $_$
DECLARE
  -- resultados
  edad integer;
  resultadoMes integer;
  resultadoDia integer;
  -- variables
  anyoActual integer;
  anyoNacimientoPersona integer;
  mesActual integer;
  mesNacimientoPersona integer;
  diaActual integer;
  diaNacimientoPersona integer;
  --resultado que retorna
  resultado varchar;
BEGIN
  --obtiene al año de cada fecha
  anyoActual := (SELECT EXTRACT(YEAR FROM DATE (current_date)));
  anyoNacimientoPersona := (SELECT EXTRACT(YEAR FROM DATE ($1)));
  --obtiene el mes de cada fecha
  mesActual := (SELECT EXTRACT(MONTH FROM DATE (current_date)));
  mesNacimientoPersona := (SELECT EXTRACT(MONTH FROM DATE ($1)));
  --obtiene el dia de cada fecha
  diaActual := (SELECT EXTRACT(DAY FROM DATE (current_date)));
  diaNacimientoPersona := (SELECT EXTRACT(DAY FROM DATE ($1)));
  --resultado de la sustracción del año actual y el año obtenido de la fecha
  edad := anyoActual-anyoNacimientoPersona;
  --resultado de la sustracción del mes actual y el mes obtenido de la fecha
  resultadoMes := mesActual-mesNacimientoPersona;
  --resultado de la sustracción del dia actual y el dia obtenido de la fecha
  resultadoDia := diaActual-diaNacimientoPersona;
  
  IF edad >= 21 THEN
     resultado := 'mayor';
  ELSE
     resultado := 'menor';
  END IF;

  IF edad = 0 THEN
 edad :=  resultadoMes;
  end if;
  
  return edad;
END;
$_$;


ALTER FUNCTION public.edad(fechanacimiento date) OWNER TO postgres;

--
-- TOC entry 215 (class 1255 OID 74704)
-- Dependencies: 6 618
-- Name: mayoomenoredad(date); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION mayoomenoredad(fechanacimiento date) RETURNS character varying
    LANGUAGE plpgsql
    AS $_$
DECLARE
  -- resultados
  edad integer;
  resultadoMes integer;
  resultadoDia integer;
  -- variables
  anyoActual integer;
  anyoNacimientoPersona integer;
  mesActual integer;
  mesNacimientoPersona integer;
  diaActual integer;
  diaNacimientoPersona integer;
  --resultado que retorna
  resultado varchar;
BEGIN
  --obtiene al año de cada fecha
  anyoActual := (SELECT EXTRACT(YEAR FROM DATE (current_date)));
  anyoNacimientoPersona := (SELECT EXTRACT(YEAR FROM DATE ($1)));
  --obtiene el mes de cada fecha
  mesActual := (SELECT EXTRACT(MONTH FROM DATE (current_date)));
  mesNacimientoPersona := (SELECT EXTRACT(MONTH FROM DATE ($1)));
  --obtiene el dia de cada fecha
  diaActual := (SELECT EXTRACT(DAY FROM DATE (current_date)));
  diaNacimientoPersona := (SELECT EXTRACT(DAY FROM DATE ($1)));
  --resultado de la sustracción del año actual y el año obtenido de la fecha
  edad := anyoActual-anyoNacimientoPersona;
  --resultado de la sustracción del mes actual y el mes obtenido de la fecha
  resultadoMes := mesActual-mesNacimientoPersona;
  --resultado de la sustracción del dia actual y el dia obtenido de la fecha
  resultadoDia := diaActual-diaNacimientoPersona;
  IF resultadoMes < 0 THEN
     edad := edad - 1;
  ELSE
     IF resultadoMes = 0 THEN
        IF resultadoDia < 0 THEN
           edad := edad - 1;
        END IF;
     END IF;
  END IF;
  IF edad >= 21 THEN
     resultado := 'mayor';
  ELSE
     resultado := 'menor';
  END IF;
  return edad;
END;
$_$;


ALTER FUNCTION public.mayoomenoredad(fechanacimiento date) OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 161 (class 1259 OID 64022)
-- Dependencies: 6
-- Name: alimento; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE alimento (
    id integer NOT NULL,
    descripcion character varying(50),
    tipo_alimento integer,
    observaciones text,
    id_unidad integer,
    cantidad double precision
);


ALTER TABLE public.alimento OWNER TO postgres;

--
-- TOC entry 162 (class 1259 OID 64025)
-- Dependencies: 161 6
-- Name: alimento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE alimento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alimento_id_seq OWNER TO postgres;

--
-- TOC entry 2096 (class 0 OID 0)
-- Dependencies: 162
-- Name: alimento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE alimento_id_seq OWNED BY alimento.id;


--
-- TOC entry 163 (class 1259 OID 64027)
-- Dependencies: 6
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


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 164 (class 1259 OID 64033)
-- Dependencies: 163 6
-- Name: cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_id_seq OWNER TO postgres;

--
-- TOC entry 2097 (class 0 OID 0)
-- Dependencies: 164
-- Name: cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cliente_id_seq OWNED BY cliente.id;


--
-- TOC entry 165 (class 1259 OID 64035)
-- Dependencies: 6
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


ALTER TABLE public.dieta OWNER TO postgres;

--
-- TOC entry 166 (class 1259 OID 64038)
-- Dependencies: 6
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


ALTER TABLE public.dieta_detalle OWNER TO postgres;

--
-- TOC entry 167 (class 1259 OID 64041)
-- Dependencies: 166 6
-- Name: dieta_detalle_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE dieta_detalle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dieta_detalle_id_seq OWNER TO postgres;

--
-- TOC entry 2098 (class 0 OID 0)
-- Dependencies: 167
-- Name: dieta_detalle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE dieta_detalle_id_seq OWNED BY dieta_detalle.id;


--
-- TOC entry 168 (class 1259 OID 64043)
-- Dependencies: 6 165
-- Name: dieta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE dieta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dieta_id_seq OWNER TO postgres;

--
-- TOC entry 2099 (class 0 OID 0)
-- Dependencies: 168
-- Name: dieta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE dieta_id_seq OWNED BY dieta.id;


--
-- TOC entry 169 (class 1259 OID 64045)
-- Dependencies: 6
-- Name: divisa_id_divisa_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE divisa_id_divisa_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.divisa_id_divisa_pk_seq OWNER TO postgres;

--
-- TOC entry 170 (class 1259 OID 64047)
-- Dependencies: 6
-- Name: edad_mascota; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE edad_mascota (
    id integer NOT NULL,
    tipo character varying(30),
    descripcion character varying(30),
    edad_desde double precision,
    edad_hasta double precision
);


ALTER TABLE public.edad_mascota OWNER TO postgres;

--
-- TOC entry 171 (class 1259 OID 64050)
-- Dependencies: 6 170
-- Name: edad_mascota_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE edad_mascota_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.edad_mascota_id_seq OWNER TO postgres;

--
-- TOC entry 2100 (class 0 OID 0)
-- Dependencies: 171
-- Name: edad_mascota_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE edad_mascota_id_seq OWNED BY edad_mascota.id;


--
-- TOC entry 198 (class 1259 OID 64552)
-- Dependencies: 6
-- Name: entrada_almacen; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE entrada_almacen (
    id integer NOT NULL,
    fecha date,
    observacion text
);


ALTER TABLE public.entrada_almacen OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 64550)
-- Dependencies: 6 198
-- Name: entrada_almacen_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE entrada_almacen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.entrada_almacen_id_seq OWNER TO postgres;

--
-- TOC entry 2101 (class 0 OID 0)
-- Dependencies: 197
-- Name: entrada_almacen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE entrada_almacen_id_seq OWNED BY entrada_almacen.id;


--
-- TOC entry 172 (class 1259 OID 64052)
-- Dependencies: 6
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
    longitud double precision,
    longitud_medida integer,
    peso double precision,
    peso_medida integer,
    foto character varying(100),
    observacion text,
    created_date date,
    modified_date date,
    created_by integer,
    modified_by integer
);


ALTER TABLE public.mascota OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 64058)
-- Dependencies: 172 6
-- Name: mascota_id_mascota_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mascota_id_mascota_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mascota_id_mascota_seq OWNER TO postgres;

--
-- TOC entry 2102 (class 0 OID 0)
-- Dependencies: 173
-- Name: mascota_id_mascota_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mascota_id_mascota_seq OWNED BY mascota.id_mascota;


--
-- TOC entry 174 (class 1259 OID 64060)
-- Dependencies: 6
-- Name: perfil; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE perfil (
    id integer NOT NULL,
    nombre_perfil character varying(150)
);


ALTER TABLE public.perfil OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 64063)
-- Dependencies: 174 6
-- Name: perfil_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE perfil_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.perfil_id_seq OWNER TO postgres;

--
-- TOC entry 2103 (class 0 OID 0)
-- Dependencies: 175
-- Name: perfil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE perfil_id_seq OWNED BY perfil.id;


--
-- TOC entry 176 (class 1259 OID 64065)
-- Dependencies: 6
-- Name: peso_mascota; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE peso_mascota (
    id integer NOT NULL,
    cantidad double precision,
    medida character varying(12),
    unidad_medida integer,
    cantidad_hasta double precision
);


ALTER TABLE public.peso_mascota OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 64068)
-- Dependencies: 6 176
-- Name: peso_mascota_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE peso_mascota_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.peso_mascota_id_seq OWNER TO postgres;

--
-- TOC entry 2104 (class 0 OID 0)
-- Dependencies: 177
-- Name: peso_mascota_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE peso_mascota_id_seq OWNED BY peso_mascota.id;


--
-- TOC entry 178 (class 1259 OID 64070)
-- Dependencies: 6
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


ALTER TABLE public.porcion OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 64073)
-- Dependencies: 178 6
-- Name: porcion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE porcion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.porcion_id_seq OWNER TO postgres;

--
-- TOC entry 2105 (class 0 OID 0)
-- Dependencies: 179
-- Name: porcion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE porcion_id_seq OWNED BY porcion.id;


--
-- TOC entry 180 (class 1259 OID 64075)
-- Dependencies: 6
-- Name: precio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE precio (
    id integer NOT NULL,
    id_alimento integer,
    precio double precision,
    fecha date,
    cantidad double precision,
    precio_venta double precision,
    fecha_vencimiento date,
    id_entrada_almacen integer
);


ALTER TABLE public.precio OWNER TO postgres;

--
-- TOC entry 2106 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN precio.precio; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN precio.precio IS '
';


--
-- TOC entry 181 (class 1259 OID 64078)
-- Dependencies: 6 180
-- Name: precio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE precio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.precio_id_seq OWNER TO postgres;

--
-- TOC entry 2107 (class 0 OID 0)
-- Dependencies: 181
-- Name: precio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE precio_id_seq OWNED BY precio.id;


--
-- TOC entry 182 (class 1259 OID 64080)
-- Dependencies: 6
-- Name: raza_mascota; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE raza_mascota (
    id integer NOT NULL,
    id_tipo integer,
    descripcion character varying(100),
    foto character varying(50)
);


ALTER TABLE public.raza_mascota OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 64083)
-- Dependencies: 182 6
-- Name: raza_mascota_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE raza_mascota_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.raza_mascota_id_seq OWNER TO postgres;

--
-- TOC entry 2108 (class 0 OID 0)
-- Dependencies: 183
-- Name: raza_mascota_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE raza_mascota_id_seq OWNED BY raza_mascota.id;


--
-- TOC entry 184 (class 1259 OID 64085)
-- Dependencies: 6
-- Name: sexo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sexo (
    id integer NOT NULL,
    descripcion character varying(50)
);


ALTER TABLE public.sexo OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 64088)
-- Dependencies: 6 184
-- Name: sexo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sexo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sexo_id_seq OWNER TO postgres;

--
-- TOC entry 2109 (class 0 OID 0)
-- Dependencies: 185
-- Name: sexo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sexo_id_seq OWNED BY sexo.id;


--
-- TOC entry 186 (class 1259 OID 64090)
-- Dependencies: 6
-- Name: si_no; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE si_no (
    id integer NOT NULL,
    descripcion character varying(2)
);


ALTER TABLE public.si_no OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 64093)
-- Dependencies: 6 186
-- Name: si_no_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE si_no_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.si_no_id_seq OWNER TO postgres;

--
-- TOC entry 2110 (class 0 OID 0)
-- Dependencies: 187
-- Name: si_no_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE si_no_id_seq OWNED BY si_no.id;


--
-- TOC entry 188 (class 1259 OID 64095)
-- Dependencies: 6
-- Name: tbl_contratista_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tbl_contratista_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_contratista_id_seq OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 64115)
-- Dependencies: 6
-- Name: tipo_alimento; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_alimento (
    id integer NOT NULL,
    descripcion character varying(30)
);


ALTER TABLE public.tipo_alimento OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 64118)
-- Dependencies: 189 6
-- Name: tipo_alimento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_alimento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_alimento_id_seq OWNER TO postgres;

--
-- TOC entry 2111 (class 0 OID 0)
-- Dependencies: 190
-- Name: tipo_alimento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_alimento_id_seq OWNED BY tipo_alimento.id;


--
-- TOC entry 191 (class 1259 OID 64120)
-- Dependencies: 6
-- Name: tipo_mascota; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_mascota (
    id integer NOT NULL,
    descripcion character varying(50)
);


ALTER TABLE public.tipo_mascota OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 64123)
-- Dependencies: 6 191
-- Name: tipo_mascota_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_mascota_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_mascota_id_seq OWNER TO postgres;

--
-- TOC entry 2112 (class 0 OID 0)
-- Dependencies: 192
-- Name: tipo_mascota_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_mascota_id_seq OWNED BY tipo_mascota.id;


--
-- TOC entry 193 (class 1259 OID 64125)
-- Dependencies: 6
-- Name: unidad_medida; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE unidad_medida (
    id integer NOT NULL,
    descripcion character varying(12),
    descripcion_completa character varying,
    tipo character varying
);


ALTER TABLE public.unidad_medida OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 64128)
-- Dependencies: 193 6
-- Name: unidad_medida_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE unidad_medida_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unidad_medida_id_seq OWNER TO postgres;

--
-- TOC entry 2113 (class 0 OID 0)
-- Dependencies: 194
-- Name: unidad_medida_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE unidad_medida_id_seq OWNED BY unidad_medida.id;


--
-- TOC entry 195 (class 1259 OID 64130)
-- Dependencies: 1897 6
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


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 64137)
-- Dependencies: 195 6
-- Name: usuario_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuario_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_id_seq1 OWNER TO postgres;

--
-- TOC entry 2114 (class 0 OID 0)
-- Dependencies: 196
-- Name: usuario_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuario_id_seq1 OWNED BY usuario.id;


--
-- TOC entry 202 (class 1259 OID 91101)
-- Dependencies: 2049 6
-- Name: vistacm; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vistacm AS
    SELECT a.id, a.cedula, a.nombre, a.apellido, a.sexo, a.direccion, a.telefono, a.telefono_casa, a.correo_electronico, a.created_date, a.modified_date, a.created_by, a.modified_by, b.nombre AS nombre_mascota, b.id_mascota FROM cliente a, mascota b WHERE (a.id = b.id_cliente);


ALTER TABLE public.vistacm OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 82905)
-- Dependencies: 2046 6
-- Name: vistaporcion; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vistaporcion AS
    SELECT a.id, a.id_peso, a.id_edad, a.cantidad_gramos, a.porcentaje_grasa, a.porcentaje_proteina, a.porcentaje_vegetal, b.cantidad, b.cantidad_hasta, b.medida, c.edad_desde, c.edad_hasta, c.id AS id_clasificacion, c.tipo FROM porcion a, peso_mascota b, edad_mascota c WHERE ((a.id_peso = b.id) AND (a.id_edad = c.id));


ALTER TABLE public.vistaporcion OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 82909)
-- Dependencies: 2047 6
-- Name: vistadetalle; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vistadetalle AS
    SELECT a.id, a.fecha, b.nombre AS nombre_mascota, b.clasificacion, b.peso, e.descripcion AS medida, d.tipo, d.descripcion, c.nombre, c.apellido, (SELECT vistaporcion.cantidad_gramos FROM vistaporcion WHERE (((vistaporcion.cantidad >= b.peso) AND (vistaporcion.cantidad <= (SELECT (b.peso + (5)::double precision)))) AND ((vistaporcion.tipo)::text = (d.tipo)::text)) LIMIT 1) AS porcion FROM dieta a, mascota b, cliente c, edad_mascota d, unidad_medida e WHERE ((((b.id_mascota = a.id_mascota) AND (c.id = a.id_cliente)) AND (b.peso_medida = e.id)) AND (b.clasificacion = d.id));


ALTER TABLE public.vistadetalle OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 91097)
-- Dependencies: 2048 6
-- Name: vistaprecios; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vistaprecios AS
    SELECT a.id, a.id_alimento, a.precio, a.fecha, a.cantidad, a.precio_venta, b.tipo_alimento, a.fecha_vencimiento, a.id_entrada_almacen, b.descripcion, c.descripcion AS unidad, round((float8(((a.precio_venta)::numeric / (1000)::numeric)))::numeric, 2) AS precio_venta_gramo FROM precio a, alimento b, unidad_medida c WHERE ((a.id_alimento = b.id) AND (b.id_unidad = c.id)) ORDER BY a.fecha DESC;


ALTER TABLE public.vistaprecios OWNER TO postgres;

--
-- TOC entry 1881 (class 2604 OID 64139)
-- Dependencies: 162 161
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alimento ALTER COLUMN id SET DEFAULT nextval('alimento_id_seq'::regclass);


--
-- TOC entry 1882 (class 2604 OID 64140)
-- Dependencies: 164 163
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente ALTER COLUMN id SET DEFAULT nextval('cliente_id_seq'::regclass);


--
-- TOC entry 1883 (class 2604 OID 64141)
-- Dependencies: 168 165
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dieta ALTER COLUMN id SET DEFAULT nextval('dieta_id_seq'::regclass);


--
-- TOC entry 1884 (class 2604 OID 64142)
-- Dependencies: 167 166
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dieta_detalle ALTER COLUMN id SET DEFAULT nextval('dieta_detalle_id_seq'::regclass);


--
-- TOC entry 1885 (class 2604 OID 64143)
-- Dependencies: 171 170
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY edad_mascota ALTER COLUMN id SET DEFAULT nextval('edad_mascota_id_seq'::regclass);


--
-- TOC entry 1899 (class 2604 OID 64555)
-- Dependencies: 197 198 198
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entrada_almacen ALTER COLUMN id SET DEFAULT nextval('entrada_almacen_id_seq'::regclass);


--
-- TOC entry 1886 (class 2604 OID 64144)
-- Dependencies: 173 172
-- Name: id_mascota; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mascota ALTER COLUMN id_mascota SET DEFAULT nextval('mascota_id_mascota_seq'::regclass);


--
-- TOC entry 1887 (class 2604 OID 64145)
-- Dependencies: 175 174
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY perfil ALTER COLUMN id SET DEFAULT nextval('perfil_id_seq'::regclass);


--
-- TOC entry 1888 (class 2604 OID 64146)
-- Dependencies: 177 176
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY peso_mascota ALTER COLUMN id SET DEFAULT nextval('peso_mascota_id_seq'::regclass);


--
-- TOC entry 1889 (class 2604 OID 64147)
-- Dependencies: 179 178
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY porcion ALTER COLUMN id SET DEFAULT nextval('porcion_id_seq'::regclass);


--
-- TOC entry 1890 (class 2604 OID 64148)
-- Dependencies: 181 180
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY precio ALTER COLUMN id SET DEFAULT nextval('precio_id_seq'::regclass);


--
-- TOC entry 1891 (class 2604 OID 64149)
-- Dependencies: 183 182
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY raza_mascota ALTER COLUMN id SET DEFAULT nextval('raza_mascota_id_seq'::regclass);


--
-- TOC entry 1892 (class 2604 OID 64150)
-- Dependencies: 185 184
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sexo ALTER COLUMN id SET DEFAULT nextval('sexo_id_seq'::regclass);


--
-- TOC entry 1893 (class 2604 OID 64151)
-- Dependencies: 187 186
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY si_no ALTER COLUMN id SET DEFAULT nextval('si_no_id_seq'::regclass);


--
-- TOC entry 1894 (class 2604 OID 64155)
-- Dependencies: 190 189
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_alimento ALTER COLUMN id SET DEFAULT nextval('tipo_alimento_id_seq'::regclass);


--
-- TOC entry 1895 (class 2604 OID 64156)
-- Dependencies: 192 191
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_mascota ALTER COLUMN id SET DEFAULT nextval('tipo_mascota_id_seq'::regclass);


--
-- TOC entry 1896 (class 2604 OID 64157)
-- Dependencies: 194 193
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY unidad_medida ALTER COLUMN id SET DEFAULT nextval('unidad_medida_id_seq'::regclass);


--
-- TOC entry 1898 (class 2604 OID 64158)
-- Dependencies: 196 195
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario ALTER COLUMN id SET DEFAULT nextval('usuario_id_seq1'::regclass);


--
-- TOC entry 2050 (class 0 OID 64022)
-- Dependencies: 161 2088
-- Data for Name: alimento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO alimento (id, descripcion, tipo_alimento, observaciones, id_unidad, cantidad) VALUES (6, 'CORAZON', 1, NULL, 1, NULL);
INSERT INTO alimento (id, descripcion, tipo_alimento, observaciones, id_unidad, cantidad) VALUES (7, 'GRASA ANIMAL', 3, NULL, 1, NULL);
INSERT INTO alimento (id, descripcion, tipo_alimento, observaciones, id_unidad, cantidad) VALUES (8, 'CHIA', 2, NULL, 1, NULL);
INSERT INTO alimento (id, descripcion, tipo_alimento, observaciones, id_unidad, cantidad) VALUES (9, 'QUINOA', 2, NULL, 1, NULL);
INSERT INTO alimento (id, descripcion, tipo_alimento, observaciones, id_unidad, cantidad) VALUES (10, 'CAMBUR', 5, NULL, 1, NULL);
INSERT INTO alimento (id, descripcion, tipo_alimento, observaciones, id_unidad, cantidad) VALUES (11, 'LECHOZA', 5, NULL, 1, NULL);
INSERT INTO alimento (id, descripcion, tipo_alimento, observaciones, id_unidad, cantidad) VALUES (12, 'MANZANA', 5, NULL, 1, NULL);
INSERT INTO alimento (id, descripcion, tipo_alimento, observaciones, id_unidad, cantidad) VALUES (13, 'ESPINACA', 2, NULL, 1, NULL);
INSERT INTO alimento (id, descripcion, tipo_alimento, observaciones, id_unidad, cantidad) VALUES (14, 'BROCOLI', 2, NULL, 1, NULL);
INSERT INTO alimento (id, descripcion, tipo_alimento, observaciones, id_unidad, cantidad) VALUES (15, 'AUYAMA', 2, NULL, 1, NULL);
INSERT INTO alimento (id, descripcion, tipo_alimento, observaciones, id_unidad, cantidad) VALUES (16, 'ALCACHOFA', 2, NULL, 1, NULL);
INSERT INTO alimento (id, descripcion, tipo_alimento, observaciones, id_unidad, cantidad) VALUES (17, 'CALABACIN', 2, NULL, 1, NULL);
INSERT INTO alimento (id, descripcion, tipo_alimento, observaciones, id_unidad, cantidad) VALUES (18, 'BERENJENA', 2, NULL, 1, NULL);
INSERT INTO alimento (id, descripcion, tipo_alimento, observaciones, id_unidad, cantidad) VALUES (19, 'ZANAHORIA', 2, NULL, 1, NULL);
INSERT INTO alimento (id, descripcion, tipo_alimento, observaciones, id_unidad, cantidad) VALUES (20, 'ALBAHACA', 2, NULL, 1, NULL);
INSERT INTO alimento (id, descripcion, tipo_alimento, observaciones, id_unidad, cantidad) VALUES (21, 'CEBADA', 2, NULL, 1, NULL);
INSERT INTO alimento (id, descripcion, tipo_alimento, observaciones, id_unidad, cantidad) VALUES (2, 'POLLO', 1, NULL, 1, NULL);
INSERT INTO alimento (id, descripcion, tipo_alimento, observaciones, id_unidad, cantidad) VALUES (3, 'PESCADO', 1, NULL, 1, NULL);
INSERT INTO alimento (id, descripcion, tipo_alimento, observaciones, id_unidad, cantidad) VALUES (4, 'HIGADO', 1, NULL, 1, NULL);
INSERT INTO alimento (id, descripcion, tipo_alimento, observaciones, id_unidad, cantidad) VALUES (1, 'RES', 1, NULL, 1, NULL);
INSERT INTO alimento (id, descripcion, tipo_alimento, observaciones, id_unidad, cantidad) VALUES (5, 'HUEVO', 4, NULL, 1, NULL);


--
-- TOC entry 2115 (class 0 OID 0)
-- Dependencies: 162
-- Name: alimento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('alimento_id_seq', 1, false);


--
-- TOC entry 2052 (class 0 OID 64027)
-- Dependencies: 163 2088
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cliente (id, cedula, nombre, apellido, sexo, direccion, telefono, telefono_casa, correo_electronico, created_date, modified_date, created_by, modified_by) VALUES (1, 18043559, 'Jiuly', 'Rojas', 1, 'El Paraiso', '(0412)-295-6779', '(0212)-483-1757', 'jiuly256@gmail.com', '2016-08-13', '2016-08-18', 2, 2);
INSERT INTO cliente (id, cedula, nombre, apellido, sexo, direccion, telefono, telefono_casa, correo_electronico, created_date, modified_date, created_by, modified_by) VALUES (3, 123456, 'Isabel', 'Alvarez', 1, 'Caracas', '(2222)-222-2222', '(3333)-333-3333', '', '2016-09-01', '2016-09-01', 1, 1);
INSERT INTO cliente (id, cedula, nombre, apellido, sexo, direccion, telefono, telefono_casa, correo_electronico, created_date, modified_date, created_by, modified_by) VALUES (2, 22615011, 'Carlos', 'Castillo', 2, 'El Paraiso', '(0412)-292-8954', '(0212)-483-1757', 'carlos_castillo444@gmail.com', '2016-08-28', '2016-09-01', 1, 1);


--
-- TOC entry 2116 (class 0 OID 0)
-- Dependencies: 164
-- Name: cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cliente_id_seq', 3, true);


--
-- TOC entry 2054 (class 0 OID 64035)
-- Dependencies: 165 2088
-- Data for Name: dieta; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO dieta (id, fecha, id_cliente, id_mascota, precio_diario, dias, precio_dias, iva, monto_iva, precio_total, created_date, modified_date, created_by, modified_by) VALUES (7, '2016-09-02', 1, 1, 312.439999999999998, 1, 312.439999999999998, 12, 37.4928000000000026, 349.932799999999986, '2016-09-02', '2016-09-02', 1, 1);
INSERT INTO dieta (id, fecha, id_cliente, id_mascota, precio_diario, dias, precio_dias, iva, monto_iva, precio_total, created_date, modified_date, created_by, modified_by) VALUES (2, '2016-09-01', 3, 2, 3762.5, 10, 37625, 12, 4515, 42140, '2016-09-01', '2016-09-01', 1, 1);
INSERT INTO dieta (id, fecha, id_cliente, id_mascota, precio_diario, dias, precio_dias, iva, monto_iva, precio_total, created_date, modified_date, created_by, modified_by) VALUES (3, '2016-09-01', 2, 3, 603.75, 7, 4226.25, 12, 507.149999999999977, 4733.39999999999964, '2016-09-01', '2016-09-01', 1, 1);
INSERT INTO dieta (id, fecha, id_cliente, id_mascota, precio_diario, dias, precio_dias, iva, monto_iva, precio_total, created_date, modified_date, created_by, modified_by) VALUES (6, '2016-09-02', 1, 1, 422.939999999999998, 1, 422.939999999999998, 12, 50.7528000000000006, 473.692799999999977, '2016-09-02', '2016-09-02', 1, 1);
INSERT INTO dieta (id, fecha, id_cliente, id_mascota, precio_diario, dias, precio_dias, iva, monto_iva, precio_total, created_date, modified_date, created_by, modified_by) VALUES (4, '2016-08-31', 1, 1, 437.259999999999991, 1, 437.259999999999991, 12, 52.4712000000000032, 489.731200000000001, '2016-09-01', '2016-09-02', 1, 1);
INSERT INTO dieta (id, fecha, id_cliente, id_mascota, precio_diario, dias, precio_dias, iva, monto_iva, precio_total, created_date, modified_date, created_by, modified_by) VALUES (8, '2016-09-02', 1, 4, 775.950000000000045, 1, 775.950000000000045, 12, 93.1140000000000043, 869.063999999999965, '2016-09-02', '2016-09-02', 1, 1);
INSERT INTO dieta (id, fecha, id_cliente, id_mascota, precio_diario, dias, precio_dias, iva, monto_iva, precio_total, created_date, modified_date, created_by, modified_by) VALUES (9, '2016-09-02', 3, 2, 1866.25, 20, 37325, 12, 4479, 41804, '2016-09-02', '2016-09-02', 2, 2);


--
-- TOC entry 2055 (class 0 OID 64038)
-- Dependencies: 166 2088
-- Data for Name: dieta_detalle; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO dieta_detalle (id, id_dieta, id_alimento, cantidad_gramos, costo_gramos, precio_gramos, created_date, modified_date, created_by, modified_by) VALUES (75, 2, 1, 350, 5, 1750, '2016-09-01', '2016-09-01', 1, 1);
INSERT INTO dieta_detalle (id, id_dieta, id_alimento, cantidad_gramos, costo_gramos, precio_gramos, created_date, modified_date, created_by, modified_by) VALUES (76, 2, 19, 75, 0.900000000000000022, 67.5, '2016-09-01', '2016-09-01', 1, 1);
INSERT INTO dieta_detalle (id, id_dieta, id_alimento, cantidad_gramos, costo_gramos, precio_gramos, created_date, modified_date, created_by, modified_by) VALUES (77, 2, 13, 75, 0.849999999999999978, 63.75, '2016-09-01', '2016-09-01', 1, 1);
INSERT INTO dieta_detalle (id, id_dieta, id_alimento, cantidad_gramos, costo_gramos, precio_gramos, created_date, modified_date, created_by, modified_by) VALUES (78, 3, 2, 210, 2.5, 525, '2016-09-01', '2016-09-01', 1, 1);
INSERT INTO dieta_detalle (id, id_dieta, id_alimento, cantidad_gramos, costo_gramos, precio_gramos, created_date, modified_date, created_by, modified_by) VALUES (79, 3, 19, 45, 0.900000000000000022, 40.5, '2016-09-01', '2016-09-01', 1, 1);
INSERT INTO dieta_detalle (id, id_dieta, id_alimento, cantidad_gramos, costo_gramos, precio_gramos, created_date, modified_date, created_by, modified_by) VALUES (80, 3, 15, 45, 0.849999999999999978, 38.25, '2016-09-01', '2016-09-01', 1, 1);
INSERT INTO dieta_detalle (id, id_dieta, id_alimento, cantidad_gramos, costo_gramos, precio_gramos, created_date, modified_date, created_by, modified_by) VALUES (507, 6, 1, 111.299999999999997, 5, 556.5, '2016-09-02', '2016-09-02', 1, 1);
INSERT INTO dieta_detalle (id, id_dieta, id_alimento, cantidad_gramos, costo_gramos, precio_gramos, created_date, modified_date, created_by, modified_by) VALUES (386, 7, 6, 111.299999999999997, 1.5, 166.949999999999989, '2016-09-02', '2016-09-02', 1, 1);
INSERT INTO dieta_detalle (id, id_dieta, id_alimento, cantidad_gramos, costo_gramos, precio_gramos, created_date, modified_date, created_by, modified_by) VALUES (387, 7, 18, 4.76999999999999957, 0.900000000000000022, 4.29300000000000015, '2016-09-02', '2016-09-02', 1, 1);
INSERT INTO dieta_detalle (id, id_dieta, id_alimento, cantidad_gramos, costo_gramos, precio_gramos, created_date, modified_date, created_by, modified_by) VALUES (388, 7, 8, 4.76999999999999957, 6, 28.620000000000001, '2016-09-02', '2016-09-02', 1, 1);
INSERT INTO dieta_detalle (id, id_dieta, id_alimento, cantidad_gramos, costo_gramos, precio_gramos, created_date, modified_date, created_by, modified_by) VALUES (96, 1, 2, 111.299999999999997, 3.5, 389.550000000000011, '2016-09-01', '2016-09-01', 1, 1);
INSERT INTO dieta_detalle (id, id_dieta, id_alimento, cantidad_gramos, costo_gramos, precio_gramos, created_date, modified_date, created_by, modified_by) VALUES (97, 1, 19, 23.8500000000000014, 0.900000000000000022, 21.4649999999999999, '2016-09-01', '2016-09-01', 1, 1);
INSERT INTO dieta_detalle (id, id_dieta, id_alimento, cantidad_gramos, costo_gramos, precio_gramos, created_date, modified_date, created_by, modified_by) VALUES (98, 1, 13, 23.8500000000000014, 0.849999999999999978, 20.2725000000000009, '2016-09-01', '2016-09-01', 1, 1);
INSERT INTO dieta_detalle (id, id_dieta, id_alimento, cantidad_gramos, costo_gramos, precio_gramos, created_date, modified_date, created_by, modified_by) VALUES (389, 7, 9, 4.76999999999999957, 6, 28.620000000000001, '2016-09-02', '2016-09-02', 1, 1);
INSERT INTO dieta_detalle (id, id_dieta, id_alimento, cantidad_gramos, costo_gramos, precio_gramos, created_date, modified_date, created_by, modified_by) VALUES (390, 7, 21, 4.76999999999999957, 4.16999999999999993, 19.8908999999999985, '2016-09-02', '2016-09-02', 1, 1);
INSERT INTO dieta_detalle (id, id_dieta, id_alimento, cantidad_gramos, costo_gramos, precio_gramos, created_date, modified_date, created_by, modified_by) VALUES (391, 7, 20, 4.76999999999999957, 1.30000000000000004, 6.20099999999999962, '2016-09-02', '2016-09-02', 1, 1);
INSERT INTO dieta_detalle (id, id_dieta, id_alimento, cantidad_gramos, costo_gramos, precio_gramos, created_date, modified_date, created_by, modified_by) VALUES (392, 7, 19, 4.76999999999999957, 0.900000000000000022, 4.29300000000000015, '2016-09-02', '2016-09-02', 1, 1);
INSERT INTO dieta_detalle (id, id_dieta, id_alimento, cantidad_gramos, costo_gramos, precio_gramos, created_date, modified_date, created_by, modified_by) VALUES (393, 7, 13, 4.76999999999999957, 0.849999999999999978, 4.05449999999999999, '2016-09-02', '2016-09-02', 1, 1);
INSERT INTO dieta_detalle (id, id_dieta, id_alimento, cantidad_gramos, costo_gramos, precio_gramos, created_date, modified_date, created_by, modified_by) VALUES (523, 4, 2, 111.299999999999997, 3.5, 389.550000000000011, '2016-09-02', '2016-09-02', 1, 1);
INSERT INTO dieta_detalle (id, id_dieta, id_alimento, cantidad_gramos, costo_gramos, precio_gramos, created_date, modified_date, created_by, modified_by) VALUES (524, 4, 20, 23.8500000000000014, 1.30000000000000004, 31.004999999999999, '2016-09-02', '2016-09-02', 1, 1);
INSERT INTO dieta_detalle (id, id_dieta, id_alimento, cantidad_gramos, costo_gramos, precio_gramos, created_date, modified_date, created_by, modified_by) VALUES (525, 4, 11, 23.8500000000000014, 0.699999999999999956, 16.6950000000000003, '2016-09-02', '2016-09-02', 1, 1);
INSERT INTO dieta_detalle (id, id_dieta, id_alimento, cantidad_gramos, costo_gramos, precio_gramos, created_date, modified_date, created_by, modified_by) VALUES (526, 8, 2, 210, 3.5, 735, '2016-09-02', '2016-09-02', 1, 1);
INSERT INTO dieta_detalle (id, id_dieta, id_alimento, cantidad_gramos, costo_gramos, precio_gramos, created_date, modified_date, created_by, modified_by) VALUES (527, 8, 5, 45, 0.0599999999999999978, 2.70000000000000018, '2016-09-02', '2016-09-02', 1, 1);
INSERT INTO dieta_detalle (id, id_dieta, id_alimento, cantidad_gramos, costo_gramos, precio_gramos, created_date, modified_date, created_by, modified_by) VALUES (528, 8, 12, 45, 0.849999999999999978, 38.25, '2016-09-02', '2016-09-02', 1, 1);
INSERT INTO dieta_detalle (id, id_dieta, id_alimento, cantidad_gramos, costo_gramos, precio_gramos, created_date, modified_date, created_by, modified_by) VALUES (532, 9, 1, 350, 5, 1750, '2016-09-02', '2016-09-02', 2, 2);
INSERT INTO dieta_detalle (id, id_dieta, id_alimento, cantidad_gramos, costo_gramos, precio_gramos, created_date, modified_date, created_by, modified_by) VALUES (533, 9, 12, 75, 0.849999999999999978, 63.75, '2016-09-02', '2016-09-02', 2, 2);
INSERT INTO dieta_detalle (id, id_dieta, id_alimento, cantidad_gramos, costo_gramos, precio_gramos, created_date, modified_date, created_by, modified_by) VALUES (534, 9, 11, 75, 0.699999999999999956, 52.5, '2016-09-02', '2016-09-02', 2, 2);


--
-- TOC entry 2117 (class 0 OID 0)
-- Dependencies: 167
-- Name: dieta_detalle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('dieta_detalle_id_seq', 534, true);


--
-- TOC entry 2118 (class 0 OID 0)
-- Dependencies: 168
-- Name: dieta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('dieta_id_seq', 9, true);


--
-- TOC entry 2119 (class 0 OID 0)
-- Dependencies: 169
-- Name: divisa_id_divisa_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('divisa_id_divisa_pk_seq', 1, false);


--
-- TOC entry 2059 (class 0 OID 64047)
-- Dependencies: 170 2088
-- Data for Name: edad_mascota; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO edad_mascota (id, tipo, descripcion, edad_desde, edad_hasta) VALUES (1, 'Cachorro A', '2-6 Meses', 0.200000000000000011, 0.599999999999999978);
INSERT INTO edad_mascota (id, tipo, descripcion, edad_desde, edad_hasta) VALUES (2, 'Cachorro B', '6-12 Meses', 0.599999999999999978, 1);
INSERT INTO edad_mascota (id, tipo, descripcion, edad_desde, edad_hasta) VALUES (5, 'Adulto Sedentario', '1 Año+', 1, 25);
INSERT INTO edad_mascota (id, tipo, descripcion, edad_desde, edad_hasta) VALUES (6, 'Adulto Esterilizado', '1 Año+', 1, 25);
INSERT INTO edad_mascota (id, tipo, descripcion, edad_desde, edad_hasta) VALUES (3, 'Adulto Activo', '1 Año+', 1, 25);
INSERT INTO edad_mascota (id, tipo, descripcion, edad_desde, edad_hasta) VALUES (4, 'Adulto Normal', '1 Año+', 1, 25);


--
-- TOC entry 2120 (class 0 OID 0)
-- Dependencies: 171
-- Name: edad_mascota_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('edad_mascota_id_seq', 1, false);


--
-- TOC entry 2087 (class 0 OID 64552)
-- Dependencies: 198 2088
-- Data for Name: entrada_almacen; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO entrada_almacen (id, fecha, observacion) VALUES (4, '2016-09-01', 'entrada 1 sep');
INSERT INTO entrada_almacen (id, fecha, observacion) VALUES (2, '2016-08-15', 'Inventario de entrada ');


--
-- TOC entry 2121 (class 0 OID 0)
-- Dependencies: 197
-- Name: entrada_almacen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('entrada_almacen_id_seq', 4, true);


--
-- TOC entry 2061 (class 0 OID 64052)
-- Dependencies: 172 2088
-- Data for Name: mascota; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO mascota (id_mascota, id_cliente, nombre, tipo, raza, fecha_nacimiento, edad, clasificacion, sexo, color, esterilizado, longitud, longitud_medida, peso, peso_medida, foto, observacion, created_date, modified_date, created_by, modified_by) VALUES (1, 1, 'Molly', 1, 210, '2015-05-15', 1, 3, 3, 'típico, plateado con marron', 2, 25, 2, 3.5, 1, '', 'Le encanta la zanahoria', '2016-08-18', '2016-08-27', 1, 1);
INSERT INTO mascota (id_mascota, id_cliente, nombre, tipo, raza, fecha_nacimiento, edad, clasificacion, sexo, color, esterilizado, longitud, longitud_medida, peso, peso_medida, foto, observacion, created_date, modified_date, created_by, modified_by) VALUES (2, 3, 'Rabito', 1, 82, '2013-03-08', 36, 4, 4, 'negro con marron', 2, 25, 2, 20, 1, '', '', '2016-09-01', '2016-09-01', 1, 1);
INSERT INTO mascota (id_mascota, id_cliente, nombre, tipo, raza, fecha_nacimiento, edad, clasificacion, sexo, color, esterilizado, longitud, longitud_medida, peso, peso_medida, foto, observacion, created_date, modified_date, created_by, modified_by) VALUES (3, 2, 'Ceniza', 1, 151, '2015-09-16', 11, 5, 3, 'gris', 2, 100, 2, 15, 1, '', '', '2016-09-01', '2016-09-01', 1, 1);
INSERT INTO mascota (id_mascota, id_cliente, nombre, tipo, raza, fecha_nacimiento, edad, clasificacion, sexo, color, esterilizado, longitud, longitud_medida, peso, peso_medida, foto, observacion, created_date, modified_date, created_by, modified_by) VALUES (4, 1, 'Ceniza', 1, 151, '2013-09-05', 35, 5, 3, 'gris', 2, 35, 2, 13, 1, '', '', '2016-09-02', '2016-09-02', 1, 1);


--
-- TOC entry 2122 (class 0 OID 0)
-- Dependencies: 173
-- Name: mascota_id_mascota_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('mascota_id_mascota_seq', 4, true);


--
-- TOC entry 2063 (class 0 OID 64060)
-- Dependencies: 174 2088
-- Data for Name: perfil; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO perfil (id, nombre_perfil) VALUES (1, 'Administrador');
INSERT INTO perfil (id, nombre_perfil) VALUES (2, 'Basico');


--
-- TOC entry 2123 (class 0 OID 0)
-- Dependencies: 175
-- Name: perfil_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('perfil_id_seq', 2, true);


--
-- TOC entry 2065 (class 0 OID 64065)
-- Dependencies: 176 2088
-- Data for Name: peso_mascota; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO peso_mascota (id, cantidad, medida, unidad_medida, cantidad_hasta) VALUES (1, 1, 'KG', 1, 5);
INSERT INTO peso_mascota (id, cantidad, medida, unidad_medida, cantidad_hasta) VALUES (2, 5, 'KG', 1, 10);
INSERT INTO peso_mascota (id, cantidad, medida, unidad_medida, cantidad_hasta) VALUES (3, 10, 'KG', 1, 15);
INSERT INTO peso_mascota (id, cantidad, medida, unidad_medida, cantidad_hasta) VALUES (4, 15, 'KG', 1, 20);
INSERT INTO peso_mascota (id, cantidad, medida, unidad_medida, cantidad_hasta) VALUES (5, 20, 'KG', 1, 25);
INSERT INTO peso_mascota (id, cantidad, medida, unidad_medida, cantidad_hasta) VALUES (6, 25, 'KG', 1, 30);
INSERT INTO peso_mascota (id, cantidad, medida, unidad_medida, cantidad_hasta) VALUES (7, 30, 'KG', 1, 35);
INSERT INTO peso_mascota (id, cantidad, medida, unidad_medida, cantidad_hasta) VALUES (8, 35, 'KG', 1, 40);
INSERT INTO peso_mascota (id, cantidad, medida, unidad_medida, cantidad_hasta) VALUES (9, 40, 'KG', 1, 45);
INSERT INTO peso_mascota (id, cantidad, medida, unidad_medida, cantidad_hasta) VALUES (10, 45, 'KG', 1, 50);
INSERT INTO peso_mascota (id, cantidad, medida, unidad_medida, cantidad_hasta) VALUES (11, 50, 'KG', 1, 75);


--
-- TOC entry 2124 (class 0 OID 0)
-- Dependencies: 177
-- Name: peso_mascota_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('peso_mascota_id_seq', 1, false);


--
-- TOC entry 2067 (class 0 OID 64070)
-- Dependencies: 178 2088
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
-- TOC entry 2125 (class 0 OID 0)
-- Dependencies: 179
-- Name: porcion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('porcion_id_seq', 1, false);


--
-- TOC entry 2069 (class 0 OID 64075)
-- Dependencies: 180 2088
-- Data for Name: precio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO precio (id, id_alimento, precio, fecha, cantidad, precio_venta, fecha_vencimiento, id_entrada_almacen) VALUES (4, 4, 1500, '2016-08-15', 1, 1500, '2016-09-15', 2);
INSERT INTO precio (id, id_alimento, precio, fecha, cantidad, precio_venta, fecha_vencimiento, id_entrada_almacen) VALUES (5, 5, 60, '2016-08-15', 1, 60, '2016-09-15', 2);
INSERT INTO precio (id, id_alimento, precio, fecha, cantidad, precio_venta, fecha_vencimiento, id_entrada_almacen) VALUES (6, 6, 1500, '2016-08-15', 1, 1500, '2016-09-15', 2);
INSERT INTO precio (id, id_alimento, precio, fecha, cantidad, precio_venta, fecha_vencimiento, id_entrada_almacen) VALUES (7, 7, 100, '2016-08-15', 1, 100, '2016-09-15', 2);
INSERT INTO precio (id, id_alimento, precio, fecha, cantidad, precio_venta, fecha_vencimiento, id_entrada_almacen) VALUES (8, 8, 6000, '2016-08-15', 1, 6000, '2016-09-15', 2);
INSERT INTO precio (id, id_alimento, precio, fecha, cantidad, precio_venta, fecha_vencimiento, id_entrada_almacen) VALUES (9, 9, 6000, '2016-08-15', 1, 6000, '2016-09-15', 2);
INSERT INTO precio (id, id_alimento, precio, fecha, cantidad, precio_venta, fecha_vencimiento, id_entrada_almacen) VALUES (10, 11, 700, '2016-08-15', 1, 700, '2016-09-15', 2);
INSERT INTO precio (id, id_alimento, precio, fecha, cantidad, precio_venta, fecha_vencimiento, id_entrada_almacen) VALUES (11, 13, 850, '2016-08-15', 1, 850, '2016-09-15', 2);
INSERT INTO precio (id, id_alimento, precio, fecha, cantidad, precio_venta, fecha_vencimiento, id_entrada_almacen) VALUES (13, 15, 850, '2016-08-15', 1, 850, '2016-09-15', 2);
INSERT INTO precio (id, id_alimento, precio, fecha, cantidad, precio_venta, fecha_vencimiento, id_entrada_almacen) VALUES (14, 16, 1300, '2016-08-15', 1, 1300, '2016-09-15', 2);
INSERT INTO precio (id, id_alimento, precio, fecha, cantidad, precio_venta, fecha_vencimiento, id_entrada_almacen) VALUES (15, 17, 850, '2016-08-15', 1, 850, '2016-09-15', 2);
INSERT INTO precio (id, id_alimento, precio, fecha, cantidad, precio_venta, fecha_vencimiento, id_entrada_almacen) VALUES (16, 18, 900, '2016-08-15', 1, 900, '2016-09-15', 2);
INSERT INTO precio (id, id_alimento, precio, fecha, cantidad, precio_venta, fecha_vencimiento, id_entrada_almacen) VALUES (17, 19, 900, '2016-08-15', 1, 900, '2016-09-15', 2);
INSERT INTO precio (id, id_alimento, precio, fecha, cantidad, precio_venta, fecha_vencimiento, id_entrada_almacen) VALUES (18, 20, 1300, '2016-08-15', 1, 1300, '2016-09-15', 2);
INSERT INTO precio (id, id_alimento, precio, fecha, cantidad, precio_venta, fecha_vencimiento, id_entrada_almacen) VALUES (1, 1, 5000, '2016-08-15', 1, 5000, '2016-09-15', 2);
INSERT INTO precio (id, id_alimento, precio, fecha, cantidad, precio_venta, fecha_vencimiento, id_entrada_almacen) VALUES (2, 2, 2500, '2016-08-15', 1, 2500, '2016-09-15', 2);
INSERT INTO precio (id, id_alimento, precio, fecha, cantidad, precio_venta, fecha_vencimiento, id_entrada_almacen) VALUES (12, 12, 850, '2016-08-15', 1, 850, '2016-09-15', 2);
INSERT INTO precio (id, id_alimento, precio, fecha, cantidad, precio_venta, fecha_vencimiento, id_entrada_almacen) VALUES (3, 3, 500, '2016-08-15', 1, 500, '2016-09-15', 2);
INSERT INTO precio (id, id_alimento, precio, fecha, cantidad, precio_venta, fecha_vencimiento, id_entrada_almacen) VALUES (19, 21, 4166, '2016-08-15', 1, 4166, '2016-09-15', 2);
INSERT INTO precio (id, id_alimento, precio, fecha, cantidad, precio_venta, fecha_vencimiento, id_entrada_almacen) VALUES (24, 2, 2800, '2016-09-01', 20, 3500, '2016-10-27', 4);


--
-- TOC entry 2126 (class 0 OID 0)
-- Dependencies: 181
-- Name: precio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('precio_id_seq', 24, true);


--
-- TOC entry 2071 (class 0 OID 64080)
-- Dependencies: 182 2088
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
-- TOC entry 2127 (class 0 OID 0)
-- Dependencies: 183
-- Name: raza_mascota_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('raza_mascota_id_seq', 1, false);


--
-- TOC entry 2073 (class 0 OID 64085)
-- Dependencies: 184 2088
-- Data for Name: sexo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO sexo (id, descripcion) VALUES (1, 'Femenino');
INSERT INTO sexo (id, descripcion) VALUES (2, 'Masculino');
INSERT INTO sexo (id, descripcion) VALUES (3, 'Hembra');
INSERT INTO sexo (id, descripcion) VALUES (4, 'Macho');


--
-- TOC entry 2128 (class 0 OID 0)
-- Dependencies: 185
-- Name: sexo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sexo_id_seq', 4, true);


--
-- TOC entry 2075 (class 0 OID 64090)
-- Dependencies: 186 2088
-- Data for Name: si_no; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO si_no (id, descripcion) VALUES (1, 'SI');
INSERT INTO si_no (id, descripcion) VALUES (2, 'NO');


--
-- TOC entry 2129 (class 0 OID 0)
-- Dependencies: 187
-- Name: si_no_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('si_no_id_seq', 2, true);


--
-- TOC entry 2130 (class 0 OID 0)
-- Dependencies: 188
-- Name: tbl_contratista_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tbl_contratista_id_seq', 1, false);


--
-- TOC entry 2078 (class 0 OID 64115)
-- Dependencies: 189 2088
-- Data for Name: tipo_alimento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tipo_alimento (id, descripcion) VALUES (1, 'Proteína');
INSERT INTO tipo_alimento (id, descripcion) VALUES (2, 'Vegetal');
INSERT INTO tipo_alimento (id, descripcion) VALUES (3, 'Grasa');
INSERT INTO tipo_alimento (id, descripcion) VALUES (4, 'Complemento');
INSERT INTO tipo_alimento (id, descripcion) VALUES (5, 'Fruta');


--
-- TOC entry 2131 (class 0 OID 0)
-- Dependencies: 190
-- Name: tipo_alimento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipo_alimento_id_seq', 6, true);


--
-- TOC entry 2080 (class 0 OID 64120)
-- Dependencies: 191 2088
-- Data for Name: tipo_mascota; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tipo_mascota (id, descripcion) VALUES (1, 'Perro');


--
-- TOC entry 2132 (class 0 OID 0)
-- Dependencies: 192
-- Name: tipo_mascota_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipo_mascota_id_seq', 1, true);


--
-- TOC entry 2082 (class 0 OID 64125)
-- Dependencies: 193 2088
-- Data for Name: unidad_medida; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO unidad_medida (id, descripcion, descripcion_completa, tipo) VALUES (1, 'KG', 'Kilogramo', 'peso');
INSERT INTO unidad_medida (id, descripcion, descripcion_completa, tipo) VALUES (2, 'CM', 'Centimetro', 'longitud');
INSERT INTO unidad_medida (id, descripcion, descripcion_completa, tipo) VALUES (3, 'GR', 'Gramo', 'peso');


--
-- TOC entry 2133 (class 0 OID 0)
-- Dependencies: 194
-- Name: unidad_medida_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('unidad_medida_id_seq', 2, true);


--
-- TOC entry 2084 (class 0 OID 64130)
-- Dependencies: 195 2088
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usuario (id, username, password, blnborrado, created_date, modified_date, created_by, modified_by, id_perfil, str_nombre, str_apellido, int_cedula) VALUES (3, 'usuario', 'f8032d5cae3de20fcec887f395ec9a6a', false, '2016-08-13', '2016-08-13', 1, 1, 2, 'usuario', '', NULL);
INSERT INTO usuario (id, username, password, blnborrado, created_date, modified_date, created_by, modified_by, id_perfil, str_nombre, str_apellido, int_cedula) VALUES (2, 'admin', '21232f297a57a5a743894a0e4a801fc3', false, '2016-08-13', '2016-08-13', 1, 1, 1, 'Admin', '', NULL);
INSERT INTO usuario (id, username, password, blnborrado, created_date, modified_date, created_by, modified_by, id_perfil, str_nombre, str_apellido, int_cedula) VALUES (1, 'jirojas', '53a95281bf80b66231f952510f0a55d2', false, '2013-04-08', '2016-09-01', 1, 1, 1, 'Jiuly', 'Rojas Delgado', 18043559);


--
-- TOC entry 2134 (class 0 OID 0)
-- Dependencies: 196
-- Name: usuario_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuario_id_seq1', 4, true);


--
-- TOC entry 1901 (class 2606 OID 64166)
-- Dependencies: 161 161 2089
-- Name: alimento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY alimento
    ADD CONSTRAINT alimento_pkey PRIMARY KEY (id);


--
-- TOC entry 1903 (class 2606 OID 64168)
-- Dependencies: 163 163 2089
-- Name: cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);


--
-- TOC entry 1907 (class 2606 OID 64170)
-- Dependencies: 166 166 2089
-- Name: dieta_detalle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY dieta_detalle
    ADD CONSTRAINT dieta_detalle_pkey PRIMARY KEY (id);


--
-- TOC entry 1905 (class 2606 OID 64172)
-- Dependencies: 165 165 2089
-- Name: dieta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY dieta
    ADD CONSTRAINT dieta_pkey PRIMARY KEY (id);


--
-- TOC entry 1909 (class 2606 OID 64174)
-- Dependencies: 170 170 2089
-- Name: edad_mascota_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY edad_mascota
    ADD CONSTRAINT edad_mascota_pkey PRIMARY KEY (id);


--
-- TOC entry 1935 (class 2606 OID 64560)
-- Dependencies: 198 198 2089
-- Name: entrada_almacen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY entrada_almacen
    ADD CONSTRAINT entrada_almacen_pkey PRIMARY KEY (id);


--
-- TOC entry 1911 (class 2606 OID 64176)
-- Dependencies: 172 172 2089
-- Name: mascota_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mascota
    ADD CONSTRAINT mascota_pkey PRIMARY KEY (id_mascota);


--
-- TOC entry 1913 (class 2606 OID 64178)
-- Dependencies: 174 174 2089
-- Name: perfiles; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY perfil
    ADD CONSTRAINT perfiles PRIMARY KEY (id);


--
-- TOC entry 1915 (class 2606 OID 64180)
-- Dependencies: 176 176 2089
-- Name: peso_mascota_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY peso_mascota
    ADD CONSTRAINT peso_mascota_pkey PRIMARY KEY (id);


--
-- TOC entry 1917 (class 2606 OID 64182)
-- Dependencies: 178 178 2089
-- Name: porcion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY porcion
    ADD CONSTRAINT porcion_pkey PRIMARY KEY (id);


--
-- TOC entry 1919 (class 2606 OID 64184)
-- Dependencies: 180 180 2089
-- Name: precio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY precio
    ADD CONSTRAINT precio_pkey PRIMARY KEY (id);


--
-- TOC entry 1921 (class 2606 OID 64186)
-- Dependencies: 182 182 2089
-- Name: raza_mascota_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY raza_mascota
    ADD CONSTRAINT raza_mascota_pkey PRIMARY KEY (id);


--
-- TOC entry 1923 (class 2606 OID 64188)
-- Dependencies: 184 184 2089
-- Name: sexo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sexo
    ADD CONSTRAINT sexo_pkey PRIMARY KEY (id);


--
-- TOC entry 1925 (class 2606 OID 64190)
-- Dependencies: 186 186 2089
-- Name: si_no_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY si_no
    ADD CONSTRAINT si_no_pkey PRIMARY KEY (id);


--
-- TOC entry 1927 (class 2606 OID 64200)
-- Dependencies: 189 189 2089
-- Name: tipo_alimento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_alimento
    ADD CONSTRAINT tipo_alimento_pkey PRIMARY KEY (id);


--
-- TOC entry 1929 (class 2606 OID 64202)
-- Dependencies: 191 191 2089
-- Name: tipo_mascota_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_mascota
    ADD CONSTRAINT tipo_mascota_pkey PRIMARY KEY (id);


--
-- TOC entry 1931 (class 2606 OID 64204)
-- Dependencies: 193 193 2089
-- Name: unidad_medida_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY unidad_medida
    ADD CONSTRAINT unidad_medida_pkey PRIMARY KEY (id);


--
-- TOC entry 1933 (class 2606 OID 64206)
-- Dependencies: 195 195 2089
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 1936 (class 2606 OID 74731)
-- Dependencies: 189 1926 161 2089
-- Name: alimento_tipo_alimento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alimento
    ADD CONSTRAINT alimento_tipo_alimento_fkey FOREIGN KEY (tipo_alimento) REFERENCES tipo_alimento(id);


--
-- TOC entry 1937 (class 2606 OID 64227)
-- Dependencies: 165 163 1902 2089
-- Name: dieta_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dieta
    ADD CONSTRAINT dieta_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES cliente(id);


--
-- TOC entry 1938 (class 2606 OID 64232)
-- Dependencies: 1910 165 172 2089
-- Name: dieta_id_mascota_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dieta
    ADD CONSTRAINT dieta_id_mascota_fkey FOREIGN KEY (id_mascota) REFERENCES mascota(id_mascota);


--
-- TOC entry 1939 (class 2606 OID 64237)
-- Dependencies: 172 163 1902 2089
-- Name: mascota_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mascota
    ADD CONSTRAINT mascota_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES cliente(id);


--
-- TOC entry 1940 (class 2606 OID 82900)
-- Dependencies: 193 176 1930 2089
-- Name: peso_mascota_unidad_medida_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY peso_mascota
    ADD CONSTRAINT peso_mascota_unidad_medida_fkey FOREIGN KEY (unidad_medida) REFERENCES unidad_medida(id);


--
-- TOC entry 1941 (class 2606 OID 64247)
-- Dependencies: 1908 178 170 2089
-- Name: porcion_id_edad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY porcion
    ADD CONSTRAINT porcion_id_edad_fkey FOREIGN KEY (id_edad) REFERENCES edad_mascota(id);


--
-- TOC entry 1942 (class 2606 OID 64252)
-- Dependencies: 176 1914 178 2089
-- Name: porcion_id_peso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY porcion
    ADD CONSTRAINT porcion_id_peso_fkey FOREIGN KEY (id_peso) REFERENCES peso_mascota(id);


--
-- TOC entry 1943 (class 2606 OID 74721)
-- Dependencies: 161 1900 180 2089
-- Name: precio_id_alimento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY precio
    ADD CONSTRAINT precio_id_alimento_fkey FOREIGN KEY (id_alimento) REFERENCES alimento(id);


--
-- TOC entry 1944 (class 2606 OID 64262)
-- Dependencies: 191 182 1928 2089
-- Name: raza_mascota_id_tipo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY raza_mascota
    ADD CONSTRAINT raza_mascota_id_tipo_fkey FOREIGN KEY (id_tipo) REFERENCES tipo_mascota(id);


--
-- TOC entry 2094 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-09-02 21:53:01 VET

--
-- PostgreSQL database dump complete
--

