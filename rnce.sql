--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.2
-- Dumped by pg_dump version 9.3.2
-- Started on 2015-04-03 00:54:26

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 7 (class 2615 OID 411408)
-- Name: activos; Type: SCHEMA; Schema: -; Owner: eureka
--

CREATE SCHEMA activos;


ALTER SCHEMA activos OWNER TO eureka;

--
-- TOC entry 8 (class 2615 OID 411409)
-- Name: cuentas; Type: SCHEMA; Schema: -; Owner: eureka
--

CREATE SCHEMA cuentas;


ALTER SCHEMA cuentas OWNER TO eureka;

--
-- TOC entry 220 (class 3079 OID 11750)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2309 (class 0 OID 0)
-- Dependencies: 220
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = activos, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 211 (class 1259 OID 411698)
-- Name: bienes; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE bienes (
    id integer NOT NULL,
    sys_tipo_bien_id integer NOT NULL,
    principio_contable integer NOT NULL,
    depreciable boolean DEFAULT true NOT NULL,
    deterioro boolean DEFAULT true NOT NULL,
    detalle character varying(255),
    origen character varying(255) NOT NULL,
    fecha_origen date NOT NULL,
    contratista_id integer NOT NULL
);


ALTER TABLE activos.bienes OWNER TO eureka;

--
-- TOC entry 2310 (class 0 OID 0)
-- Dependencies: 211
-- Name: TABLE bienes; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE bienes IS 'Tabla donde se almacenan los bienes que posee la empresa';


--
-- TOC entry 2311 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN bienes.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN bienes.id IS 'Clave primaria';


--
-- TOC entry 2312 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN bienes.sys_tipo_bien_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN bienes.sys_tipo_bien_id IS 'Clave foranea a la tabla sys_tipo_bien';


--
-- TOC entry 2313 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN bienes.principio_contable; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN bienes.principio_contable IS 'Principio contable que aplica para el bien';


--
-- TOC entry 2314 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN bienes.depreciable; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN bienes.depreciable IS 'Si el bien es depreciable o no';


--
-- TOC entry 2315 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN bienes.deterioro; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN bienes.deterioro IS 'Si el bien tiene deterioro o no';


--
-- TOC entry 2316 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN bienes.detalle; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN bienes.detalle IS 'Descripcion complementaria';


--
-- TOC entry 2317 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN bienes.origen; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN bienes.origen IS 'Origen del bien';


--
-- TOC entry 2318 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN bienes.fecha_origen; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN bienes.fecha_origen IS 'Fecha de la adquisicion del bien';


--
-- TOC entry 2319 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN bienes.contratista_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN bienes.contratista_id IS 'Clave foranea al contratista';


--
-- TOC entry 210 (class 1259 OID 411696)
-- Name: bienes_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE bienes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.bienes_id_seq OWNER TO eureka;

--
-- TOC entry 2320 (class 0 OID 0)
-- Dependencies: 210
-- Name: bienes_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE bienes_id_seq OWNED BY bienes.id;


--
-- TOC entry 213 (class 1259 OID 411721)
-- Name: datos_importacion; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE datos_importacion (
    id integer NOT NULL,
    bien_id integer NOT NULL,
    num_guia_nac character varying(100) NOT NULL,
    pais_origen character varying(250) NOT NULL,
    costo_adquisicion numeric(38,6) NOT NULL,
    gastos_mon_extranjera numeric(38,6) NOT NULL,
    sys_moneda_id integer NOT NULL,
    tasa_cambio numeric(38,6) NOT NULL,
    gastos_imp_nacional numeric(38,6) NOT NULL,
    otros_costros_imp_instalacion numeric(38,6) NOT NULL,
    total_costo_adquisicion numeric(38,6) NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_fecha time with time zone DEFAULT now()
);


ALTER TABLE activos.datos_importacion OWNER TO eureka;

--
-- TOC entry 2321 (class 0 OID 0)
-- Dependencies: 213
-- Name: TABLE datos_importacion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE datos_importacion IS 'Tabla que lleva adquisicion / Imporatada';


--
-- TOC entry 2322 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN datos_importacion.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN datos_importacion.id IS 'Clave primaria';


--
-- TOC entry 2323 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN datos_importacion.bien_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN datos_importacion.bien_id IS 'Clave foranea a la tabla Bienes';


--
-- TOC entry 2324 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN datos_importacion.num_guia_nac; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN datos_importacion.num_guia_nac IS 'Numero de guia nacionalizacion';


--
-- TOC entry 2325 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN datos_importacion.pais_origen; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN datos_importacion.pais_origen IS 'Pais de origen de la importacion';


--
-- TOC entry 2326 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN datos_importacion.costo_adquisicion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN datos_importacion.costo_adquisicion IS 'Costo de la adquisicion';


--
-- TOC entry 2327 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN datos_importacion.gastos_mon_extranjera; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN datos_importacion.gastos_mon_extranjera IS 'Gastos en moneda extranjera';


--
-- TOC entry 2328 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN datos_importacion.sys_moneda_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN datos_importacion.sys_moneda_id IS 'Clave foranea a la tabla Sys_monedas';


--
-- TOC entry 2329 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN datos_importacion.tasa_cambio; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN datos_importacion.tasa_cambio IS 'Tasa de cambio al momento de la compra';


--
-- TOC entry 2330 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN datos_importacion.otros_costros_imp_instalacion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN datos_importacion.otros_costros_imp_instalacion IS 'Otros gastos importacion';


--
-- TOC entry 2331 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN datos_importacion.total_costo_adquisicion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN datos_importacion.total_costo_adquisicion IS 'Total de costo de la adquisicion';


--
-- TOC entry 2332 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN datos_importacion.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN datos_importacion.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 212 (class 1259 OID 411719)
-- Name: datos_importacion_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE datos_importacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.datos_importacion_id_seq OWNER TO eureka;

--
-- TOC entry 2333 (class 0 OID 0)
-- Dependencies: 212
-- Name: datos_importacion_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE datos_importacion_id_seq OWNED BY datos_importacion.id;


--
-- TOC entry 215 (class 1259 OID 411741)
-- Name: inmuebles; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE inmuebles (
    id integer NOT NULL,
    bien_id integer NOT NULL,
    descripcion text,
    direccion_ubicacion character varying(255) NOT NULL,
    ficha_catastral character varying(255) NOT NULL,
    zonificacion character varying(255) NOT NULL,
    extension character varying(255) NOT NULL,
    titulo_supletorio character varying(255),
    sys_status boolean DEFAULT true NOT NULL,
    sys_fecha time with time zone DEFAULT now()
);


ALTER TABLE activos.inmuebles OWNER TO eureka;

--
-- TOC entry 2334 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN inmuebles.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN inmuebles.id IS 'Clave foranea';


--
-- TOC entry 2335 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN inmuebles.bien_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN inmuebles.bien_id IS 'Clave foranea a la tabla bienes';


--
-- TOC entry 2336 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN inmuebles.descripcion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN inmuebles.descripcion IS 'Descripcion del inmueble';


--
-- TOC entry 2337 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN inmuebles.direccion_ubicacion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN inmuebles.direccion_ubicacion IS 'Direccion de ubicacion del inmueble';


--
-- TOC entry 2338 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN inmuebles.ficha_catastral; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN inmuebles.ficha_catastral IS 'Ficha catastral del inmueble';


--
-- TOC entry 2339 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN inmuebles.zonificacion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN inmuebles.zonificacion IS 'Zonificacion del inmueble';


--
-- TOC entry 2340 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN inmuebles.extension; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN inmuebles.extension IS 'extension del inmueble';


--
-- TOC entry 2341 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN inmuebles.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN inmuebles.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 214 (class 1259 OID 411739)
-- Name: inmuebles_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE inmuebles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.inmuebles_id_seq OWNER TO eureka;

--
-- TOC entry 2342 (class 0 OID 0)
-- Dependencies: 214
-- Name: inmuebles_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE inmuebles_id_seq OWNED BY inmuebles.id;


--
-- TOC entry 217 (class 1259 OID 411759)
-- Name: muebles; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE muebles (
    id integer NOT NULL,
    bien_id integer NOT NULL,
    marca character varying(255) NOT NULL,
    modelo character varying(255) NOT NULL,
    serial character varying(255) NOT NULL,
    cantiad integer NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_fecha time with time zone DEFAULT now()
);


ALTER TABLE activos.muebles OWNER TO eureka;

--
-- TOC entry 2343 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE muebles; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE muebles IS 'Tabla que almacena todos los muebles de los contratistas';


--
-- TOC entry 2344 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN muebles.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN muebles.id IS 'Clave primaria';


--
-- TOC entry 2345 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN muebles.bien_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN muebles.bien_id IS 'Clave foranea a la tabla Bienes';


--
-- TOC entry 2346 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN muebles.marca; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN muebles.marca IS 'Marca del inmueble';


--
-- TOC entry 2347 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN muebles.modelo; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN muebles.modelo IS 'Modelo del inmueble';


--
-- TOC entry 2348 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN muebles.serial; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN muebles.serial IS 'Serial del inmueble';


--
-- TOC entry 2349 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN muebles.cantiad; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN muebles.cantiad IS 'Cantidad';


--
-- TOC entry 2350 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN muebles.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN muebles.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 216 (class 1259 OID 411757)
-- Name: muebles_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE muebles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.muebles_id_seq OWNER TO eureka;

--
-- TOC entry 2351 (class 0 OID 0)
-- Dependencies: 216
-- Name: muebles_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE muebles_id_seq OWNED BY muebles.id;


--
-- TOC entry 209 (class 1259 OID 411683)
-- Name: sys_formas_org; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE sys_formas_org (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    descripcion text,
    sys_status boolean DEFAULT true NOT NULL,
    sys_fecha time with time zone DEFAULT now()
);


ALTER TABLE activos.sys_formas_org OWNER TO eureka;

--
-- TOC entry 2352 (class 0 OID 0)
-- Dependencies: 209
-- Name: TABLE sys_formas_org; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE sys_formas_org IS 'Tabla que almacena las formas de orgnizacion que pueden existir dentro del sistema';


--
-- TOC entry 2353 (class 0 OID 0)
-- Dependencies: 209
-- Name: COLUMN sys_formas_org.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_formas_org.id IS 'Clave primaria';


--
-- TOC entry 2354 (class 0 OID 0)
-- Dependencies: 209
-- Name: COLUMN sys_formas_org.nombre; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_formas_org.nombre IS 'Nombre de la forma de organizacion';


--
-- TOC entry 2355 (class 0 OID 0)
-- Dependencies: 209
-- Name: COLUMN sys_formas_org.descripcion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_formas_org.descripcion IS 'Descripcion adicional de la forma de organizacion';


--
-- TOC entry 2356 (class 0 OID 0)
-- Dependencies: 209
-- Name: COLUMN sys_formas_org.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_formas_org.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 208 (class 1259 OID 411681)
-- Name: sys_formas_org_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE sys_formas_org_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.sys_formas_org_id_seq OWNER TO eureka;

--
-- TOC entry 2357 (class 0 OID 0)
-- Dependencies: 208
-- Name: sys_formas_org_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE sys_formas_org_id_seq OWNED BY sys_formas_org.id;


--
-- TOC entry 207 (class 1259 OID 411669)
-- Name: sys_tipo_bien; Type: TABLE; Schema: activos; Owner: postgres; Tablespace: 
--

CREATE TABLE sys_tipo_bien (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    depreciacion boolean DEFAULT false NOT NULL,
    deterioro boolean DEFAULT true NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_fecha time with time zone DEFAULT now()
);


ALTER TABLE activos.sys_tipo_bien OWNER TO postgres;

--
-- TOC entry 2358 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN sys_tipo_bien.id; Type: COMMENT; Schema: activos; Owner: postgres
--

COMMENT ON COLUMN sys_tipo_bien.id IS 'Clave primaria';


--
-- TOC entry 2359 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN sys_tipo_bien.nombre; Type: COMMENT; Schema: activos; Owner: postgres
--

COMMENT ON COLUMN sys_tipo_bien.nombre IS 'Nombre del tipo de bien.';


--
-- TOC entry 2360 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN sys_tipo_bien.depreciacion; Type: COMMENT; Schema: activos; Owner: postgres
--

COMMENT ON COLUMN sys_tipo_bien.depreciacion IS 'Si el bien tiene o no depreciacion';


--
-- TOC entry 2361 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN sys_tipo_bien.deterioro; Type: COMMENT; Schema: activos; Owner: postgres
--

COMMENT ON COLUMN sys_tipo_bien.deterioro IS 'Si el bien tiene o no deterioro';


--
-- TOC entry 2362 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN sys_tipo_bien.sys_status; Type: COMMENT; Schema: activos; Owner: postgres
--

COMMENT ON COLUMN sys_tipo_bien.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 206 (class 1259 OID 411667)
-- Name: sys_tipo_bien_id_seq; Type: SEQUENCE; Schema: activos; Owner: postgres
--

CREATE SEQUENCE sys_tipo_bien_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.sys_tipo_bien_id_seq OWNER TO postgres;

--
-- TOC entry 2363 (class 0 OID 0)
-- Dependencies: 206
-- Name: sys_tipo_bien_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: postgres
--

ALTER SEQUENCE sys_tipo_bien_id_seq OWNED BY sys_tipo_bien.id;


--
-- TOC entry 205 (class 1259 OID 411655)
-- Name: sys_tipo_documento; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE sys_tipo_documento (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    estado boolean DEFAULT true NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_fecha time with time zone DEFAULT now()
);


ALTER TABLE activos.sys_tipo_documento OWNER TO eureka;

--
-- TOC entry 2364 (class 0 OID 0)
-- Dependencies: 205
-- Name: COLUMN sys_tipo_documento.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_tipo_documento.id IS 'Clave foranea';


--
-- TOC entry 2365 (class 0 OID 0)
-- Dependencies: 205
-- Name: COLUMN sys_tipo_documento.nombre; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_tipo_documento.nombre IS 'Nombre del documento ';


--
-- TOC entry 2366 (class 0 OID 0)
-- Dependencies: 205
-- Name: COLUMN sys_tipo_documento.estado; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_tipo_documento.estado IS 'Si el documento se encuentra activo o no.';


--
-- TOC entry 2367 (class 0 OID 0)
-- Dependencies: 205
-- Name: COLUMN sys_tipo_documento.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_tipo_documento.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 204 (class 1259 OID 411653)
-- Name: sys_tipo_documento_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE sys_tipo_documento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.sys_tipo_documento_id_seq OWNER TO eureka;

--
-- TOC entry 2368 (class 0 OID 0)
-- Dependencies: 204
-- Name: sys_tipo_documento_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE sys_tipo_documento_id_seq OWNED BY sys_tipo_documento.id;


--
-- TOC entry 219 (class 1259 OID 411777)
-- Name: vehiculos; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE vehiculos (
    id integer NOT NULL,
    mueble_id integer NOT NULL,
    anho integer NOT NULL,
    uso integer NOT NULL,
    num_certificado character varying(255) NOT NULL,
    placa character varying(15) NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_fecha time with time zone DEFAULT now()
);


ALTER TABLE activos.vehiculos OWNER TO eureka;

--
-- TOC entry 2369 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE vehiculos; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE vehiculos IS 'Tabla que almacena un tipo de mueble';


--
-- TOC entry 2370 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN vehiculos.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN vehiculos.id IS 'Clave primaria';


--
-- TOC entry 2371 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN vehiculos.mueble_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN vehiculos.mueble_id IS 'Clave foranea a la tabla Muebles';


--
-- TOC entry 2372 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN vehiculos.anho; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN vehiculos.anho IS 'Año';


--
-- TOC entry 2373 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN vehiculos.uso; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN vehiculos.uso IS 'Uso del vehiculo, expresado en meses';


--
-- TOC entry 2374 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN vehiculos.num_certificado; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN vehiculos.num_certificado IS 'Numero de certificado';


--
-- TOC entry 2375 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN vehiculos.placa; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN vehiculos.placa IS 'Numero de placa del vehiculo';


--
-- TOC entry 2376 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN vehiculos.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN vehiculos.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 218 (class 1259 OID 411775)
-- Name: vehiculos_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE vehiculos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.vehiculos_id_seq OWNER TO eureka;

--
-- TOC entry 2377 (class 0 OID 0)
-- Dependencies: 218
-- Name: vehiculos_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE vehiculos_id_seq OWNED BY vehiculos.id;


SET search_path = public, pg_catalog;

--
-- TOC entry 195 (class 1259 OID 411540)
-- Name: accionistas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE accionistas (
    id integer NOT NULL,
    contratista_id integer NOT NULL,
    natural_juridica_id integer NOT NULL,
    porcentaje_accionario numeric(38,2) NOT NULL,
    valor_compra numeric(38,6) NOT NULL,
    fecha date NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_fecha time with time zone DEFAULT now()
);


ALTER TABLE public.accionistas OWNER TO postgres;

--
-- TOC entry 2378 (class 0 OID 0)
-- Dependencies: 195
-- Name: TABLE accionistas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE accionistas IS 'Tabla donde se almacenan los accionistas de las contratistas';


--
-- TOC entry 2379 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN accionistas.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN accionistas.id IS 'Clave primaria';


--
-- TOC entry 2380 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN accionistas.contratista_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN accionistas.contratista_id IS 'Clave foranea a la tabla contratista';


--
-- TOC entry 2381 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN accionistas.natural_juridica_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN accionistas.natural_juridica_id IS 'Clave foranea a la tabla naturales_juridicos';


--
-- TOC entry 2382 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN accionistas.porcentaje_accionario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN accionistas.porcentaje_accionario IS 'Porcentaje de acciones que tiene el accionista';


--
-- TOC entry 2383 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN accionistas.valor_compra; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN accionistas.valor_compra IS 'Precio de la accion al momento de su compra';


--
-- TOC entry 2384 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN accionistas.fecha; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN accionistas.fecha IS 'Fecha del momento que se compro la accion';


--
-- TOC entry 2385 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN accionistas.sys_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN accionistas.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 194 (class 1259 OID 411538)
-- Name: accionistas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE accionistas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accionistas_id_seq OWNER TO postgres;

--
-- TOC entry 2386 (class 0 OID 0)
-- Dependencies: 194
-- Name: accionistas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE accionistas_id_seq OWNED BY accionistas.id;


--
-- TOC entry 187 (class 1259 OID 411477)
-- Name: bancos_contratistas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE bancos_contratistas (
    id integer NOT NULL,
    banco_id integer NOT NULL,
    contratista_id integer NOT NULL,
    num_cuenta interval NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_fecha time with time zone DEFAULT now()
);


ALTER TABLE public.bancos_contratistas OWNER TO eureka;

--
-- TOC entry 2387 (class 0 OID 0)
-- Dependencies: 187
-- Name: TABLE bancos_contratistas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE bancos_contratistas IS 'Tabla relacion donde se almacenan los bancos que tiene un contratista';


--
-- TOC entry 2388 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN bancos_contratistas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN bancos_contratistas.id IS 'Clave primaria';


--
-- TOC entry 2389 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN bancos_contratistas.banco_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN bancos_contratistas.banco_id IS 'Clave foranea a la tabla bancos';


--
-- TOC entry 2390 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN bancos_contratistas.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN bancos_contratistas.contratista_id IS 'Clave foranea a tabla contratistas';


--
-- TOC entry 2391 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN bancos_contratistas.num_cuenta; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN bancos_contratistas.num_cuenta IS 'Numero de cuenta del contratista';


--
-- TOC entry 2392 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN bancos_contratistas.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN bancos_contratistas.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 186 (class 1259 OID 411475)
-- Name: bancos_contratistas_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE bancos_contratistas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bancos_contratistas_id_seq OWNER TO eureka;

--
-- TOC entry 2393 (class 0 OID 0)
-- Dependencies: 186
-- Name: bancos_contratistas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE bancos_contratistas_id_seq OWNED BY bancos_contratistas.id;


--
-- TOC entry 185 (class 1259 OID 411464)
-- Name: clientes; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE clientes (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    rif character varying(20) NOT NULL,
    publico boolean DEFAULT false,
    contratista_id integer NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_fecha time with time zone DEFAULT now()
);


ALTER TABLE public.clientes OWNER TO eureka;

--
-- TOC entry 2394 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN clientes.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN clientes.id IS 'Clave primaria';


--
-- TOC entry 2395 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN clientes.nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN clientes.nombre IS 'Nombre del cliente';


--
-- TOC entry 2396 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN clientes.rif; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN clientes.rif IS 'Registro de informacion fiscal del cliente';


--
-- TOC entry 2397 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN clientes.publico; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN clientes.publico IS 'Si el cliente es un ente publico o privado';


--
-- TOC entry 2398 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN clientes.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN clientes.contratista_id IS 'Relacion contra la tabla contratista';


--
-- TOC entry 2399 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN clientes.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN clientes.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 184 (class 1259 OID 411462)
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE clientes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clientes_id_seq OWNER TO eureka;

--
-- TOC entry 2400 (class 0 OID 0)
-- Dependencies: 184
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE clientes_id_seq OWNED BY clientes.id;


--
-- TOC entry 191 (class 1259 OID 411502)
-- Name: contratistas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE contratistas (
    id integer NOT NULL,
    natural_juridica_id integer NOT NULL,
    estatus_contratista_id integer NOT NULL
);


ALTER TABLE public.contratistas OWNER TO postgres;

--
-- TOC entry 2401 (class 0 OID 0)
-- Dependencies: 191
-- Name: TABLE contratistas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE contratistas IS 'Tabla donde se almacenan todas las empresas que contratan con el estado Venezolano';


--
-- TOC entry 2402 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN contratistas.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN contratistas.id IS 'Clave primaria';


--
-- TOC entry 2403 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN contratistas.natural_juridica_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN contratistas.natural_juridica_id IS 'Clave foranea a la tabla naturales_juridica';


--
-- TOC entry 2404 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN contratistas.estatus_contratista_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN contratistas.estatus_contratista_id IS 'Clave foranea a la tabla estatus_contratista';


--
-- TOC entry 190 (class 1259 OID 411500)
-- Name: contratistas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contratistas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contratistas_id_seq OWNER TO postgres;

--
-- TOC entry 2405 (class 0 OID 0)
-- Dependencies: 190
-- Name: contratistas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE contratistas_id_seq OWNED BY contratistas.id;


--
-- TOC entry 181 (class 1259 OID 411441)
-- Name: directores; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE directores (
    id integer NOT NULL,
    miembro_junta boolean DEFAULT false NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_fecha time with time zone DEFAULT now(),
    persona_natural_id integer NOT NULL
);


ALTER TABLE public.directores OWNER TO eureka;

--
-- TOC entry 2406 (class 0 OID 0)
-- Dependencies: 181
-- Name: TABLE directores; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE directores IS 'Directores de las empresas';


--
-- TOC entry 2407 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN directores.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN directores.id IS 'Clave primaria';


--
-- TOC entry 2408 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN directores.miembro_junta; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN directores.miembro_junta IS 'Si el director pertenece o no a la junta directiva';


--
-- TOC entry 2409 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN directores.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN directores.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 2410 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN directores.persona_natural_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN directores.persona_natural_id IS 'Clave foranea a la tabla personas_natural';


--
-- TOC entry 180 (class 1259 OID 411439)
-- Name: directores_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE directores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directores_id_seq OWNER TO eureka;

--
-- TOC entry 2411 (class 0 OID 0)
-- Dependencies: 180
-- Name: directores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE directores_id_seq OWNED BY directores.id;


--
-- TOC entry 193 (class 1259 OID 411520)
-- Name: empresas_relacionadas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE empresas_relacionadas (
    id integer NOT NULL,
    persona_juridica_id integer NOT NULL,
    contratista_id integer NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_fecha time without time zone DEFAULT now()
);


ALTER TABLE public.empresas_relacionadas OWNER TO eureka;

--
-- TOC entry 2412 (class 0 OID 0)
-- Dependencies: 193
-- Name: TABLE empresas_relacionadas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE empresas_relacionadas IS 'Tabla donde se guardan las empresas relacionadas de un contratista';


--
-- TOC entry 2413 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN empresas_relacionadas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN empresas_relacionadas.id IS 'Clave primaria';


--
-- TOC entry 2414 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN empresas_relacionadas.persona_juridica_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN empresas_relacionadas.persona_juridica_id IS 'Clave foranea a la tabla personas_juridicas';


--
-- TOC entry 2415 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN empresas_relacionadas.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN empresas_relacionadas.contratista_id IS 'Clave foranea a la tabla contratistas';


--
-- TOC entry 2416 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN empresas_relacionadas.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN empresas_relacionadas.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 192 (class 1259 OID 411518)
-- Name: empresas_relacionadas_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE empresas_relacionadas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.empresas_relacionadas_id_seq OWNER TO eureka;

--
-- TOC entry 2417 (class 0 OID 0)
-- Dependencies: 192
-- Name: empresas_relacionadas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE empresas_relacionadas_id_seq OWNED BY empresas_relacionadas.id;


--
-- TOC entry 183 (class 1259 OID 411452)
-- Name: estatus_contratistas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE estatus_contratistas (
    id integer NOT NULL,
    descripcion text NOT NULL,
    informacion_adicional text,
    sys_status boolean NOT NULL,
    sys_fecha time with time zone DEFAULT now()
);


ALTER TABLE public.estatus_contratistas OWNER TO eureka;

--
-- TOC entry 2418 (class 0 OID 0)
-- Dependencies: 183
-- Name: COLUMN estatus_contratistas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN estatus_contratistas.id IS 'Clave primaria';


--
-- TOC entry 2419 (class 0 OID 0)
-- Dependencies: 183
-- Name: COLUMN estatus_contratistas.descripcion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN estatus_contratistas.descripcion IS 'Descripcion del estado';


--
-- TOC entry 2420 (class 0 OID 0)
-- Dependencies: 183
-- Name: COLUMN estatus_contratistas.informacion_adicional; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN estatus_contratistas.informacion_adicional IS 'Informacion que complemente la descripcion';


--
-- TOC entry 2421 (class 0 OID 0)
-- Dependencies: 183
-- Name: COLUMN estatus_contratistas.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN estatus_contratistas.sys_status IS 'Estado interno del sistema';


--
-- TOC entry 182 (class 1259 OID 411450)
-- Name: estatus_contratistas_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE estatus_contratistas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estatus_contratistas_id_seq OWNER TO eureka;

--
-- TOC entry 2422 (class 0 OID 0)
-- Dependencies: 182
-- Name: estatus_contratistas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE estatus_contratistas_id_seq OWNED BY estatus_contratistas.id;


--
-- TOC entry 173 (class 1259 OID 411384)
-- Name: sys_inpc; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE sys_inpc (
    id integer NOT NULL,
    mes integer NOT NULL,
    indice numeric(38,6) NOT NULL,
    anho integer NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_fecha time with time zone DEFAULT now()
);


ALTER TABLE public.sys_inpc OWNER TO eureka;

--
-- TOC entry 2423 (class 0 OID 0)
-- Dependencies: 173
-- Name: TABLE sys_inpc; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE sys_inpc IS 'Indice nacional de precio al consumidor';


--
-- TOC entry 2424 (class 0 OID 0)
-- Dependencies: 173
-- Name: COLUMN sys_inpc.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_inpc.id IS 'Clave primaria';


--
-- TOC entry 2425 (class 0 OID 0)
-- Dependencies: 173
-- Name: COLUMN sys_inpc.mes; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_inpc.mes IS 'Mes del inpc';


--
-- TOC entry 2426 (class 0 OID 0)
-- Dependencies: 173
-- Name: COLUMN sys_inpc.indice; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_inpc.indice IS 'Valor del inpc del mes.';


--
-- TOC entry 2427 (class 0 OID 0)
-- Dependencies: 173
-- Name: COLUMN sys_inpc.anho; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_inpc.anho IS 'Año cargado del inpc';


--
-- TOC entry 2428 (class 0 OID 0)
-- Dependencies: 173
-- Name: COLUMN sys_inpc.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_inpc.sys_status IS 'Estatus de la columna: true o false';


--
-- TOC entry 172 (class 1259 OID 411382)
-- Name: inpc_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE inpc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inpc_id_seq OWNER TO eureka;

--
-- TOC entry 2429 (class 0 OID 0)
-- Dependencies: 172
-- Name: inpc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE inpc_id_seq OWNED BY sys_inpc.id;


--
-- TOC entry 189 (class 1259 OID 411490)
-- Name: naturales_juridicas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE naturales_juridicas (
    id integer NOT NULL,
    rif character varying(20) NOT NULL,
    juridica boolean NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_fecha time with time zone DEFAULT now()
);


ALTER TABLE public.naturales_juridicas OWNER TO eureka;

--
-- TOC entry 2430 (class 0 OID 0)
-- Dependencies: 189
-- Name: TABLE naturales_juridicas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE naturales_juridicas IS 'Almacena todos los rif de las personas naturales y juridicas en el sistema ';


--
-- TOC entry 2431 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN naturales_juridicas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN naturales_juridicas.id IS 'Clave primaria';


--
-- TOC entry 2432 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN naturales_juridicas.rif; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN naturales_juridicas.rif IS 'Rgistro de informacion fiscal';


--
-- TOC entry 2433 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN naturales_juridicas.juridica; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN naturales_juridicas.juridica IS 'Si el rif pertenece a una figura juridica o natural';


--
-- TOC entry 2434 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN naturales_juridicas.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN naturales_juridicas.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 188 (class 1259 OID 411488)
-- Name: naturales_juridicas_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE naturales_juridicas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.naturales_juridicas_id_seq OWNER TO eureka;

--
-- TOC entry 2435 (class 0 OID 0)
-- Dependencies: 188
-- Name: naturales_juridicas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE naturales_juridicas_id_seq OWNED BY naturales_juridicas.id;


--
-- TOC entry 199 (class 1259 OID 411598)
-- Name: nombres_cajas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE nombres_cajas (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    contratistas_id integer NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_fecha time with time zone NOT NULL
);


ALTER TABLE public.nombres_cajas OWNER TO eureka;

--
-- TOC entry 2436 (class 0 OID 0)
-- Dependencies: 199
-- Name: TABLE nombres_cajas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE nombres_cajas IS 'Nombre de las cajas que tienen los contratistas';


--
-- TOC entry 2437 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN nombres_cajas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN nombres_cajas.id IS 'Clave primaria';


--
-- TOC entry 2438 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN nombres_cajas.nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN nombres_cajas.nombre IS 'Nombre de la caja';


--
-- TOC entry 2439 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN nombres_cajas.contratistas_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN nombres_cajas.contratistas_id IS 'Clave foranea a la tabla contratistas';


--
-- TOC entry 2440 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN nombres_cajas.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN nombres_cajas.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 198 (class 1259 OID 411596)
-- Name: nombres_cajas_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE nombres_cajas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nombres_cajas_id_seq OWNER TO eureka;

--
-- TOC entry 2441 (class 0 OID 0)
-- Dependencies: 198
-- Name: nombres_cajas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE nombres_cajas_id_seq OWNED BY nombres_cajas.id;


--
-- TOC entry 203 (class 1259 OID 411630)
-- Name: notas_revelatorias; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE notas_revelatorias (
    id integer NOT NULL,
    nota text NOT NULL,
    contratista_id integer NOT NULL,
    usuario_id integer NOT NULL,
    estado boolean DEFAULT true NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_fecha time with time zone DEFAULT now()
);


ALTER TABLE public.notas_revelatorias OWNER TO eureka;

--
-- TOC entry 2442 (class 0 OID 0)
-- Dependencies: 203
-- Name: TABLE notas_revelatorias; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE notas_revelatorias IS 'Tabla donde se alojan las notas revelatorias de los contratistas';


--
-- TOC entry 2443 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN notas_revelatorias.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN notas_revelatorias.id IS 'Clave foranea';


--
-- TOC entry 2444 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN notas_revelatorias.nota; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN notas_revelatorias.nota IS 'Nota creada por el usuario secundario del contratista';


--
-- TOC entry 2445 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN notas_revelatorias.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN notas_revelatorias.contratista_id IS 'Clave foranea a la tabla contratistas';


--
-- TOC entry 2446 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN notas_revelatorias.usuario_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN notas_revelatorias.usuario_id IS 'Clave foranea a la tabla de usuarios, haciendo referencia al usuario que creo la nota revelatoria';


--
-- TOC entry 2447 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN notas_revelatorias.estado; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN notas_revelatorias.estado IS 'Si la nota esta activa o no';


--
-- TOC entry 2448 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN notas_revelatorias.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN notas_revelatorias.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 202 (class 1259 OID 411628)
-- Name: notas_revelatorias_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE notas_revelatorias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notas_revelatorias_id_seq OWNER TO eureka;

--
-- TOC entry 2449 (class 0 OID 0)
-- Dependencies: 202
-- Name: notas_revelatorias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE notas_revelatorias_id_seq OWNED BY notas_revelatorias.id;


--
-- TOC entry 179 (class 1259 OID 411429)
-- Name: personas_juridicas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE personas_juridicas (
    id integer NOT NULL,
    rif character varying(20) NOT NULL,
    razon_social character varying(255),
    sys_status boolean DEFAULT true NOT NULL,
    sys_fecha time with time zone DEFAULT now(),
    creado_por integer NOT NULL
);


ALTER TABLE public.personas_juridicas OWNER TO eureka;

--
-- TOC entry 2450 (class 0 OID 0)
-- Dependencies: 179
-- Name: TABLE personas_juridicas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE personas_juridicas IS 'Tabla para almacenar toda la figura juridica en el sistema';


--
-- TOC entry 2451 (class 0 OID 0)
-- Dependencies: 179
-- Name: COLUMN personas_juridicas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_juridicas.id IS 'Clave primaria';


--
-- TOC entry 2452 (class 0 OID 0)
-- Dependencies: 179
-- Name: COLUMN personas_juridicas.rif; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_juridicas.rif IS 'Registro de informacion fiscal';


--
-- TOC entry 2453 (class 0 OID 0)
-- Dependencies: 179
-- Name: COLUMN personas_juridicas.razon_social; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_juridicas.razon_social IS 'Nombre e la empresa registada';


--
-- TOC entry 2454 (class 0 OID 0)
-- Dependencies: 179
-- Name: COLUMN personas_juridicas.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_juridicas.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 2455 (class 0 OID 0)
-- Dependencies: 179
-- Name: COLUMN personas_juridicas.creado_por; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_juridicas.creado_por IS 'Mantiene la referencia al usuario que realizo la insercion';


--
-- TOC entry 178 (class 1259 OID 411427)
-- Name: personas_juridicas_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE personas_juridicas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personas_juridicas_id_seq OWNER TO eureka;

--
-- TOC entry 2456 (class 0 OID 0)
-- Dependencies: 178
-- Name: personas_juridicas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE personas_juridicas_id_seq OWNED BY personas_juridicas.id;


--
-- TOC entry 177 (class 1259 OID 411412)
-- Name: personas_naturales; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE personas_naturales (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    apellido character varying(255) NOT NULL,
    rif character varying(20) NOT NULL,
    ci integer NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_fecha time with time zone DEFAULT now(),
    creado_por integer NOT NULL
);


ALTER TABLE public.personas_naturales OWNER TO eureka;

--
-- TOC entry 2457 (class 0 OID 0)
-- Dependencies: 177
-- Name: TABLE personas_naturales; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE personas_naturales IS 'Personas naturales registradas en el sistema.';


--
-- TOC entry 2458 (class 0 OID 0)
-- Dependencies: 177
-- Name: COLUMN personas_naturales.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_naturales.id IS 'Clave primaria';


--
-- TOC entry 2459 (class 0 OID 0)
-- Dependencies: 177
-- Name: COLUMN personas_naturales.nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_naturales.nombre IS 'Nombre de la persona natural registrada';


--
-- TOC entry 2460 (class 0 OID 0)
-- Dependencies: 177
-- Name: COLUMN personas_naturales.apellido; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_naturales.apellido IS 'Apellido de la persona natural registrada';


--
-- TOC entry 2461 (class 0 OID 0)
-- Dependencies: 177
-- Name: COLUMN personas_naturales.rif; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_naturales.rif IS 'Rif de la persona natural registrada';


--
-- TOC entry 2462 (class 0 OID 0)
-- Dependencies: 177
-- Name: COLUMN personas_naturales.ci; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_naturales.ci IS 'Cedula de identidad de la persona registrada';


--
-- TOC entry 2463 (class 0 OID 0)
-- Dependencies: 177
-- Name: COLUMN personas_naturales.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_naturales.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 2464 (class 0 OID 0)
-- Dependencies: 177
-- Name: COLUMN personas_naturales.creado_por; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_naturales.creado_por IS 'Mantiene la referencia al usuario que realizo la insercion';


--
-- TOC entry 176 (class 1259 OID 411410)
-- Name: personas_naturales_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE personas_naturales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personas_naturales_id_seq OWNER TO eureka;

--
-- TOC entry 2465 (class 0 OID 0)
-- Dependencies: 176
-- Name: personas_naturales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE personas_naturales_id_seq OWNED BY personas_naturales.id;


--
-- TOC entry 197 (class 1259 OID 411560)
-- Name: repr_legales; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE repr_legales (
    id integer NOT NULL,
    contratista_id integer NOT NULL,
    persona_natural_id integer NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_fecha time with time zone DEFAULT now()
);


ALTER TABLE public.repr_legales OWNER TO eureka;

--
-- TOC entry 2466 (class 0 OID 0)
-- Dependencies: 197
-- Name: TABLE repr_legales; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE repr_legales IS 'Representantes legales';


--
-- TOC entry 2467 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN repr_legales.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN repr_legales.id IS 'Clave primaria';


--
-- TOC entry 2468 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN repr_legales.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN repr_legales.contratista_id IS 'Clave foranea a la tabla contratistas';


--
-- TOC entry 2469 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN repr_legales.persona_natural_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN repr_legales.persona_natural_id IS 'Clave foranea a la tabla personas naturales';


--
-- TOC entry 2470 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN repr_legales.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN repr_legales.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 196 (class 1259 OID 411558)
-- Name: repr_legales_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE repr_legales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repr_legales_id_seq OWNER TO eureka;

--
-- TOC entry 2471 (class 0 OID 0)
-- Dependencies: 196
-- Name: repr_legales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE repr_legales_id_seq OWNED BY repr_legales.id;


--
-- TOC entry 175 (class 1259 OID 411396)
-- Name: sys_bancos; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE sys_bancos (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    rif character varying(25) NOT NULL,
    codigo_sudeban character varying(10) NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_fecha time with time zone DEFAULT now()
);


ALTER TABLE public.sys_bancos OWNER TO eureka;

--
-- TOC entry 2472 (class 0 OID 0)
-- Dependencies: 175
-- Name: TABLE sys_bancos; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE sys_bancos IS 'Tabla que almacena todos los bancos del sistema';


--
-- TOC entry 2473 (class 0 OID 0)
-- Dependencies: 175
-- Name: COLUMN sys_bancos.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_bancos.id IS 'Clave primaria';


--
-- TOC entry 2474 (class 0 OID 0)
-- Dependencies: 175
-- Name: COLUMN sys_bancos.nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_bancos.nombre IS 'Nombre del banco';


--
-- TOC entry 2475 (class 0 OID 0)
-- Dependencies: 175
-- Name: COLUMN sys_bancos.rif; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_bancos.rif IS 'Rif del banco';


--
-- TOC entry 2476 (class 0 OID 0)
-- Dependencies: 175
-- Name: COLUMN sys_bancos.codigo_sudeban; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_bancos.codigo_sudeban IS 'Identificado numerico del banco';


--
-- TOC entry 2477 (class 0 OID 0)
-- Dependencies: 175
-- Name: COLUMN sys_bancos.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_bancos.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 174 (class 1259 OID 411394)
-- Name: sys_bancos_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE sys_bancos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sys_bancos_id_seq OWNER TO eureka;

--
-- TOC entry 2478 (class 0 OID 0)
-- Dependencies: 174
-- Name: sys_bancos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE sys_bancos_id_seq OWNED BY sys_bancos.id;


--
-- TOC entry 201 (class 1259 OID 411614)
-- Name: sys_monedas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE sys_monedas (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    pais character varying(255) NOT NULL,
    acronimo character varying(20) NOT NULL,
    cambio numeric(38,6) NOT NULL,
    sys_status boolean NOT NULL,
    sys_fecha time with time zone DEFAULT now()
);


ALTER TABLE public.sys_monedas OWNER TO eureka;

--
-- TOC entry 2479 (class 0 OID 0)
-- Dependencies: 201
-- Name: TABLE sys_monedas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE sys_monedas IS 'Tabla donde se alojan todos los posiblestipos de monedas y sus cambios.';


--
-- TOC entry 2480 (class 0 OID 0)
-- Dependencies: 201
-- Name: COLUMN sys_monedas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_monedas.id IS 'Clave foranea';


--
-- TOC entry 2481 (class 0 OID 0)
-- Dependencies: 201
-- Name: COLUMN sys_monedas.nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_monedas.nombre IS 'Nombre de la moneda';


--
-- TOC entry 2482 (class 0 OID 0)
-- Dependencies: 201
-- Name: COLUMN sys_monedas.pais; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_monedas.pais IS 'Nombre del pais';


--
-- TOC entry 2483 (class 0 OID 0)
-- Dependencies: 201
-- Name: COLUMN sys_monedas.acronimo; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_monedas.acronimo IS 'Abreviacion de la moneda.';


--
-- TOC entry 2484 (class 0 OID 0)
-- Dependencies: 201
-- Name: COLUMN sys_monedas.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_monedas.sys_status IS 'Estatus interno del sistema.';


--
-- TOC entry 200 (class 1259 OID 411612)
-- Name: sys_monedas_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE sys_monedas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sys_monedas_id_seq OWNER TO eureka;

--
-- TOC entry 2485 (class 0 OID 0)
-- Dependencies: 200
-- Name: sys_monedas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE sys_monedas_id_seq OWNED BY sys_monedas.id;


SET search_path = activos, pg_catalog;

--
-- TOC entry 2029 (class 2604 OID 411701)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY bienes ALTER COLUMN id SET DEFAULT nextval('bienes_id_seq'::regclass);


--
-- TOC entry 2032 (class 2604 OID 411724)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY datos_importacion ALTER COLUMN id SET DEFAULT nextval('datos_importacion_id_seq'::regclass);


--
-- TOC entry 2035 (class 2604 OID 411744)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY inmuebles ALTER COLUMN id SET DEFAULT nextval('inmuebles_id_seq'::regclass);


--
-- TOC entry 2038 (class 2604 OID 411762)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY muebles ALTER COLUMN id SET DEFAULT nextval('muebles_id_seq'::regclass);


--
-- TOC entry 2026 (class 2604 OID 411686)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY sys_formas_org ALTER COLUMN id SET DEFAULT nextval('sys_formas_org_id_seq'::regclass);


--
-- TOC entry 2021 (class 2604 OID 411672)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: postgres
--

ALTER TABLE ONLY sys_tipo_bien ALTER COLUMN id SET DEFAULT nextval('sys_tipo_bien_id_seq'::regclass);


--
-- TOC entry 2017 (class 2604 OID 411658)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY sys_tipo_documento ALTER COLUMN id SET DEFAULT nextval('sys_tipo_documento_id_seq'::regclass);


--
-- TOC entry 2041 (class 2604 OID 411780)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY vehiculos ALTER COLUMN id SET DEFAULT nextval('vehiculos_id_seq'::regclass);


SET search_path = public, pg_catalog;

--
-- TOC entry 2003 (class 2604 OID 411543)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY accionistas ALTER COLUMN id SET DEFAULT nextval('accionistas_id_seq'::regclass);


--
-- TOC entry 1993 (class 2604 OID 411480)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY bancos_contratistas ALTER COLUMN id SET DEFAULT nextval('bancos_contratistas_id_seq'::regclass);


--
-- TOC entry 1989 (class 2604 OID 411467)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY clientes ALTER COLUMN id SET DEFAULT nextval('clientes_id_seq'::regclass);


--
-- TOC entry 1999 (class 2604 OID 411505)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratistas ALTER COLUMN id SET DEFAULT nextval('contratistas_id_seq'::regclass);


--
-- TOC entry 1983 (class 2604 OID 411444)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY directores ALTER COLUMN id SET DEFAULT nextval('directores_id_seq'::regclass);


--
-- TOC entry 2000 (class 2604 OID 411523)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY empresas_relacionadas ALTER COLUMN id SET DEFAULT nextval('empresas_relacionadas_id_seq'::regclass);


--
-- TOC entry 1987 (class 2604 OID 411455)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY estatus_contratistas ALTER COLUMN id SET DEFAULT nextval('estatus_contratistas_id_seq'::regclass);


--
-- TOC entry 1996 (class 2604 OID 411493)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY naturales_juridicas ALTER COLUMN id SET DEFAULT nextval('naturales_juridicas_id_seq'::regclass);


--
-- TOC entry 2009 (class 2604 OID 411601)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY nombres_cajas ALTER COLUMN id SET DEFAULT nextval('nombres_cajas_id_seq'::regclass);


--
-- TOC entry 2015 (class 2604 OID 411633)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY notas_revelatorias ALTER COLUMN id SET DEFAULT nextval('notas_revelatorias_id_seq'::regclass);


--
-- TOC entry 1980 (class 2604 OID 411432)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY personas_juridicas ALTER COLUMN id SET DEFAULT nextval('personas_juridicas_id_seq'::regclass);


--
-- TOC entry 1977 (class 2604 OID 411415)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY personas_naturales ALTER COLUMN id SET DEFAULT nextval('personas_naturales_id_seq'::regclass);


--
-- TOC entry 2006 (class 2604 OID 411563)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY repr_legales ALTER COLUMN id SET DEFAULT nextval('repr_legales_id_seq'::regclass);


--
-- TOC entry 1974 (class 2604 OID 411399)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY sys_bancos ALTER COLUMN id SET DEFAULT nextval('sys_bancos_id_seq'::regclass);


--
-- TOC entry 1971 (class 2604 OID 411387)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY sys_inpc ALTER COLUMN id SET DEFAULT nextval('inpc_id_seq'::regclass);


--
-- TOC entry 2011 (class 2604 OID 411617)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY sys_monedas ALTER COLUMN id SET DEFAULT nextval('sys_monedas_id_seq'::regclass);


SET search_path = activos, pg_catalog;

--
-- TOC entry 2293 (class 0 OID 411698)
-- Dependencies: 211
-- Data for Name: bienes; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY bienes (id, sys_tipo_bien_id, principio_contable, depreciable, deterioro, detalle, origen, fecha_origen, contratista_id) FROM stdin;
\.


--
-- TOC entry 2486 (class 0 OID 0)
-- Dependencies: 210
-- Name: bienes_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('bienes_id_seq', 1, false);


--
-- TOC entry 2295 (class 0 OID 411721)
-- Dependencies: 213
-- Data for Name: datos_importacion; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY datos_importacion (id, bien_id, num_guia_nac, pais_origen, costo_adquisicion, gastos_mon_extranjera, sys_moneda_id, tasa_cambio, gastos_imp_nacional, otros_costros_imp_instalacion, total_costo_adquisicion, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 2487 (class 0 OID 0)
-- Dependencies: 212
-- Name: datos_importacion_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('datos_importacion_id_seq', 1, false);


--
-- TOC entry 2297 (class 0 OID 411741)
-- Dependencies: 215
-- Data for Name: inmuebles; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY inmuebles (id, bien_id, descripcion, direccion_ubicacion, ficha_catastral, zonificacion, extension, titulo_supletorio, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 2488 (class 0 OID 0)
-- Dependencies: 214
-- Name: inmuebles_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('inmuebles_id_seq', 1, false);


--
-- TOC entry 2299 (class 0 OID 411759)
-- Dependencies: 217
-- Data for Name: muebles; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY muebles (id, bien_id, marca, modelo, serial, cantiad, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 2489 (class 0 OID 0)
-- Dependencies: 216
-- Name: muebles_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('muebles_id_seq', 1, false);


--
-- TOC entry 2291 (class 0 OID 411683)
-- Dependencies: 209
-- Data for Name: sys_formas_org; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY sys_formas_org (id, nombre, descripcion, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 2490 (class 0 OID 0)
-- Dependencies: 208
-- Name: sys_formas_org_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('sys_formas_org_id_seq', 1, false);


--
-- TOC entry 2289 (class 0 OID 411669)
-- Dependencies: 207
-- Data for Name: sys_tipo_bien; Type: TABLE DATA; Schema: activos; Owner: postgres
--

COPY sys_tipo_bien (id, nombre, depreciacion, deterioro, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 2491 (class 0 OID 0)
-- Dependencies: 206
-- Name: sys_tipo_bien_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: postgres
--

SELECT pg_catalog.setval('sys_tipo_bien_id_seq', 1, false);


--
-- TOC entry 2287 (class 0 OID 411655)
-- Dependencies: 205
-- Data for Name: sys_tipo_documento; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY sys_tipo_documento (id, nombre, estado, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 2492 (class 0 OID 0)
-- Dependencies: 204
-- Name: sys_tipo_documento_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('sys_tipo_documento_id_seq', 1, false);


--
-- TOC entry 2301 (class 0 OID 411777)
-- Dependencies: 219
-- Data for Name: vehiculos; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY vehiculos (id, mueble_id, anho, uso, num_certificado, placa, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 2493 (class 0 OID 0)
-- Dependencies: 218
-- Name: vehiculos_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('vehiculos_id_seq', 1, false);


SET search_path = public, pg_catalog;

--
-- TOC entry 2277 (class 0 OID 411540)
-- Dependencies: 195
-- Data for Name: accionistas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY accionistas (id, contratista_id, natural_juridica_id, porcentaje_accionario, valor_compra, fecha, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 2494 (class 0 OID 0)
-- Dependencies: 194
-- Name: accionistas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('accionistas_id_seq', 1, false);


--
-- TOC entry 2269 (class 0 OID 411477)
-- Dependencies: 187
-- Data for Name: bancos_contratistas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY bancos_contratistas (id, banco_id, contratista_id, num_cuenta, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 2495 (class 0 OID 0)
-- Dependencies: 186
-- Name: bancos_contratistas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('bancos_contratistas_id_seq', 1, false);


--
-- TOC entry 2267 (class 0 OID 411464)
-- Dependencies: 185
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY clientes (id, nombre, rif, publico, contratista_id, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 2496 (class 0 OID 0)
-- Dependencies: 184
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('clientes_id_seq', 1, false);


--
-- TOC entry 2273 (class 0 OID 411502)
-- Dependencies: 191
-- Data for Name: contratistas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY contratistas (id, natural_juridica_id, estatus_contratista_id) FROM stdin;
\.


--
-- TOC entry 2497 (class 0 OID 0)
-- Dependencies: 190
-- Name: contratistas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('contratistas_id_seq', 1, false);


--
-- TOC entry 2263 (class 0 OID 411441)
-- Dependencies: 181
-- Data for Name: directores; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY directores (id, miembro_junta, sys_status, sys_fecha, persona_natural_id) FROM stdin;
\.


--
-- TOC entry 2498 (class 0 OID 0)
-- Dependencies: 180
-- Name: directores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('directores_id_seq', 1, false);


--
-- TOC entry 2275 (class 0 OID 411520)
-- Dependencies: 193
-- Data for Name: empresas_relacionadas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY empresas_relacionadas (id, persona_juridica_id, contratista_id, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 2499 (class 0 OID 0)
-- Dependencies: 192
-- Name: empresas_relacionadas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('empresas_relacionadas_id_seq', 1, false);


--
-- TOC entry 2265 (class 0 OID 411452)
-- Dependencies: 183
-- Data for Name: estatus_contratistas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY estatus_contratistas (id, descripcion, informacion_adicional, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 2500 (class 0 OID 0)
-- Dependencies: 182
-- Name: estatus_contratistas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('estatus_contratistas_id_seq', 1, false);


--
-- TOC entry 2501 (class 0 OID 0)
-- Dependencies: 172
-- Name: inpc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('inpc_id_seq', 1, false);


--
-- TOC entry 2271 (class 0 OID 411490)
-- Dependencies: 189
-- Data for Name: naturales_juridicas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY naturales_juridicas (id, rif, juridica, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 2502 (class 0 OID 0)
-- Dependencies: 188
-- Name: naturales_juridicas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('naturales_juridicas_id_seq', 1, false);


--
-- TOC entry 2281 (class 0 OID 411598)
-- Dependencies: 199
-- Data for Name: nombres_cajas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY nombres_cajas (id, nombre, contratistas_id, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 2503 (class 0 OID 0)
-- Dependencies: 198
-- Name: nombres_cajas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('nombres_cajas_id_seq', 1, false);


--
-- TOC entry 2285 (class 0 OID 411630)
-- Dependencies: 203
-- Data for Name: notas_revelatorias; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY notas_revelatorias (id, nota, contratista_id, usuario_id, estado, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 2504 (class 0 OID 0)
-- Dependencies: 202
-- Name: notas_revelatorias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('notas_revelatorias_id_seq', 1, false);


--
-- TOC entry 2261 (class 0 OID 411429)
-- Dependencies: 179
-- Data for Name: personas_juridicas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY personas_juridicas (id, rif, razon_social, sys_status, sys_fecha, creado_por) FROM stdin;
\.


--
-- TOC entry 2505 (class 0 OID 0)
-- Dependencies: 178
-- Name: personas_juridicas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('personas_juridicas_id_seq', 1, false);


--
-- TOC entry 2259 (class 0 OID 411412)
-- Dependencies: 177
-- Data for Name: personas_naturales; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY personas_naturales (id, nombre, apellido, rif, ci, sys_status, sys_fecha, creado_por) FROM stdin;
\.


--
-- TOC entry 2506 (class 0 OID 0)
-- Dependencies: 176
-- Name: personas_naturales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('personas_naturales_id_seq', 1, false);


--
-- TOC entry 2279 (class 0 OID 411560)
-- Dependencies: 197
-- Data for Name: repr_legales; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY repr_legales (id, contratista_id, persona_natural_id, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 2507 (class 0 OID 0)
-- Dependencies: 196
-- Name: repr_legales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('repr_legales_id_seq', 1, false);


--
-- TOC entry 2257 (class 0 OID 411396)
-- Dependencies: 175
-- Data for Name: sys_bancos; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY sys_bancos (id, nombre, rif, codigo_sudeban, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 2508 (class 0 OID 0)
-- Dependencies: 174
-- Name: sys_bancos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('sys_bancos_id_seq', 1, false);


--
-- TOC entry 2255 (class 0 OID 411384)
-- Dependencies: 173
-- Data for Name: sys_inpc; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY sys_inpc (id, mes, indice, anho, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 2283 (class 0 OID 411614)
-- Dependencies: 201
-- Data for Name: sys_monedas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY sys_monedas (id, nombre, pais, acronimo, cambio, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 2509 (class 0 OID 0)
-- Dependencies: 200
-- Name: sys_monedas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('sys_monedas_id_seq', 1, false);


SET search_path = activos, pg_catalog;

--
-- TOC entry 2117 (class 2606 OID 411708)
-- Name: bienes_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY bienes
    ADD CONSTRAINT bienes_pkey PRIMARY KEY (id);


--
-- TOC entry 2119 (class 2606 OID 411728)
-- Name: datos_importacion_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY datos_importacion
    ADD CONSTRAINT datos_importacion_pkey PRIMARY KEY (id);


--
-- TOC entry 2121 (class 2606 OID 411751)
-- Name: inmuebles_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY inmuebles
    ADD CONSTRAINT inmuebles_pkey PRIMARY KEY (id);


--
-- TOC entry 2123 (class 2606 OID 411769)
-- Name: muebles_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY muebles
    ADD CONSTRAINT muebles_pkey PRIMARY KEY (id);


--
-- TOC entry 2113 (class 2606 OID 411695)
-- Name: sys_formas_org_nombre_key; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_formas_org
    ADD CONSTRAINT sys_formas_org_nombre_key UNIQUE (nombre);


--
-- TOC entry 2115 (class 2606 OID 411693)
-- Name: sys_formas_org_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_formas_org
    ADD CONSTRAINT sys_formas_org_pkey PRIMARY KEY (id);


--
-- TOC entry 2109 (class 2606 OID 411680)
-- Name: sys_tipo_bien_nombre_key; Type: CONSTRAINT; Schema: activos; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sys_tipo_bien
    ADD CONSTRAINT sys_tipo_bien_nombre_key UNIQUE (nombre);


--
-- TOC entry 2111 (class 2606 OID 411678)
-- Name: sys_tipo_bien_pkey; Type: CONSTRAINT; Schema: activos; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sys_tipo_bien
    ADD CONSTRAINT sys_tipo_bien_pkey PRIMARY KEY (id);


--
-- TOC entry 2105 (class 2606 OID 411665)
-- Name: sys_tipo_documento_nombre_key; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_tipo_documento
    ADD CONSTRAINT sys_tipo_documento_nombre_key UNIQUE (nombre);


--
-- TOC entry 2107 (class 2606 OID 411663)
-- Name: sys_tipo_documento_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_tipo_documento
    ADD CONSTRAINT sys_tipo_documento_pkey PRIMARY KEY (id);


--
-- TOC entry 2125 (class 2606 OID 411784)
-- Name: vehiculos_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY vehiculos
    ADD CONSTRAINT vehiculos_pkey PRIMARY KEY (id);


SET search_path = public, pg_catalog;

--
-- TOC entry 2089 (class 2606 OID 411547)
-- Name: accionistas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY accionistas
    ADD CONSTRAINT accionistas_pkey PRIMARY KEY (id);


--
-- TOC entry 2075 (class 2606 OID 411486)
-- Name: bancos_contratistas_num_cuenta_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY bancos_contratistas
    ADD CONSTRAINT bancos_contratistas_num_cuenta_key UNIQUE (num_cuenta);


--
-- TOC entry 2077 (class 2606 OID 411484)
-- Name: bancos_contratistas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY bancos_contratistas
    ADD CONSTRAINT bancos_contratistas_pkey PRIMARY KEY (id);


--
-- TOC entry 2070 (class 2606 OID 411472)
-- Name: clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- TOC entry 2072 (class 2606 OID 411474)
-- Name: clientes_rif_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY clientes
    ADD CONSTRAINT clientes_rif_key UNIQUE (rif);


--
-- TOC entry 2085 (class 2606 OID 411507)
-- Name: contratistas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contratistas
    ADD CONSTRAINT contratistas_pkey PRIMARY KEY (id);


--
-- TOC entry 2065 (class 2606 OID 411449)
-- Name: directores_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY directores
    ADD CONSTRAINT directores_pkey PRIMARY KEY (id);


--
-- TOC entry 2087 (class 2606 OID 411527)
-- Name: empresas_relacionadas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY empresas_relacionadas
    ADD CONSTRAINT empresas_relacionadas_pkey PRIMARY KEY (id);


--
-- TOC entry 2068 (class 2606 OID 411461)
-- Name: estatus_contratistas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY estatus_contratistas
    ADD CONSTRAINT estatus_contratistas_pkey PRIMARY KEY (id);


--
-- TOC entry 2045 (class 2606 OID 411393)
-- Name: inpc_mes_anho_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_inpc
    ADD CONSTRAINT inpc_mes_anho_key UNIQUE (mes, anho);


--
-- TOC entry 2047 (class 2606 OID 411391)
-- Name: inpc_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_inpc
    ADD CONSTRAINT inpc_pkey PRIMARY KEY (id);


--
-- TOC entry 2081 (class 2606 OID 411497)
-- Name: naturales_juridicas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY naturales_juridicas
    ADD CONSTRAINT naturales_juridicas_pkey PRIMARY KEY (id);


--
-- TOC entry 2083 (class 2606 OID 411499)
-- Name: naturales_juridicas_rif_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY naturales_juridicas
    ADD CONSTRAINT naturales_juridicas_rif_key UNIQUE (rif);


--
-- TOC entry 2093 (class 2606 OID 411606)
-- Name: nombres_cajas_nombre_contratistas_id_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY nombres_cajas
    ADD CONSTRAINT nombres_cajas_nombre_contratistas_id_key UNIQUE (nombre, contratistas_id);


--
-- TOC entry 2095 (class 2606 OID 411604)
-- Name: nombres_cajas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY nombres_cajas
    ADD CONSTRAINT nombres_cajas_pkey PRIMARY KEY (id);


--
-- TOC entry 2103 (class 2606 OID 411641)
-- Name: notas_revelatorias_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY notas_revelatorias
    ADD CONSTRAINT notas_revelatorias_pkey PRIMARY KEY (id);


--
-- TOC entry 2061 (class 2606 OID 411436)
-- Name: personas_juridicas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY personas_juridicas
    ADD CONSTRAINT personas_juridicas_pkey PRIMARY KEY (id);


--
-- TOC entry 2063 (class 2606 OID 411438)
-- Name: personas_juridicas_rif_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY personas_juridicas
    ADD CONSTRAINT personas_juridicas_rif_key UNIQUE (rif);


--
-- TOC entry 2055 (class 2606 OID 411424)
-- Name: personas_naturales_ci_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY personas_naturales
    ADD CONSTRAINT personas_naturales_ci_key UNIQUE (ci);


--
-- TOC entry 2057 (class 2606 OID 411422)
-- Name: personas_naturales_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY personas_naturales
    ADD CONSTRAINT personas_naturales_pkey PRIMARY KEY (id);


--
-- TOC entry 2059 (class 2606 OID 411426)
-- Name: personas_naturales_rif_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY personas_naturales
    ADD CONSTRAINT personas_naturales_rif_key UNIQUE (rif);


--
-- TOC entry 2091 (class 2606 OID 411567)
-- Name: repr_legales_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY repr_legales
    ADD CONSTRAINT repr_legales_pkey PRIMARY KEY (id);


--
-- TOC entry 2049 (class 2606 OID 411407)
-- Name: sys_bancos_codigo_sudeban_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_bancos
    ADD CONSTRAINT sys_bancos_codigo_sudeban_key UNIQUE (codigo_sudeban);


--
-- TOC entry 2051 (class 2606 OID 411403)
-- Name: sys_bancos_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_bancos
    ADD CONSTRAINT sys_bancos_pkey PRIMARY KEY (id);


--
-- TOC entry 2053 (class 2606 OID 411405)
-- Name: sys_bancos_rif_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_bancos
    ADD CONSTRAINT sys_bancos_rif_key UNIQUE (rif);


--
-- TOC entry 2097 (class 2606 OID 411627)
-- Name: sys_monedas_nombre_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_monedas
    ADD CONSTRAINT sys_monedas_nombre_key UNIQUE (nombre);


--
-- TOC entry 2099 (class 2606 OID 411625)
-- Name: sys_monedas_pais_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_monedas
    ADD CONSTRAINT sys_monedas_pais_key UNIQUE (pais);


--
-- TOC entry 2101 (class 2606 OID 411623)
-- Name: sys_monedas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_monedas
    ADD CONSTRAINT sys_monedas_pkey PRIMARY KEY (id);


--
-- TOC entry 2078 (class 1259 OID 411589)
-- Name: fki_bancos_contratistas; Type: INDEX; Schema: public; Owner: eureka; Tablespace: 
--

CREATE INDEX fki_bancos_contratistas ON bancos_contratistas USING btree (contratista_id);


--
-- TOC entry 2073 (class 1259 OID 411583)
-- Name: fki_contratista_clientes; Type: INDEX; Schema: public; Owner: eureka; Tablespace: 
--

CREATE INDEX fki_contratista_clientes ON clientes USING btree (contratista_id);


--
-- TOC entry 2066 (class 1259 OID 411652)
-- Name: fki_persona_natural; Type: INDEX; Schema: public; Owner: eureka; Tablespace: 
--

CREATE INDEX fki_persona_natural ON directores USING btree (persona_natural_id);


--
-- TOC entry 2079 (class 1259 OID 411595)
-- Name: fki_sys_bancos_contratistas; Type: INDEX; Schema: public; Owner: eureka; Tablespace: 
--

CREATE INDEX fki_sys_bancos_contratistas ON bancos_contratistas USING btree (banco_id);


SET search_path = activos, pg_catalog;

--
-- TOC entry 2140 (class 2606 OID 411709)
-- Name: bienes_contratista_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY bienes
    ADD CONSTRAINT bienes_contratista_id_fkey FOREIGN KEY (contratista_id) REFERENCES public.contratistas(id);


--
-- TOC entry 2141 (class 2606 OID 411714)
-- Name: bienes_principio_contable_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY bienes
    ADD CONSTRAINT bienes_principio_contable_fkey FOREIGN KEY (principio_contable) REFERENCES sys_formas_org(id);


--
-- TOC entry 2142 (class 2606 OID 411729)
-- Name: datos_importacion_bien_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY datos_importacion
    ADD CONSTRAINT datos_importacion_bien_id_fkey FOREIGN KEY (bien_id) REFERENCES bienes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2143 (class 2606 OID 411734)
-- Name: datos_importacion_sys_moneda_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY datos_importacion
    ADD CONSTRAINT datos_importacion_sys_moneda_id_fkey FOREIGN KEY (sys_moneda_id) REFERENCES public.sys_monedas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2144 (class 2606 OID 411752)
-- Name: inmuebles_bien_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY inmuebles
    ADD CONSTRAINT inmuebles_bien_id_fkey FOREIGN KEY (bien_id) REFERENCES bienes(id);


--
-- TOC entry 2145 (class 2606 OID 411770)
-- Name: muebles_bien_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY muebles
    ADD CONSTRAINT muebles_bien_id_fkey FOREIGN KEY (bien_id) REFERENCES bienes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2146 (class 2606 OID 411785)
-- Name: vehiculos_mueble_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY vehiculos
    ADD CONSTRAINT vehiculos_mueble_id_fkey FOREIGN KEY (mueble_id) REFERENCES muebles(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = public, pg_catalog;

--
-- TOC entry 2135 (class 2606 OID 411553)
-- Name: accionistas_contratista_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY accionistas
    ADD CONSTRAINT accionistas_contratista_id_fkey FOREIGN KEY (contratista_id) REFERENCES contratistas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2134 (class 2606 OID 411548)
-- Name: accionistas_natural_juridica_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY accionistas
    ADD CONSTRAINT accionistas_natural_juridica_id_fkey FOREIGN KEY (natural_juridica_id) REFERENCES naturales_juridicas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2131 (class 2606 OID 411513)
-- Name: contratistas_estatus_contratista_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratistas
    ADD CONSTRAINT contratistas_estatus_contratista_id_fkey FOREIGN KEY (estatus_contratista_id) REFERENCES estatus_contratistas(id);


--
-- TOC entry 2130 (class 2606 OID 411508)
-- Name: contratistas_natural_juridica_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratistas
    ADD CONSTRAINT contratistas_natural_juridica_id_fkey FOREIGN KEY (natural_juridica_id) REFERENCES naturales_juridicas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2133 (class 2606 OID 411533)
-- Name: empresas_relacionadas_contratista_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY empresas_relacionadas
    ADD CONSTRAINT empresas_relacionadas_contratista_id_fkey FOREIGN KEY (contratista_id) REFERENCES contratistas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2132 (class 2606 OID 411528)
-- Name: empresas_relacionadas_persona_juridica_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY empresas_relacionadas
    ADD CONSTRAINT empresas_relacionadas_persona_juridica_id_fkey FOREIGN KEY (persona_juridica_id) REFERENCES personas_juridicas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2128 (class 2606 OID 411584)
-- Name: fk_bancos_contratistas; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY bancos_contratistas
    ADD CONSTRAINT fk_bancos_contratistas FOREIGN KEY (contratista_id) REFERENCES contratistas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2127 (class 2606 OID 411578)
-- Name: fk_contratista_clientes; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY clientes
    ADD CONSTRAINT fk_contratista_clientes FOREIGN KEY (contratista_id) REFERENCES contratistas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2126 (class 2606 OID 411647)
-- Name: fk_persona_natural; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY directores
    ADD CONSTRAINT fk_persona_natural FOREIGN KEY (persona_natural_id) REFERENCES personas_naturales(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2129 (class 2606 OID 411590)
-- Name: fk_sys_bancos_contratistas; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY bancos_contratistas
    ADD CONSTRAINT fk_sys_bancos_contratistas FOREIGN KEY (banco_id) REFERENCES sys_bancos(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2138 (class 2606 OID 411607)
-- Name: nombres_cajas_contratistas_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY nombres_cajas
    ADD CONSTRAINT nombres_cajas_contratistas_id_fkey FOREIGN KEY (contratistas_id) REFERENCES contratistas(id);


--
-- TOC entry 2139 (class 2606 OID 411642)
-- Name: notas_revelatorias_contratista_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY notas_revelatorias
    ADD CONSTRAINT notas_revelatorias_contratista_id_fkey FOREIGN KEY (contratista_id) REFERENCES contratistas(id);


--
-- TOC entry 2137 (class 2606 OID 411573)
-- Name: repr_legales_contratista_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY repr_legales
    ADD CONSTRAINT repr_legales_contratista_id_fkey FOREIGN KEY (contratista_id) REFERENCES contratistas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2136 (class 2606 OID 411568)
-- Name: repr_legales_persona_natural_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY repr_legales
    ADD CONSTRAINT repr_legales_persona_natural_id_fkey FOREIGN KEY (persona_natural_id) REFERENCES personas_naturales(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2308 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-04-03 00:54:27

--
-- PostgreSQL database dump complete
--

