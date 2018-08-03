-- Table: factura

-- DROP TABLE factura;

CREATE TABLE factura
(
  id_factura serial,
  fecha date,
  tipo_pago integer,
  nombre character varying(80),
  rif integer,
  domicilio text,
  telefono text,
  cantidad double precision,
  descripcion character varying(30),
  precio double precision,
  cantidadp double precision,
  descripcionp character varying(30),
  preciop double precision,
  porcentaje integer,
  subtotal double precision,
  iva double precision,
  total double precision,
  estatus integer DEFAULT 1,
  id_dieta integer,
  CONSTRAINT factura_pkey PRIMARY KEY (id_factura )
)
WITH (
  OIDS=FALSE
);
ALTER TABLE factura
  OWNER TO postgres;


--tipo pago


CREATE TABLE tipopago (
    id integer NOT NULL,
    descripcion character varying(20)
);


ALTER TABLE public.tipopago OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 140249)
-- Dependencies: 6 211
-- Name: tipopago_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipopago_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipopago_id_seq OWNER TO postgres;

--
-- TOC entry 2004 (class 0 OID 0)
-- Dependencies: 210
-- Name: tipopago_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipopago_id_seq OWNED BY tipopago.id;


--
-- TOC entry 1890 (class 2604 OID 140254)
-- Dependencies: 210 211 211
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipopago ALTER COLUMN id SET DEFAULT nextval('tipopago_id_seq'::regclass);


--
-- TOC entry 1999 (class 0 OID 140251)
-- Dependencies: 211 2000
-- Data for Name: tipopago; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tipopago (id, descripcion) VALUES (1, 'Efectivo');
INSERT INTO tipopago (id, descripcion) VALUES (2, 'Cheque');
INSERT INTO tipopago (id, descripcion) VALUES (3, 'Tarjeta debito');
INSERT INTO tipopago (id, descripcion) VALUES (4, 'Tarjeta credito');
INSERT INTO tipopago (id, descripcion) VALUES (5, 'Transferencia');


--
-- TOC entry 2005 (class 0 OID 0)
-- Dependencies: 210
-- Name: tipopago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipopago_id_seq', 5, true);


--
-- TOC entry 1892 (class 2606 OID 140256)
-- Dependencies: 211 211 2001
-- Name: tipopago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipopago
    ADD CONSTRAINT tipopago_pkey PRIMARY KEY (id);


-- Completed on 2016-10-23 23:27:06 VET

--
-- PostgreSQL database dump complete
--


--estatus factura

--
-- TOC entry 213 (class 1259 OID 148434)
-- Dependencies: 6
-- Name: estatusfactura; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estatusfactura (
    id integer NOT NULL,
    descripcion character varying(30)
);


ALTER TABLE public.estatusfactura OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 148432)
-- Dependencies: 6 213
-- Name: estatusfactura_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estatusfactura_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estatusfactura_id_seq OWNER TO postgres;

--
-- TOC entry 2004 (class 0 OID 0)
-- Dependencies: 212
-- Name: estatusfactura_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estatusfactura_id_seq OWNED BY estatusfactura.id;


--
-- TOC entry 1890 (class 2604 OID 148437)
-- Dependencies: 212 213 213
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estatusfactura ALTER COLUMN id SET DEFAULT nextval('estatusfactura_id_seq'::regclass);


--
-- TOC entry 1999 (class 0 OID 148434)
-- Dependencies: 213 2000
-- Data for Name: estatusfactura; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO estatusfactura (id, descripcion) VALUES (0, 'Anulada');
INSERT INTO estatusfactura (id, descripcion) VALUES (1, 'Activa');


--
-- TOC entry 2005 (class 0 OID 0)
-- Dependencies: 212
-- Name: estatusfactura_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estatusfactura_id_seq', 2, true);


--
-- TOC entry 1892 (class 2606 OID 148439)
-- Dependencies: 213 213 2001
-- Name: estatusfactura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estatusfactura
    ADD CONSTRAINT estatusfactura_pkey PRIMARY KEY (id);


-- Completed on 2016-10-23 23:28:17 VET

--
-- PostgreSQL database dump complete
--


--cambiar tipo de campo rif

ALTER TABLE factura alter column rif type character varying;
