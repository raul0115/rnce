--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.2
-- Dumped by pg_dump version 9.3.2
-- Started on 2015-04-04 14:42:53

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
-- TOC entry 264 (class 3079 OID 11750)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2654 (class 0 OID 0)
-- Dependencies: 264
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = activos, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 221 (class 1259 OID 411792)
-- Name: activos_biologicos; Type: TABLE; Schema: activos; Owner: postgres; Tablespace: 
--

CREATE TABLE activos_biologicos (
    id integer NOT NULL,
    bien_id integer NOT NULL,
    catidad integer NOT NULL,
    certificado boolean DEFAULT false,
    num_certificado character varying(255),
    detalles character varying(255) NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_fecha time with time zone DEFAULT now()
);


ALTER TABLE activos.activos_biologicos OWNER TO postgres;

--
-- TOC entry 2655 (class 0 OID 0)
-- Dependencies: 221
-- Name: TABLE activos_biologicos; Type: COMMENT; Schema: activos; Owner: postgres
--

COMMENT ON TABLE activos_biologicos IS 'Tabla que almacena los activos biologicos de los contratistas';


--
-- TOC entry 2656 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN activos_biologicos.id; Type: COMMENT; Schema: activos; Owner: postgres
--

COMMENT ON COLUMN activos_biologicos.id IS 'Clave primaria';


--
-- TOC entry 2657 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN activos_biologicos.bien_id; Type: COMMENT; Schema: activos; Owner: postgres
--

COMMENT ON COLUMN activos_biologicos.bien_id IS 'Clave foranea a la tabla Bienes';


--
-- TOC entry 2658 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN activos_biologicos.catidad; Type: COMMENT; Schema: activos; Owner: postgres
--

COMMENT ON COLUMN activos_biologicos.catidad IS 'Numero de activos biologicos';


--
-- TOC entry 2659 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN activos_biologicos.certificado; Type: COMMENT; Schema: activos; Owner: postgres
--

COMMENT ON COLUMN activos_biologicos.certificado IS 'Si el activo biologico esta o no certificado';


--
-- TOC entry 2660 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN activos_biologicos.num_certificado; Type: COMMENT; Schema: activos; Owner: postgres
--

COMMENT ON COLUMN activos_biologicos.num_certificado IS 'Si el activo esta certifiado, numero de certificado';


--
-- TOC entry 2661 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN activos_biologicos.detalles; Type: COMMENT; Schema: activos; Owner: postgres
--

COMMENT ON COLUMN activos_biologicos.detalles IS 'Informacion de complemento al activo biologico';


--
-- TOC entry 2662 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN activos_biologicos.sys_status; Type: COMMENT; Schema: activos; Owner: postgres
--

COMMENT ON COLUMN activos_biologicos.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 220 (class 1259 OID 411790)
-- Name: activos_biologicos_id_seq; Type: SEQUENCE; Schema: activos; Owner: postgres
--

CREATE SEQUENCE activos_biologicos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.activos_biologicos_id_seq OWNER TO postgres;

--
-- TOC entry 2663 (class 0 OID 0)
-- Dependencies: 220
-- Name: activos_biologicos_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: postgres
--

ALTER SEQUENCE activos_biologicos_id_seq OWNED BY activos_biologicos.id;


--
-- TOC entry 223 (class 1259 OID 411812)
-- Name: activos_intangibles; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE activos_intangibles (
    id integer NOT NULL,
    bien_id integer NOT NULL,
    certificado_registro character varying(255),
    fecha_registro date,
    vigencia date NOT NULL,
    sys_status boolean DEFAULT true,
    sys_fecha time with time zone DEFAULT now()
);


ALTER TABLE activos.activos_intangibles OWNER TO eureka;

--
-- TOC entry 2664 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE activos_intangibles; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE activos_intangibles IS 'Tabla que almacena los activos intangibles de los contratistas';


--
-- TOC entry 2665 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN activos_intangibles.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN activos_intangibles.id IS 'Clave primaria';


--
-- TOC entry 2666 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN activos_intangibles.bien_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN activos_intangibles.bien_id IS 'Clave foranea a la tabla Bienes';


--
-- TOC entry 2667 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN activos_intangibles.certificado_registro; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN activos_intangibles.certificado_registro IS 'Certificado de registro';


--
-- TOC entry 2668 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN activos_intangibles.fecha_registro; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN activos_intangibles.fecha_registro IS 'Fecha de registro del activo intangible';


--
-- TOC entry 2669 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN activos_intangibles.vigencia; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN activos_intangibles.vigencia IS 'Vigencia del activo intangible';


--
-- TOC entry 2670 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN activos_intangibles.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN activos_intangibles.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 222 (class 1259 OID 411810)
-- Name: activos_intangibles_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE activos_intangibles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.activos_intangibles_id_seq OWNER TO eureka;

--
-- TOC entry 2671 (class 0 OID 0)
-- Dependencies: 222
-- Name: activos_intangibles_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE activos_intangibles_id_seq OWNED BY activos_intangibles.id;


--
-- TOC entry 233 (class 1259 OID 411913)
-- Name: avaluos; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE avaluos (
    id integer NOT NULL,
    bien_id integer NOT NULL,
    valor numeric(38,6) NOT NULL,
    fecha_informe date NOT NULL,
    perito_id integer NOT NULL,
    gremio_id integer NOT NULL,
    num_inscripcion_gremio character varying(255) NOT NULL,
    sys_status boolean DEFAULT true,
    sys_fecha time with time zone DEFAULT now()
);


ALTER TABLE activos.avaluos OWNER TO eureka;

--
-- TOC entry 2672 (class 0 OID 0)
-- Dependencies: 233
-- Name: TABLE avaluos; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE avaluos IS 'Tabla donde se registran todos los avaluos de los contratistas';


--
-- TOC entry 2673 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN avaluos.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN avaluos.id IS 'Clave primaria';


--
-- TOC entry 2674 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN avaluos.bien_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN avaluos.bien_id IS 'Clave foranea a la tabla Bienes';


--
-- TOC entry 2675 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN avaluos.valor; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN avaluos.valor IS 'Valor del avaluo';


--
-- TOC entry 2676 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN avaluos.fecha_informe; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN avaluos.fecha_informe IS 'Fecha del informe del Avaluo';


--
-- TOC entry 2677 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN avaluos.perito_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN avaluos.perito_id IS 'Clave foranea a la tabla Personas_Naturales';


--
-- TOC entry 2678 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN avaluos.gremio_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN avaluos.gremio_id IS 'Clave foranea a la tabla Sys_gremios';


--
-- TOC entry 2679 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN avaluos.num_inscripcion_gremio; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN avaluos.num_inscripcion_gremio IS 'Numero de incripcion del gremio';


--
-- TOC entry 2680 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN avaluos.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN avaluos.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 232 (class 1259 OID 411911)
-- Name: avaluos_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE avaluos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.avaluos_id_seq OWNER TO eureka;

--
-- TOC entry 2681 (class 0 OID 0)
-- Dependencies: 232
-- Name: avaluos_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE avaluos_id_seq OWNED BY avaluos.id;


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
    contratista_id integer NOT NULL,
    propio boolean DEFAULT true NOT NULL
);


ALTER TABLE activos.bienes OWNER TO eureka;

--
-- TOC entry 2682 (class 0 OID 0)
-- Dependencies: 211
-- Name: TABLE bienes; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE bienes IS 'Tabla donde se almacenan los bienes que posee la empresa';


--
-- TOC entry 2683 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN bienes.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN bienes.id IS 'Clave primaria';


--
-- TOC entry 2684 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN bienes.sys_tipo_bien_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN bienes.sys_tipo_bien_id IS 'Clave foranea a la tabla sys_tipo_bien';


--
-- TOC entry 2685 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN bienes.principio_contable; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN bienes.principio_contable IS 'Principio contable que aplica para el bien';


--
-- TOC entry 2686 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN bienes.depreciable; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN bienes.depreciable IS 'Si el bien es depreciable o no';


--
-- TOC entry 2687 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN bienes.deterioro; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN bienes.deterioro IS 'Si el bien tiene deterioro o no';


--
-- TOC entry 2688 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN bienes.detalle; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN bienes.detalle IS 'Descripcion complementaria';


--
-- TOC entry 2689 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN bienes.origen; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN bienes.origen IS 'Origen del bien';


--
-- TOC entry 2690 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN bienes.fecha_origen; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN bienes.fecha_origen IS 'Fecha de la adquisicion del bien';


--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN bienes.contratista_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN bienes.contratista_id IS 'Clave foranea al contratista';


--
-- TOC entry 2692 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN bienes.propio; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN bienes.propio IS 'Si el bien es o no propio';


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
-- TOC entry 2693 (class 0 OID 0)
-- Dependencies: 210
-- Name: bienes_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE bienes_id_seq OWNED BY bienes.id;


--
-- TOC entry 259 (class 1259 OID 412193)
-- Name: construcciones_inmuebles; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE construcciones_inmuebles (
    id integer NOT NULL,
    bien_id integer NOT NULL,
    area_construccion character varying(255) NOT NULL,
    porcentaje_ejecucion numeric(38,6) NOT NULL,
    monto_ejecutado numeric(38,6) NOT NULL,
    sys_status boolean DEFAULT true,
    sys_fecha timestamp with time zone DEFAULT now()
);


ALTER TABLE activos.construcciones_inmuebles OWNER TO eureka;

--
-- TOC entry 2694 (class 0 OID 0)
-- Dependencies: 259
-- Name: TABLE construcciones_inmuebles; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE construcciones_inmuebles IS 'Tabla que contiene los inmuebles en construccion';


--
-- TOC entry 2695 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN construcciones_inmuebles.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN construcciones_inmuebles.id IS 'Clave primaria';


--
-- TOC entry 2696 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN construcciones_inmuebles.bien_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN construcciones_inmuebles.bien_id IS 'Clave foranea a la tabla Bienes';


--
-- TOC entry 2697 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN construcciones_inmuebles.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN construcciones_inmuebles.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 258 (class 1259 OID 412191)
-- Name: construcciones_inmuebles_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE construcciones_inmuebles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.construcciones_inmuebles_id_seq OWNER TO eureka;

--
-- TOC entry 2698 (class 0 OID 0)
-- Dependencies: 258
-- Name: construcciones_inmuebles_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE construcciones_inmuebles_id_seq OWNED BY construcciones_inmuebles.id;


--
-- TOC entry 213 (class 1259 OID 411721)
-- Name: datos_importacion; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE datos_importacion (
    id integer NOT NULL,
    bien_id integer NOT NULL,
    num_guia_nac character varying(100) NOT NULL,
    costo_adquisicion numeric(38,6) NOT NULL,
    gastos_mon_extranjera numeric(38,6) NOT NULL,
    sys_moneda_id integer NOT NULL,
    tasa_cambio numeric(38,6) NOT NULL,
    gastos_imp_nacional numeric(38,6) NOT NULL,
    otros_costros_imp_instalacion numeric(38,6) NOT NULL,
    total_costo_adquisicion numeric(38,6) NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_fecha time with time zone DEFAULT now(),
    pais_origen_id integer NOT NULL
);


ALTER TABLE activos.datos_importacion OWNER TO eureka;

--
-- TOC entry 2699 (class 0 OID 0)
-- Dependencies: 213
-- Name: TABLE datos_importacion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE datos_importacion IS 'Tabla que lleva adquisicion / Imporatada';


--
-- TOC entry 2700 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN datos_importacion.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN datos_importacion.id IS 'Clave primaria';


--
-- TOC entry 2701 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN datos_importacion.bien_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN datos_importacion.bien_id IS 'Clave foranea a la tabla Bienes';


--
-- TOC entry 2702 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN datos_importacion.num_guia_nac; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN datos_importacion.num_guia_nac IS 'Numero de guia nacionalizacion';


--
-- TOC entry 2703 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN datos_importacion.costo_adquisicion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN datos_importacion.costo_adquisicion IS 'Costo de la adquisicion';


--
-- TOC entry 2704 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN datos_importacion.gastos_mon_extranjera; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN datos_importacion.gastos_mon_extranjera IS 'Gastos en moneda extranjera';


--
-- TOC entry 2705 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN datos_importacion.sys_moneda_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN datos_importacion.sys_moneda_id IS 'Clave foranea a la tabla Sys_monedas';


--
-- TOC entry 2706 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN datos_importacion.tasa_cambio; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN datos_importacion.tasa_cambio IS 'Tasa de cambio al momento de la compra';


--
-- TOC entry 2707 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN datos_importacion.otros_costros_imp_instalacion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN datos_importacion.otros_costros_imp_instalacion IS 'Otros gastos importacion';


--
-- TOC entry 2708 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN datos_importacion.total_costo_adquisicion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN datos_importacion.total_costo_adquisicion IS 'Total de costo de la adquisicion';


--
-- TOC entry 2709 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN datos_importacion.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN datos_importacion.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 2710 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN datos_importacion.pais_origen_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN datos_importacion.pais_origen_id IS 'Pais de origen de la importacion clave foranea a la tabla Sys_Paises';


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
-- TOC entry 2711 (class 0 OID 0)
-- Dependencies: 212
-- Name: datos_importacion_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE datos_importacion_id_seq OWNED BY datos_importacion.id;


--
-- TOC entry 235 (class 1259 OID 411938)
-- Name: depresiaciones_amortizaciones; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE depresiaciones_amortizaciones (
    id integer NOT NULL,
    bien_id integer NOT NULL,
    costo_adquisicion_avaluo numeric(38,6) NOT NULL,
    fecha_adquisicion_avaluo date NOT NULL,
    vida_util integer NOT NULL,
    valor_residual numeric(38,6) NOT NULL,
    valor_depreciar numeric(38,6) NOT NULL,
    tasa_anual numeric(38,6) NOT NULL,
    unidades_estimadas integer NOT NULL,
    bs_unidad numeric(38,6) NOT NULL,
    unidades_producidas_periodo integer NOT NULL,
    unidades_consumidas integer NOT NULL,
    sys_status boolean DEFAULT true,
    sys_fecha time with time zone DEFAULT now()
);


ALTER TABLE activos.depresiaciones_amortizaciones OWNER TO eureka;

--
-- TOC entry 2712 (class 0 OID 0)
-- Dependencies: 235
-- Name: TABLE depresiaciones_amortizaciones; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE depresiaciones_amortizaciones IS 'Tabla que recoge todas las amortizaciones y depresiaciones de los activos';


--
-- TOC entry 2713 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN depresiaciones_amortizaciones.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN depresiaciones_amortizaciones.id IS 'Clave foranea';


--
-- TOC entry 2714 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN depresiaciones_amortizaciones.bien_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN depresiaciones_amortizaciones.bien_id IS 'Clave foranea a la tabla Bienes';


--
-- TOC entry 2715 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN depresiaciones_amortizaciones.costo_adquisicion_avaluo; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN depresiaciones_amortizaciones.costo_adquisicion_avaluo IS 'Costro de adquisicion';


--
-- TOC entry 2716 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN depresiaciones_amortizaciones.fecha_adquisicion_avaluo; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN depresiaciones_amortizaciones.fecha_adquisicion_avaluo IS 'Fecha de adquisicion del avaluo';


--
-- TOC entry 2717 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN depresiaciones_amortizaciones.vida_util; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN depresiaciones_amortizaciones.vida_util IS 'Vida util, expresado en meses';


--
-- TOC entry 2718 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN depresiaciones_amortizaciones.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN depresiaciones_amortizaciones.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 234 (class 1259 OID 411936)
-- Name: depresiaciones_amortizaciones_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE depresiaciones_amortizaciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.depresiaciones_amortizaciones_id_seq OWNER TO eureka;

--
-- TOC entry 2719 (class 0 OID 0)
-- Dependencies: 234
-- Name: depresiaciones_amortizaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE depresiaciones_amortizaciones_id_seq OWNED BY depresiaciones_amortizaciones.id;


--
-- TOC entry 245 (class 1259 OID 412035)
-- Name: desincorporacion_activos; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE desincorporacion_activos (
    id integer NOT NULL,
    sys_motivo_id integer NOT NULL,
    fecha date NOT NULL,
    precio_venta numeric(38,6) DEFAULT 0 NOT NULL,
    valor_neto_libro numeric(8,6) NOT NULL,
    sys_status boolean DEFAULT true,
    sys_fecha time with time zone DEFAULT now()
);


ALTER TABLE activos.desincorporacion_activos OWNER TO eureka;

--
-- TOC entry 2720 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN desincorporacion_activos.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN desincorporacion_activos.id IS 'Clave primaria';


--
-- TOC entry 2721 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN desincorporacion_activos.sys_motivo_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN desincorporacion_activos.sys_motivo_id IS 'Clave foranea a la tabla sys_motivos';


--
-- TOC entry 2722 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN desincorporacion_activos.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN desincorporacion_activos.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 244 (class 1259 OID 412033)
-- Name: desincorporacion_activos_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE desincorporacion_activos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.desincorporacion_activos_id_seq OWNER TO eureka;

--
-- TOC entry 2723 (class 0 OID 0)
-- Dependencies: 244
-- Name: desincorporacion_activos_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE desincorporacion_activos_id_seq OWNED BY desincorporacion_activos.id;


--
-- TOC entry 241 (class 1259 OID 412005)
-- Name: deterioros; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE deterioros (
    id integer NOT NULL,
    bien_id integer NOT NULL,
    valor_razonable numeric(38,6) NOT NULL,
    costo_disposicion numeric(38,6) NOT NULL,
    valor_uso numeric(38,6) NOT NULL,
    acumulado_ejer_ant numeric(38,6),
    ejercicios_anteriores numeric(38,6),
    sys_status boolean DEFAULT true,
    sys_fecha time with time zone DEFAULT now()
);


ALTER TABLE activos.deterioros OWNER TO eureka;

--
-- TOC entry 2724 (class 0 OID 0)
-- Dependencies: 241
-- Name: TABLE deterioros; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE deterioros IS 'Tabla donde se almacena el deterioro de los actvos';


--
-- TOC entry 2725 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN deterioros.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN deterioros.id IS 'Clave primaria';


--
-- TOC entry 2726 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN deterioros.bien_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN deterioros.bien_id IS 'Clave foranea a la tabla Bienes';


--
-- TOC entry 2727 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN deterioros.valor_razonable; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN deterioros.valor_razonable IS 'Costo del valor razonable';


--
-- TOC entry 2728 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN deterioros.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN deterioros.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 240 (class 1259 OID 412003)
-- Name: deterioros_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE deterioros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.deterioros_id_seq OWNER TO eureka;

--
-- TOC entry 2729 (class 0 OID 0)
-- Dependencies: 240
-- Name: deterioros_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE deterioros_id_seq OWNED BY deterioros.id;


--
-- TOC entry 229 (class 1259 OID 411872)
-- Name: documentos_registrados; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE documentos_registrados (
    id integer NOT NULL,
    contratista_id integer NOT NULL,
    sys_tipo_documento_id integer NOT NULL,
    sys_tipo_registro_id integer NOT NULL,
    circunscripcion character varying(255) NOT NULL,
    num_registro_notaria character varying(255) NOT NULL,
    tomo character varying(100) NOT NULL,
    folio character varying(100) NOT NULL,
    fecha_registro date NOT NULL,
    valor_adquisicion numeric(38,6) NOT NULL,
    sys_status boolean DEFAULT true,
    sys_fecha time with time zone DEFAULT now()
);


ALTER TABLE activos.documentos_registrados OWNER TO eureka;

--
-- TOC entry 2730 (class 0 OID 0)
-- Dependencies: 229
-- Name: TABLE documentos_registrados; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE documentos_registrados IS 'Tabla que almacena los documentos registrados';


--
-- TOC entry 2731 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN documentos_registrados.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN documentos_registrados.id IS 'Clave primaria';


--
-- TOC entry 2732 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN documentos_registrados.contratista_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN documentos_registrados.contratista_id IS 'Clave foranea a la tabla Contratistas';


--
-- TOC entry 2733 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN documentos_registrados.sys_tipo_documento_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN documentos_registrados.sys_tipo_documento_id IS 'Clave foranea a la tabla Tipo de documento';


--
-- TOC entry 2734 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN documentos_registrados.sys_tipo_registro_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN documentos_registrados.sys_tipo_registro_id IS 'Clave foranea a la tabla Tipo Registro';


--
-- TOC entry 2735 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN documentos_registrados.circunscripcion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN documentos_registrados.circunscripcion IS 'Circunscripcion donde registro el documento';


--
-- TOC entry 2736 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN documentos_registrados.num_registro_notaria; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN documentos_registrados.num_registro_notaria IS 'Numero del documento registrado';


--
-- TOC entry 2737 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN documentos_registrados.tomo; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN documentos_registrados.tomo IS 'Tomo del documento registrado';


--
-- TOC entry 2738 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN documentos_registrados.folio; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN documentos_registrados.folio IS 'Folio del documento registrado';


--
-- TOC entry 2739 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN documentos_registrados.fecha_registro; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN documentos_registrados.fecha_registro IS 'Fecha del registro del documento';


--
-- TOC entry 2740 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN documentos_registrados.valor_adquisicion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN documentos_registrados.valor_adquisicion IS 'Costo de adquisicion';


--
-- TOC entry 2741 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN documentos_registrados.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN documentos_registrados.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 228 (class 1259 OID 411870)
-- Name: documentos_registrados_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE documentos_registrados_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.documentos_registrados_id_seq OWNER TO eureka;

--
-- TOC entry 2742 (class 0 OID 0)
-- Dependencies: 228
-- Name: documentos_registrados_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE documentos_registrados_id_seq OWNED BY documentos_registrados.id;


--
-- TOC entry 261 (class 1259 OID 412208)
-- Name: fabricaciones_muebles; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE fabricaciones_muebles (
    id integer NOT NULL,
    bien_id integer NOT NULL,
    cantidad numeric(38,6) NOT NULL,
    porcentaje_fabricacion numeric(38,6) NOT NULL,
    monto_ejecutado numeric(38,6) NOT NULL,
    sys_status boolean DEFAULT true,
    sys_fecha timestamp with time zone DEFAULT now()
);


ALTER TABLE activos.fabricaciones_muebles OWNER TO eureka;

--
-- TOC entry 2743 (class 0 OID 0)
-- Dependencies: 261
-- Name: TABLE fabricaciones_muebles; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE fabricaciones_muebles IS 'Tabla que contiene los muebles en fabricacion';


--
-- TOC entry 2744 (class 0 OID 0)
-- Dependencies: 261
-- Name: COLUMN fabricaciones_muebles.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN fabricaciones_muebles.id IS 'Clave primaria';


--
-- TOC entry 2745 (class 0 OID 0)
-- Dependencies: 261
-- Name: COLUMN fabricaciones_muebles.bien_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN fabricaciones_muebles.bien_id IS 'Clave foranea a la tabla Bienes';


--
-- TOC entry 2746 (class 0 OID 0)
-- Dependencies: 261
-- Name: COLUMN fabricaciones_muebles.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN fabricaciones_muebles.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 260 (class 1259 OID 412206)
-- Name: fabricaciones_muebles_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE fabricaciones_muebles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.fabricaciones_muebles_id_seq OWNER TO eureka;

--
-- TOC entry 2747 (class 0 OID 0)
-- Dependencies: 260
-- Name: fabricaciones_muebles_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE fabricaciones_muebles_id_seq OWNED BY fabricaciones_muebles.id;


--
-- TOC entry 227 (class 1259 OID 411842)
-- Name: facturas; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE facturas (
    id integer NOT NULL,
    num_factura character varying(255) NOT NULL,
    proveedor_id integer NOT NULL,
    fecha_emision date NOT NULL,
    imprenta_id integer NOT NULL,
    fecha_emision_talonario date NOT NULL,
    comprador_id integer NOT NULL,
    base_imponible_gravable numeric(38,6) NOT NULL,
    execto numeric(38,6),
    iva numeric(38,6) NOT NULL,
    contratista_id integer NOT NULL,
    bien_id integer NOT NULL
);


ALTER TABLE activos.facturas OWNER TO eureka;

--
-- TOC entry 2748 (class 0 OID 0)
-- Dependencies: 227
-- Name: TABLE facturas; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE facturas IS 'Tabla que almacena las facturas de bienes de los contratistas';


--
-- TOC entry 2749 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN facturas.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN facturas.id IS 'Clave primaria';


--
-- TOC entry 2750 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN facturas.num_factura; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN facturas.num_factura IS 'Numero de la factura del bien.';


--
-- TOC entry 2751 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN facturas.proveedor_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN facturas.proveedor_id IS 'Clave foranea a la tabla personas_juridicas';


--
-- TOC entry 2752 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN facturas.fecha_emision; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN facturas.fecha_emision IS 'Fecha de imision de la factura';


--
-- TOC entry 2753 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN facturas.imprenta_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN facturas.imprenta_id IS 'Clave foranea a la tabla personas_juridicas';


--
-- TOC entry 2754 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN facturas.fecha_emision_talonario; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN facturas.fecha_emision_talonario IS 'Fecha de emision del talonario';


--
-- TOC entry 2755 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN facturas.comprador_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN facturas.comprador_id IS 'Clave foranea a la tabla personas_juridicas';


--
-- TOC entry 2756 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN facturas.base_imponible_gravable; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN facturas.base_imponible_gravable IS 'Base imponible gravable del impuesto';


--
-- TOC entry 2757 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN facturas.iva; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN facturas.iva IS 'Impuesto valor agregado';


--
-- TOC entry 2758 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN facturas.contratista_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN facturas.contratista_id IS 'Clave foranea a la tabla contratista';


--
-- TOC entry 2759 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN facturas.bien_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN facturas.bien_id IS 'Clave foranea a la tabla Bienes';


--
-- TOC entry 226 (class 1259 OID 411840)
-- Name: facturas_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE facturas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.facturas_id_seq OWNER TO eureka;

--
-- TOC entry 2760 (class 0 OID 0)
-- Dependencies: 226
-- Name: facturas_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE facturas_id_seq OWNED BY facturas.id;


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
-- TOC entry 2761 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN inmuebles.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN inmuebles.id IS 'Clave foranea';


--
-- TOC entry 2762 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN inmuebles.bien_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN inmuebles.bien_id IS 'Clave foranea a la tabla bienes';


--
-- TOC entry 2763 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN inmuebles.descripcion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN inmuebles.descripcion IS 'Descripcion del inmueble';


--
-- TOC entry 2764 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN inmuebles.direccion_ubicacion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN inmuebles.direccion_ubicacion IS 'Direccion de ubicacion del inmueble';


--
-- TOC entry 2765 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN inmuebles.ficha_catastral; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN inmuebles.ficha_catastral IS 'Ficha catastral del inmueble';


--
-- TOC entry 2766 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN inmuebles.zonificacion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN inmuebles.zonificacion IS 'Zonificacion del inmueble';


--
-- TOC entry 2767 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN inmuebles.extension; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN inmuebles.extension IS 'extension del inmueble';


--
-- TOC entry 2768 (class 0 OID 0)
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
-- TOC entry 2769 (class 0 OID 0)
-- Dependencies: 214
-- Name: inmuebles_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE inmuebles_id_seq OWNED BY inmuebles.id;


--
-- TOC entry 225 (class 1259 OID 411827)
-- Name: licencia; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE licencia (
    id integer NOT NULL,
    activo_intangible_id integer NOT NULL,
    numero character varying(255),
    fecha_adquisicion date,
    sys_status boolean DEFAULT true,
    sys_fecha time with time zone DEFAULT now()
);


ALTER TABLE activos.licencia OWNER TO eureka;

--
-- TOC entry 2770 (class 0 OID 0)
-- Dependencies: 225
-- Name: TABLE licencia; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE licencia IS 'Tabla de licencias del contratista';


--
-- TOC entry 2771 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN licencia.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN licencia.id IS 'Clave primaria';


--
-- TOC entry 2772 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN licencia.activo_intangible_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN licencia.activo_intangible_id IS 'Clave foranea a la tabla Activos intangibles';


--
-- TOC entry 2773 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN licencia.numero; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN licencia.numero IS 'Numero de la licencia';


--
-- TOC entry 2774 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN licencia.fecha_adquisicion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN licencia.fecha_adquisicion IS 'Fecha de adquisicion de la licencia';


--
-- TOC entry 2775 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN licencia.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN licencia.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 224 (class 1259 OID 411825)
-- Name: licencia_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE licencia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.licencia_id_seq OWNER TO eureka;

--
-- TOC entry 2776 (class 0 OID 0)
-- Dependencies: 224
-- Name: licencia_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE licencia_id_seq OWNED BY licencia.id;


--
-- TOC entry 239 (class 1259 OID 411968)
-- Name: medicion; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE medicion (
    id integer NOT NULL,
    bien_id integer NOT NULL,
    medicion_activo boolean DEFAULT true,
    sys_metodo_medicion_id integer NOT NULL,
    sys_status boolean DEFAULT true,
    sys_fecha time with time zone DEFAULT now(),
    aplica_deterioro boolean DEFAULT false,
    vinculado_proceso_productivo boolean DEFAULT false,
    vinculado_proceso_ventas boolean DEFAULT false
);


ALTER TABLE activos.medicion OWNER TO eureka;

--
-- TOC entry 2777 (class 0 OID 0)
-- Dependencies: 239
-- Name: TABLE medicion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE medicion IS 'Tabla de medicion';


--
-- TOC entry 2778 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN medicion.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN medicion.id IS 'Clave primaria';


--
-- TOC entry 2779 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN medicion.bien_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN medicion.bien_id IS 'Clave foranea a la tabla Bienes';


--
-- TOC entry 2780 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN medicion.sys_metodo_medicion_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN medicion.sys_metodo_medicion_id IS 'Clave foranea a la tabla sys metodo medicion';


--
-- TOC entry 2781 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN medicion.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN medicion.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 238 (class 1259 OID 411966)
-- Name: medicion_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE medicion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.medicion_id_seq OWNER TO eureka;

--
-- TOC entry 2782 (class 0 OID 0)
-- Dependencies: 238
-- Name: medicion_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE medicion_id_seq OWNED BY medicion.id;


--
-- TOC entry 247 (class 1259 OID 412050)
-- Name: mejoras_propiedades; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE mejoras_propiedades (
    id integer NOT NULL,
    clasificacion character varying(255) NOT NULL,
    sys_tipo_bien_id integer NOT NULL,
    principio_contable_id integer NOT NULL,
    depreciacion boolean DEFAULT true,
    deterioro boolean DEFAULT true,
    sys_status boolean DEFAULT true,
    sys_fecha time with time zone DEFAULT now(),
    bien_id integer NOT NULL,
    monto numeric(38,6) NOT NULL,
    fecha date NOT NULL,
    capitalizable boolean DEFAULT true NOT NULL
);


ALTER TABLE activos.mejoras_propiedades OWNER TO eureka;

--
-- TOC entry 2783 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN mejoras_propiedades.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN mejoras_propiedades.id IS 'Clave foranea';


--
-- TOC entry 2784 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN mejoras_propiedades.sys_tipo_bien_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN mejoras_propiedades.sys_tipo_bien_id IS 'Clave foranea a la tabla Sys_tipo_bien';


--
-- TOC entry 2785 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN mejoras_propiedades.principio_contable_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN mejoras_propiedades.principio_contable_id IS 'Clave foranea a la tabla Formas_organizacion';


--
-- TOC entry 2786 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN mejoras_propiedades.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN mejoras_propiedades.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 2787 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN mejoras_propiedades.bien_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN mejoras_propiedades.bien_id IS 'Clave foranea a la tabla Bienes';


--
-- TOC entry 246 (class 1259 OID 412048)
-- Name: mejoras_propiedad_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE mejoras_propiedad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.mejoras_propiedad_id_seq OWNER TO eureka;

--
-- TOC entry 2788 (class 0 OID 0)
-- Dependencies: 246
-- Name: mejoras_propiedad_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE mejoras_propiedad_id_seq OWNED BY mejoras_propiedades.id;


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
-- TOC entry 2789 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE muebles; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE muebles IS 'Tabla que almacena todos los muebles de los contratistas';


--
-- TOC entry 2790 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN muebles.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN muebles.id IS 'Clave primaria';


--
-- TOC entry 2791 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN muebles.bien_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN muebles.bien_id IS 'Clave foranea a la tabla Bienes';


--
-- TOC entry 2792 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN muebles.marca; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN muebles.marca IS 'Marca del inmueble';


--
-- TOC entry 2793 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN muebles.modelo; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN muebles.modelo IS 'Modelo del inmueble';


--
-- TOC entry 2794 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN muebles.serial; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN muebles.serial IS 'Serial del inmueble';


--
-- TOC entry 2795 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN muebles.cantiad; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN muebles.cantiad IS 'Cantidad';


--
-- TOC entry 2796 (class 0 OID 0)
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
-- TOC entry 2797 (class 0 OID 0)
-- Dependencies: 216
-- Name: muebles_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE muebles_id_seq OWNED BY muebles.id;


--
-- TOC entry 257 (class 1259 OID 412167)
-- Name: sys_ciudades; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE sys_ciudades (
    id integer NOT NULL,
    sys_estado_id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    codigo_postal character varying(255) NOT NULL,
    sys_status boolean DEFAULT true,
    sys_fecha timestamp with time zone DEFAULT now()
);


ALTER TABLE activos.sys_ciudades OWNER TO eureka;

--
-- TOC entry 2798 (class 0 OID 0)
-- Dependencies: 257
-- Name: TABLE sys_ciudades; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE sys_ciudades IS 'Tabla que almacena las ciudades del sistema referenciando a los estados';


--
-- TOC entry 2799 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN sys_ciudades.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_ciudades.id IS 'Clave foranea';


--
-- TOC entry 2800 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN sys_ciudades.sys_estado_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_ciudades.sys_estado_id IS 'Clave foranea a latabla Sys_estados';


--
-- TOC entry 2801 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN sys_ciudades.nombre; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_ciudades.nombre IS 'Nombre de la ciudad';


--
-- TOC entry 2802 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN sys_ciudades.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_ciudades.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 256 (class 1259 OID 412165)
-- Name: sys_ciudades_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE sys_ciudades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.sys_ciudades_id_seq OWNER TO eureka;

--
-- TOC entry 2803 (class 0 OID 0)
-- Dependencies: 256
-- Name: sys_ciudades_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE sys_ciudades_id_seq OWNED BY sys_ciudades.id;


--
-- TOC entry 251 (class 1259 OID 412106)
-- Name: sys_clasificaciones_bien; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE sys_clasificaciones_bien (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    descripcion character varying(255),
    sys_status boolean DEFAULT true,
    sys_fecha timestamp with time zone DEFAULT now()
);


ALTER TABLE activos.sys_clasificaciones_bien OWNER TO eureka;

--
-- TOC entry 2804 (class 0 OID 0)
-- Dependencies: 251
-- Name: TABLE sys_clasificaciones_bien; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE sys_clasificaciones_bien IS 'Tabla que contiene las clasificaciones de un bien';


--
-- TOC entry 2805 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN sys_clasificaciones_bien.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_clasificaciones_bien.id IS 'Clave foranea';


--
-- TOC entry 2806 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN sys_clasificaciones_bien.nombre; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_clasificaciones_bien.nombre IS 'Nombre de la clasificacion';


--
-- TOC entry 2807 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN sys_clasificaciones_bien.descripcion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_clasificaciones_bien.descripcion IS 'Informacion adicional';


--
-- TOC entry 2808 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN sys_clasificaciones_bien.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_clasificaciones_bien.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 250 (class 1259 OID 412104)
-- Name: sys_clasificaciones_bien_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE sys_clasificaciones_bien_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.sys_clasificaciones_bien_id_seq OWNER TO eureka;

--
-- TOC entry 2809 (class 0 OID 0)
-- Dependencies: 250
-- Name: sys_clasificaciones_bien_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE sys_clasificaciones_bien_id_seq OWNED BY sys_clasificaciones_bien.id;


--
-- TOC entry 255 (class 1259 OID 412152)
-- Name: sys_estados; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE sys_estados (
    id integer NOT NULL,
    sys_pais_id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    sys_status boolean DEFAULT true,
    sys_fecha timestamp with time zone DEFAULT now()
);


ALTER TABLE activos.sys_estados OWNER TO eureka;

--
-- TOC entry 2810 (class 0 OID 0)
-- Dependencies: 255
-- Name: TABLE sys_estados; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE sys_estados IS 'Tabla donde se almacenan los estados relacionados con su pais';


--
-- TOC entry 2811 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN sys_estados.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_estados.id IS 'Clave foranea';


--
-- TOC entry 2812 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN sys_estados.sys_pais_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_estados.sys_pais_id IS 'Clave foranea a la tabla Sys_Paises';


--
-- TOC entry 2813 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN sys_estados.nombre; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_estados.nombre IS 'Nombre del estado';


--
-- TOC entry 2814 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN sys_estados.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_estados.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 254 (class 1259 OID 412150)
-- Name: sys_estados_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE sys_estados_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.sys_estados_id_seq OWNER TO eureka;

--
-- TOC entry 2815 (class 0 OID 0)
-- Dependencies: 254
-- Name: sys_estados_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE sys_estados_id_seq OWNED BY sys_estados.id;


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
-- TOC entry 2816 (class 0 OID 0)
-- Dependencies: 209
-- Name: TABLE sys_formas_org; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE sys_formas_org IS 'Tabla que almacena las formas de orgnizacion que pueden existir dentro del sistema';


--
-- TOC entry 2817 (class 0 OID 0)
-- Dependencies: 209
-- Name: COLUMN sys_formas_org.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_formas_org.id IS 'Clave primaria';


--
-- TOC entry 2818 (class 0 OID 0)
-- Dependencies: 209
-- Name: COLUMN sys_formas_org.nombre; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_formas_org.nombre IS 'Nombre de la forma de organizacion';


--
-- TOC entry 2819 (class 0 OID 0)
-- Dependencies: 209
-- Name: COLUMN sys_formas_org.descripcion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_formas_org.descripcion IS 'Descripcion adicional de la forma de organizacion';


--
-- TOC entry 2820 (class 0 OID 0)
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
-- TOC entry 2821 (class 0 OID 0)
-- Dependencies: 208
-- Name: sys_formas_org_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE sys_formas_org_id_seq OWNED BY sys_formas_org.id;


--
-- TOC entry 231 (class 1259 OID 411895)
-- Name: sys_gremios; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE sys_gremios (
    id integer NOT NULL,
    persona_juridica_id integer NOT NULL,
    direccion text,
    sys_status boolean DEFAULT true,
    sys_fecha time with time zone DEFAULT now()
);


ALTER TABLE activos.sys_gremios OWNER TO eureka;

--
-- TOC entry 2822 (class 0 OID 0)
-- Dependencies: 231
-- Name: TABLE sys_gremios; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE sys_gremios IS 'Tabla donde almacena todos los gremios disponibles en el sistema';


--
-- TOC entry 2823 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN sys_gremios.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_gremios.id IS 'Clave primaria';


--
-- TOC entry 2824 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN sys_gremios.persona_juridica_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_gremios.persona_juridica_id IS 'Clave foranea a la tabla Personas Juridicas';


--
-- TOC entry 2825 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN sys_gremios.direccion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_gremios.direccion IS 'Informacion complementaria';


--
-- TOC entry 2826 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN sys_gremios.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_gremios.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 230 (class 1259 OID 411893)
-- Name: sys_gremios_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE sys_gremios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.sys_gremios_id_seq OWNER TO eureka;

--
-- TOC entry 2827 (class 0 OID 0)
-- Dependencies: 230
-- Name: sys_gremios_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE sys_gremios_id_seq OWNED BY sys_gremios.id;


--
-- TOC entry 237 (class 1259 OID 411953)
-- Name: sys_metodo_medicion; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE sys_metodo_medicion (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    descripcion character varying(255),
    sys_status boolean DEFAULT true,
    sys_fecha time with time zone DEFAULT now()
);


ALTER TABLE activos.sys_metodo_medicion OWNER TO eureka;

--
-- TOC entry 2828 (class 0 OID 0)
-- Dependencies: 237
-- Name: TABLE sys_metodo_medicion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE sys_metodo_medicion IS 'Tabla que almacena los metodos de medicion del sistema';


--
-- TOC entry 2829 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN sys_metodo_medicion.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_metodo_medicion.id IS 'Clave primaria';


--
-- TOC entry 2830 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN sys_metodo_medicion.nombre; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_metodo_medicion.nombre IS 'Nombre del metodo de medicion';


--
-- TOC entry 2831 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN sys_metodo_medicion.descripcion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_metodo_medicion.descripcion IS 'Informacion adicional';


--
-- TOC entry 2832 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN sys_metodo_medicion.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_metodo_medicion.sys_status IS 'Esatus interno del sistema';


--
-- TOC entry 236 (class 1259 OID 411951)
-- Name: sys_metodo_medicion_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE sys_metodo_medicion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.sys_metodo_medicion_id_seq OWNER TO eureka;

--
-- TOC entry 2833 (class 0 OID 0)
-- Dependencies: 236
-- Name: sys_metodo_medicion_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE sys_metodo_medicion_id_seq OWNED BY sys_metodo_medicion.id;


--
-- TOC entry 243 (class 1259 OID 412020)
-- Name: sys_motivios; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE sys_motivios (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    descripcion character varying(255),
    sys_status boolean DEFAULT true,
    sys_fecha time with time zone DEFAULT now()
);


ALTER TABLE activos.sys_motivios OWNER TO eureka;

--
-- TOC entry 2834 (class 0 OID 0)
-- Dependencies: 243
-- Name: TABLE sys_motivios; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE sys_motivios IS 'Tabla donde se almacenan todos los posibles motivos del sistema';


--
-- TOC entry 2835 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN sys_motivios.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_motivios.id IS 'Clave primaria';


--
-- TOC entry 2836 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN sys_motivios.nombre; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_motivios.nombre IS 'Nombre del motivo';


--
-- TOC entry 2837 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN sys_motivios.descripcion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_motivios.descripcion IS 'Informacion complementaria';


--
-- TOC entry 2838 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN sys_motivios.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_motivios.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 242 (class 1259 OID 412018)
-- Name: sys_motivios_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE sys_motivios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.sys_motivios_id_seq OWNER TO eureka;

--
-- TOC entry 2839 (class 0 OID 0)
-- Dependencies: 242
-- Name: sys_motivios_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE sys_motivios_id_seq OWNED BY sys_motivios.id;


--
-- TOC entry 253 (class 1259 OID 412140)
-- Name: sys_paises; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE sys_paises (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    sys_status boolean DEFAULT true,
    sys_fecha timestamp with time zone DEFAULT now()
);


ALTER TABLE activos.sys_paises OWNER TO eureka;

--
-- TOC entry 2840 (class 0 OID 0)
-- Dependencies: 253
-- Name: TABLE sys_paises; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE sys_paises IS 'Tabla que almacena todos los paises disponibles en el sistema';


--
-- TOC entry 2841 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN sys_paises.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_paises.id IS 'Clave primaria';


--
-- TOC entry 2842 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN sys_paises.nombre; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_paises.nombre IS 'Nombre del pais';


--
-- TOC entry 2843 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN sys_paises.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_paises.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 252 (class 1259 OID 412138)
-- Name: sys_paises_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE sys_paises_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.sys_paises_id_seq OWNER TO eureka;

--
-- TOC entry 2844 (class 0 OID 0)
-- Dependencies: 252
-- Name: sys_paises_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE sys_paises_id_seq OWNED BY sys_paises.id;


--
-- TOC entry 207 (class 1259 OID 411669)
-- Name: sys_tipos_bienes; Type: TABLE; Schema: activos; Owner: postgres; Tablespace: 
--

CREATE TABLE sys_tipos_bienes (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_fecha time with time zone DEFAULT now(),
    descripcion character varying(255),
    sys_clasificacion_bien_id integer NOT NULL
);


ALTER TABLE activos.sys_tipos_bienes OWNER TO postgres;

--
-- TOC entry 2845 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN sys_tipos_bienes.id; Type: COMMENT; Schema: activos; Owner: postgres
--

COMMENT ON COLUMN sys_tipos_bienes.id IS 'Clave primaria';


--
-- TOC entry 2846 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN sys_tipos_bienes.nombre; Type: COMMENT; Schema: activos; Owner: postgres
--

COMMENT ON COLUMN sys_tipos_bienes.nombre IS 'Nombre del tipo de bien.';


--
-- TOC entry 2847 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN sys_tipos_bienes.sys_status; Type: COMMENT; Schema: activos; Owner: postgres
--

COMMENT ON COLUMN sys_tipos_bienes.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 2848 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN sys_tipos_bienes.descripcion; Type: COMMENT; Schema: activos; Owner: postgres
--

COMMENT ON COLUMN sys_tipos_bienes.descripcion IS 'Informacion adicional';


--
-- TOC entry 2849 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN sys_tipos_bienes.sys_clasificacion_bien_id; Type: COMMENT; Schema: activos; Owner: postgres
--

COMMENT ON COLUMN sys_tipos_bienes.sys_clasificacion_bien_id IS 'Clave foranea a la tabla Sys_Clasificacion_bien_id';


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
-- TOC entry 2850 (class 0 OID 0)
-- Dependencies: 206
-- Name: sys_tipo_bien_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: postgres
--

ALTER SEQUENCE sys_tipo_bien_id_seq OWNED BY sys_tipos_bienes.id;


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
-- TOC entry 2851 (class 0 OID 0)
-- Dependencies: 205
-- Name: COLUMN sys_tipo_documento.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_tipo_documento.id IS 'Clave foranea';


--
-- TOC entry 2852 (class 0 OID 0)
-- Dependencies: 205
-- Name: COLUMN sys_tipo_documento.nombre; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_tipo_documento.nombre IS 'Nombre del documento ';


--
-- TOC entry 2853 (class 0 OID 0)
-- Dependencies: 205
-- Name: COLUMN sys_tipo_documento.estado; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_tipo_documento.estado IS 'Si el documento se encuentra activo o no.';


--
-- TOC entry 2854 (class 0 OID 0)
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
-- TOC entry 2855 (class 0 OID 0)
-- Dependencies: 204
-- Name: sys_tipo_documento_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE sys_tipo_documento_id_seq OWNED BY sys_tipo_documento.id;


--
-- TOC entry 263 (class 1259 OID 412229)
-- Name: sys_tipos_registros; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE sys_tipos_registros (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    sys_status boolean NOT NULL,
    sys_fecha timestamp with time zone DEFAULT now()
);


ALTER TABLE activos.sys_tipos_registros OWNER TO eureka;

--
-- TOC entry 2856 (class 0 OID 0)
-- Dependencies: 263
-- Name: TABLE sys_tipos_registros; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE sys_tipos_registros IS 'Tabla que almacena todos los tipos de registros en el sistema';


--
-- TOC entry 2857 (class 0 OID 0)
-- Dependencies: 263
-- Name: COLUMN sys_tipos_registros.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_tipos_registros.id IS 'Clave primaria';


--
-- TOC entry 2858 (class 0 OID 0)
-- Dependencies: 263
-- Name: COLUMN sys_tipos_registros.nombre; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_tipos_registros.nombre IS 'Nombre del registro';


--
-- TOC entry 2859 (class 0 OID 0)
-- Dependencies: 263
-- Name: COLUMN sys_tipos_registros.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_tipos_registros.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 262 (class 1259 OID 412227)
-- Name: sys_tipos_registros_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE sys_tipos_registros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.sys_tipos_registros_id_seq OWNER TO eureka;

--
-- TOC entry 2860 (class 0 OID 0)
-- Dependencies: 262
-- Name: sys_tipos_registros_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE sys_tipos_registros_id_seq OWNED BY sys_tipos_registros.id;


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
-- TOC entry 2861 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE vehiculos; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE vehiculos IS 'Tabla que almacena un tipo de mueble';


--
-- TOC entry 2862 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN vehiculos.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN vehiculos.id IS 'Clave primaria';


--
-- TOC entry 2863 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN vehiculos.mueble_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN vehiculos.mueble_id IS 'Clave foranea a la tabla Muebles';


--
-- TOC entry 2864 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN vehiculos.anho; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN vehiculos.anho IS 'Año';


--
-- TOC entry 2865 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN vehiculos.uso; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN vehiculos.uso IS 'Uso del vehiculo, expresado en meses';


--
-- TOC entry 2866 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN vehiculos.num_certificado; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN vehiculos.num_certificado IS 'Numero de certificado';


--
-- TOC entry 2867 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN vehiculos.placa; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN vehiculos.placa IS 'Numero de placa del vehiculo';


--
-- TOC entry 2868 (class 0 OID 0)
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
-- TOC entry 2869 (class 0 OID 0)
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
-- TOC entry 2870 (class 0 OID 0)
-- Dependencies: 195
-- Name: TABLE accionistas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE accionistas IS 'Tabla donde se almacenan los accionistas de las contratistas';


--
-- TOC entry 2871 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN accionistas.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN accionistas.id IS 'Clave primaria';


--
-- TOC entry 2872 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN accionistas.contratista_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN accionistas.contratista_id IS 'Clave foranea a la tabla contratista';


--
-- TOC entry 2873 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN accionistas.natural_juridica_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN accionistas.natural_juridica_id IS 'Clave foranea a la tabla naturales_juridicos';


--
-- TOC entry 2874 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN accionistas.porcentaje_accionario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN accionistas.porcentaje_accionario IS 'Porcentaje de acciones que tiene el accionista';


--
-- TOC entry 2875 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN accionistas.valor_compra; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN accionistas.valor_compra IS 'Precio de la accion al momento de su compra';


--
-- TOC entry 2876 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN accionistas.fecha; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN accionistas.fecha IS 'Fecha del momento que se compro la accion';


--
-- TOC entry 2877 (class 0 OID 0)
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
-- TOC entry 2878 (class 0 OID 0)
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
-- TOC entry 2879 (class 0 OID 0)
-- Dependencies: 187
-- Name: TABLE bancos_contratistas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE bancos_contratistas IS 'Tabla relacion donde se almacenan los bancos que tiene un contratista';


--
-- TOC entry 2880 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN bancos_contratistas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN bancos_contratistas.id IS 'Clave primaria';


--
-- TOC entry 2881 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN bancos_contratistas.banco_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN bancos_contratistas.banco_id IS 'Clave foranea a la tabla bancos';


--
-- TOC entry 2882 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN bancos_contratistas.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN bancos_contratistas.contratista_id IS 'Clave foranea a tabla contratistas';


--
-- TOC entry 2883 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN bancos_contratistas.num_cuenta; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN bancos_contratistas.num_cuenta IS 'Numero de cuenta del contratista';


--
-- TOC entry 2884 (class 0 OID 0)
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
-- TOC entry 2885 (class 0 OID 0)
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
    publico boolean DEFAULT false,
    contratista_id integer NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_fecha time with time zone DEFAULT now(),
    natural_juridico_id integer NOT NULL
);


ALTER TABLE public.clientes OWNER TO eureka;

--
-- TOC entry 2886 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN clientes.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN clientes.id IS 'Clave primaria';


--
-- TOC entry 2887 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN clientes.nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN clientes.nombre IS 'Nombre del cliente';


--
-- TOC entry 2888 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN clientes.publico; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN clientes.publico IS 'Si el cliente es un ente publico o privado';


--
-- TOC entry 2889 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN clientes.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN clientes.contratista_id IS 'Relacion contra la tabla contratista';


--
-- TOC entry 2890 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN clientes.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN clientes.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 2891 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN clientes.natural_juridico_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN clientes.natural_juridico_id IS 'Clave foranea a la tabla Naturales_Juridicos';


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
-- TOC entry 2892 (class 0 OID 0)
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
-- TOC entry 2893 (class 0 OID 0)
-- Dependencies: 191
-- Name: TABLE contratistas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE contratistas IS 'Tabla donde se almacenan todas las empresas que contratan con el estado Venezolano';


--
-- TOC entry 2894 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN contratistas.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN contratistas.id IS 'Clave primaria';


--
-- TOC entry 2895 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN contratistas.natural_juridica_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN contratistas.natural_juridica_id IS 'Clave foranea a la tabla naturales_juridica';


--
-- TOC entry 2896 (class 0 OID 0)
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
-- TOC entry 2897 (class 0 OID 0)
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
-- TOC entry 2898 (class 0 OID 0)
-- Dependencies: 181
-- Name: TABLE directores; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE directores IS 'Directores de las empresas';


--
-- TOC entry 2899 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN directores.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN directores.id IS 'Clave primaria';


--
-- TOC entry 2900 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN directores.miembro_junta; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN directores.miembro_junta IS 'Si el director pertenece o no a la junta directiva';


--
-- TOC entry 2901 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN directores.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN directores.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 2902 (class 0 OID 0)
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
-- TOC entry 2903 (class 0 OID 0)
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
-- TOC entry 2904 (class 0 OID 0)
-- Dependencies: 193
-- Name: TABLE empresas_relacionadas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE empresas_relacionadas IS 'Tabla donde se guardan las empresas relacionadas de un contratista';


--
-- TOC entry 2905 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN empresas_relacionadas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN empresas_relacionadas.id IS 'Clave primaria';


--
-- TOC entry 2906 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN empresas_relacionadas.persona_juridica_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN empresas_relacionadas.persona_juridica_id IS 'Clave foranea a la tabla personas_juridicas';


--
-- TOC entry 2907 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN empresas_relacionadas.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN empresas_relacionadas.contratista_id IS 'Clave foranea a la tabla contratistas';


--
-- TOC entry 2908 (class 0 OID 0)
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
-- TOC entry 2909 (class 0 OID 0)
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
-- TOC entry 2910 (class 0 OID 0)
-- Dependencies: 183
-- Name: COLUMN estatus_contratistas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN estatus_contratistas.id IS 'Clave primaria';


--
-- TOC entry 2911 (class 0 OID 0)
-- Dependencies: 183
-- Name: COLUMN estatus_contratistas.descripcion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN estatus_contratistas.descripcion IS 'Descripcion del estado';


--
-- TOC entry 2912 (class 0 OID 0)
-- Dependencies: 183
-- Name: COLUMN estatus_contratistas.informacion_adicional; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN estatus_contratistas.informacion_adicional IS 'Informacion que complemente la descripcion';


--
-- TOC entry 2913 (class 0 OID 0)
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
-- TOC entry 2914 (class 0 OID 0)
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
-- TOC entry 2915 (class 0 OID 0)
-- Dependencies: 173
-- Name: TABLE sys_inpc; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE sys_inpc IS 'Indice nacional de precio al consumidor';


--
-- TOC entry 2916 (class 0 OID 0)
-- Dependencies: 173
-- Name: COLUMN sys_inpc.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_inpc.id IS 'Clave primaria';


--
-- TOC entry 2917 (class 0 OID 0)
-- Dependencies: 173
-- Name: COLUMN sys_inpc.mes; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_inpc.mes IS 'Mes del inpc';


--
-- TOC entry 2918 (class 0 OID 0)
-- Dependencies: 173
-- Name: COLUMN sys_inpc.indice; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_inpc.indice IS 'Valor del inpc del mes.';


--
-- TOC entry 2919 (class 0 OID 0)
-- Dependencies: 173
-- Name: COLUMN sys_inpc.anho; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_inpc.anho IS 'Año cargado del inpc';


--
-- TOC entry 2920 (class 0 OID 0)
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
-- TOC entry 2921 (class 0 OID 0)
-- Dependencies: 172
-- Name: inpc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE inpc_id_seq OWNED BY sys_inpc.id;


--
-- TOC entry 189 (class 1259 OID 411490)
-- Name: sys_naturales_juridicas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE sys_naturales_juridicas (
    id integer NOT NULL,
    rif character varying(20) NOT NULL,
    juridica boolean NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_fecha time with time zone DEFAULT now(),
    denominacion character varying(255) NOT NULL
);


ALTER TABLE public.sys_naturales_juridicas OWNER TO eureka;

--
-- TOC entry 2922 (class 0 OID 0)
-- Dependencies: 189
-- Name: TABLE sys_naturales_juridicas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE sys_naturales_juridicas IS 'Almacena todos los rif de las personas naturales y juridicas en el sistema ';


--
-- TOC entry 2923 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN sys_naturales_juridicas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_naturales_juridicas.id IS 'Clave primaria';


--
-- TOC entry 2924 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN sys_naturales_juridicas.rif; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_naturales_juridicas.rif IS 'Rgistro de informacion fiscal';


--
-- TOC entry 2925 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN sys_naturales_juridicas.juridica; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_naturales_juridicas.juridica IS 'Si el rif pertenece a una figura juridica o natural';


--
-- TOC entry 2926 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN sys_naturales_juridicas.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_naturales_juridicas.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 2927 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN sys_naturales_juridicas.denominacion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_naturales_juridicas.denominacion IS 'Nombre de la persona juridica o la concatenacion del nombre y apellido de una persona natural.';


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
-- TOC entry 2928 (class 0 OID 0)
-- Dependencies: 188
-- Name: naturales_juridicas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE naturales_juridicas_id_seq OWNED BY sys_naturales_juridicas.id;


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
-- TOC entry 2929 (class 0 OID 0)
-- Dependencies: 199
-- Name: TABLE nombres_cajas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE nombres_cajas IS 'Nombre de las cajas que tienen los contratistas';


--
-- TOC entry 2930 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN nombres_cajas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN nombres_cajas.id IS 'Clave primaria';


--
-- TOC entry 2931 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN nombres_cajas.nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN nombres_cajas.nombre IS 'Nombre de la caja';


--
-- TOC entry 2932 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN nombres_cajas.contratistas_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN nombres_cajas.contratistas_id IS 'Clave foranea a la tabla contratistas';


--
-- TOC entry 2933 (class 0 OID 0)
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
-- TOC entry 2934 (class 0 OID 0)
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
-- TOC entry 2935 (class 0 OID 0)
-- Dependencies: 203
-- Name: TABLE notas_revelatorias; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE notas_revelatorias IS 'Tabla donde se alojan las notas revelatorias de los contratistas';


--
-- TOC entry 2936 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN notas_revelatorias.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN notas_revelatorias.id IS 'Clave foranea';


--
-- TOC entry 2937 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN notas_revelatorias.nota; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN notas_revelatorias.nota IS 'Nota creada por el usuario secundario del contratista';


--
-- TOC entry 2938 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN notas_revelatorias.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN notas_revelatorias.contratista_id IS 'Clave foranea a la tabla contratistas';


--
-- TOC entry 2939 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN notas_revelatorias.usuario_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN notas_revelatorias.usuario_id IS 'Clave foranea a la tabla de usuarios, haciendo referencia al usuario que creo la nota revelatoria';


--
-- TOC entry 2940 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN notas_revelatorias.estado; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN notas_revelatorias.estado IS 'Si la nota esta activa o no';


--
-- TOC entry 2941 (class 0 OID 0)
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
-- TOC entry 2942 (class 0 OID 0)
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
-- TOC entry 2943 (class 0 OID 0)
-- Dependencies: 179
-- Name: TABLE personas_juridicas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE personas_juridicas IS 'Tabla para almacenar toda la figura juridica en el sistema';


--
-- TOC entry 2944 (class 0 OID 0)
-- Dependencies: 179
-- Name: COLUMN personas_juridicas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_juridicas.id IS 'Clave primaria';


--
-- TOC entry 2945 (class 0 OID 0)
-- Dependencies: 179
-- Name: COLUMN personas_juridicas.rif; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_juridicas.rif IS 'Registro de informacion fiscal';


--
-- TOC entry 2946 (class 0 OID 0)
-- Dependencies: 179
-- Name: COLUMN personas_juridicas.razon_social; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_juridicas.razon_social IS 'Nombre e la empresa registada';


--
-- TOC entry 2947 (class 0 OID 0)
-- Dependencies: 179
-- Name: COLUMN personas_juridicas.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_juridicas.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 2948 (class 0 OID 0)
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
-- TOC entry 2949 (class 0 OID 0)
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
-- TOC entry 2950 (class 0 OID 0)
-- Dependencies: 177
-- Name: TABLE personas_naturales; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE personas_naturales IS 'Personas naturales registradas en el sistema.';


--
-- TOC entry 2951 (class 0 OID 0)
-- Dependencies: 177
-- Name: COLUMN personas_naturales.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_naturales.id IS 'Clave primaria';


--
-- TOC entry 2952 (class 0 OID 0)
-- Dependencies: 177
-- Name: COLUMN personas_naturales.nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_naturales.nombre IS 'Nombre de la persona natural registrada';


--
-- TOC entry 2953 (class 0 OID 0)
-- Dependencies: 177
-- Name: COLUMN personas_naturales.apellido; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_naturales.apellido IS 'Apellido de la persona natural registrada';


--
-- TOC entry 2954 (class 0 OID 0)
-- Dependencies: 177
-- Name: COLUMN personas_naturales.rif; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_naturales.rif IS 'Rif de la persona natural registrada';


--
-- TOC entry 2955 (class 0 OID 0)
-- Dependencies: 177
-- Name: COLUMN personas_naturales.ci; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_naturales.ci IS 'Cedula de identidad de la persona registrada';


--
-- TOC entry 2956 (class 0 OID 0)
-- Dependencies: 177
-- Name: COLUMN personas_naturales.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_naturales.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 2957 (class 0 OID 0)
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
-- TOC entry 2958 (class 0 OID 0)
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
-- TOC entry 2959 (class 0 OID 0)
-- Dependencies: 197
-- Name: TABLE repr_legales; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE repr_legales IS 'Representantes legales';


--
-- TOC entry 2960 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN repr_legales.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN repr_legales.id IS 'Clave primaria';


--
-- TOC entry 2961 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN repr_legales.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN repr_legales.contratista_id IS 'Clave foranea a la tabla contratistas';


--
-- TOC entry 2962 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN repr_legales.persona_natural_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN repr_legales.persona_natural_id IS 'Clave foranea a la tabla personas naturales';


--
-- TOC entry 2963 (class 0 OID 0)
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
-- TOC entry 2964 (class 0 OID 0)
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
-- TOC entry 2965 (class 0 OID 0)
-- Dependencies: 175
-- Name: TABLE sys_bancos; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE sys_bancos IS 'Tabla que almacena todos los bancos del sistema';


--
-- TOC entry 2966 (class 0 OID 0)
-- Dependencies: 175
-- Name: COLUMN sys_bancos.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_bancos.id IS 'Clave primaria';


--
-- TOC entry 2967 (class 0 OID 0)
-- Dependencies: 175
-- Name: COLUMN sys_bancos.nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_bancos.nombre IS 'Nombre del banco';


--
-- TOC entry 2968 (class 0 OID 0)
-- Dependencies: 175
-- Name: COLUMN sys_bancos.rif; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_bancos.rif IS 'Rif del banco';


--
-- TOC entry 2969 (class 0 OID 0)
-- Dependencies: 175
-- Name: COLUMN sys_bancos.codigo_sudeban; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_bancos.codigo_sudeban IS 'Identificado numerico del banco';


--
-- TOC entry 2970 (class 0 OID 0)
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
-- TOC entry 2971 (class 0 OID 0)
-- Dependencies: 174
-- Name: sys_bancos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE sys_bancos_id_seq OWNED BY sys_bancos.id;


--
-- TOC entry 201 (class 1259 OID 411614)
-- Name: sys_divisas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE sys_divisas (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    codigo character varying(20) NOT NULL,
    sys_status boolean NOT NULL,
    sys_fecha time with time zone DEFAULT now()
);


ALTER TABLE public.sys_divisas OWNER TO eureka;

--
-- TOC entry 2972 (class 0 OID 0)
-- Dependencies: 201
-- Name: TABLE sys_divisas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE sys_divisas IS 'Tabla donde se alojan todos los posibles tipos de divisas y sus cambios.';


--
-- TOC entry 2973 (class 0 OID 0)
-- Dependencies: 201
-- Name: COLUMN sys_divisas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_divisas.id IS 'Clave foranea';


--
-- TOC entry 2974 (class 0 OID 0)
-- Dependencies: 201
-- Name: COLUMN sys_divisas.nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_divisas.nombre IS 'Nombre de la moneda';


--
-- TOC entry 2975 (class 0 OID 0)
-- Dependencies: 201
-- Name: COLUMN sys_divisas.codigo; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_divisas.codigo IS 'Abreviacion de la moneda.';


--
-- TOC entry 2976 (class 0 OID 0)
-- Dependencies: 201
-- Name: COLUMN sys_divisas.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_divisas.sys_status IS 'Estatus interno del sistema.';


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
-- TOC entry 2977 (class 0 OID 0)
-- Dependencies: 200
-- Name: sys_monedas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE sys_monedas_id_seq OWNED BY sys_divisas.id;


--
-- TOC entry 249 (class 1259 OID 412089)
-- Name: sys_tasas_divisas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE sys_tasas_divisas (
    id integer NOT NULL,
    sys_divisa_id integer NOT NULL,
    tasa numeric(38,6) NOT NULL,
    sys_status boolean DEFAULT true,
    sys_fecha timestamp with time zone DEFAULT now()
);


ALTER TABLE public.sys_tasas_divisas OWNER TO eureka;

--
-- TOC entry 2978 (class 0 OID 0)
-- Dependencies: 249
-- Name: TABLE sys_tasas_divisas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE sys_tasas_divisas IS 'Tabla que almacena todos los historicos de cambios de una divisa';


--
-- TOC entry 2979 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN sys_tasas_divisas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_tasas_divisas.id IS 'Clave primaria';


--
-- TOC entry 2980 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN sys_tasas_divisas.sys_divisa_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_tasas_divisas.sys_divisa_id IS 'Clave foranea a la tabla Sys_Divisa_id';


--
-- TOC entry 2981 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN sys_tasas_divisas.tasa; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_tasas_divisas.tasa IS 'Costo de la divisa';


--
-- TOC entry 2982 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN sys_tasas_divisas.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_tasas_divisas.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 248 (class 1259 OID 412087)
-- Name: sys_tasas_divisas_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE sys_tasas_divisas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sys_tasas_divisas_id_seq OWNER TO eureka;

--
-- TOC entry 2983 (class 0 OID 0)
-- Dependencies: 248
-- Name: sys_tasas_divisas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE sys_tasas_divisas_id_seq OWNED BY sys_tasas_divisas.id;


SET search_path = activos, pg_catalog;

--
-- TOC entry 2182 (class 2604 OID 411795)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: postgres
--

ALTER TABLE ONLY activos_biologicos ALTER COLUMN id SET DEFAULT nextval('activos_biologicos_id_seq'::regclass);


--
-- TOC entry 2186 (class 2604 OID 411815)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY activos_intangibles ALTER COLUMN id SET DEFAULT nextval('activos_intangibles_id_seq'::regclass);


--
-- TOC entry 2199 (class 2604 OID 411916)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY avaluos ALTER COLUMN id SET DEFAULT nextval('avaluos_id_seq'::regclass);


--
-- TOC entry 2166 (class 2604 OID 411701)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY bienes ALTER COLUMN id SET DEFAULT nextval('bienes_id_seq'::regclass);


--
-- TOC entry 2246 (class 2604 OID 412196)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY construcciones_inmuebles ALTER COLUMN id SET DEFAULT nextval('construcciones_inmuebles_id_seq'::regclass);


--
-- TOC entry 2170 (class 2604 OID 411724)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY datos_importacion ALTER COLUMN id SET DEFAULT nextval('datos_importacion_id_seq'::regclass);


--
-- TOC entry 2202 (class 2604 OID 411941)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY depresiaciones_amortizaciones ALTER COLUMN id SET DEFAULT nextval('depresiaciones_amortizaciones_id_seq'::regclass);


--
-- TOC entry 2221 (class 2604 OID 412038)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY desincorporacion_activos ALTER COLUMN id SET DEFAULT nextval('desincorporacion_activos_id_seq'::regclass);


--
-- TOC entry 2215 (class 2604 OID 412008)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY deterioros ALTER COLUMN id SET DEFAULT nextval('deterioros_id_seq'::regclass);


--
-- TOC entry 2193 (class 2604 OID 411875)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY documentos_registrados ALTER COLUMN id SET DEFAULT nextval('documentos_registrados_id_seq'::regclass);


--
-- TOC entry 2249 (class 2604 OID 412211)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY fabricaciones_muebles ALTER COLUMN id SET DEFAULT nextval('fabricaciones_muebles_id_seq'::regclass);


--
-- TOC entry 2192 (class 2604 OID 411845)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY facturas ALTER COLUMN id SET DEFAULT nextval('facturas_id_seq'::regclass);


--
-- TOC entry 2173 (class 2604 OID 411744)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY inmuebles ALTER COLUMN id SET DEFAULT nextval('inmuebles_id_seq'::regclass);


--
-- TOC entry 2189 (class 2604 OID 411830)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY licencia ALTER COLUMN id SET DEFAULT nextval('licencia_id_seq'::regclass);


--
-- TOC entry 2208 (class 2604 OID 411971)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY medicion ALTER COLUMN id SET DEFAULT nextval('medicion_id_seq'::regclass);


--
-- TOC entry 2225 (class 2604 OID 412053)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY mejoras_propiedades ALTER COLUMN id SET DEFAULT nextval('mejoras_propiedad_id_seq'::regclass);


--
-- TOC entry 2176 (class 2604 OID 411762)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY muebles ALTER COLUMN id SET DEFAULT nextval('muebles_id_seq'::regclass);


--
-- TOC entry 2243 (class 2604 OID 412170)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY sys_ciudades ALTER COLUMN id SET DEFAULT nextval('sys_ciudades_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 412109)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY sys_clasificaciones_bien ALTER COLUMN id SET DEFAULT nextval('sys_clasificaciones_bien_id_seq'::regclass);


--
-- TOC entry 2240 (class 2604 OID 412155)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY sys_estados ALTER COLUMN id SET DEFAULT nextval('sys_estados_id_seq'::regclass);


--
-- TOC entry 2163 (class 2604 OID 411686)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY sys_formas_org ALTER COLUMN id SET DEFAULT nextval('sys_formas_org_id_seq'::regclass);


--
-- TOC entry 2196 (class 2604 OID 411898)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY sys_gremios ALTER COLUMN id SET DEFAULT nextval('sys_gremios_id_seq'::regclass);


--
-- TOC entry 2205 (class 2604 OID 411956)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY sys_metodo_medicion ALTER COLUMN id SET DEFAULT nextval('sys_metodo_medicion_id_seq'::regclass);


--
-- TOC entry 2218 (class 2604 OID 412023)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY sys_motivios ALTER COLUMN id SET DEFAULT nextval('sys_motivios_id_seq'::regclass);


--
-- TOC entry 2237 (class 2604 OID 412143)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY sys_paises ALTER COLUMN id SET DEFAULT nextval('sys_paises_id_seq'::regclass);


--
-- TOC entry 2156 (class 2604 OID 411658)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY sys_tipo_documento ALTER COLUMN id SET DEFAULT nextval('sys_tipo_documento_id_seq'::regclass);


--
-- TOC entry 2160 (class 2604 OID 411672)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: postgres
--

ALTER TABLE ONLY sys_tipos_bienes ALTER COLUMN id SET DEFAULT nextval('sys_tipo_bien_id_seq'::regclass);


--
-- TOC entry 2252 (class 2604 OID 412232)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY sys_tipos_registros ALTER COLUMN id SET DEFAULT nextval('sys_tipos_registros_id_seq'::regclass);


--
-- TOC entry 2179 (class 2604 OID 411780)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY vehiculos ALTER COLUMN id SET DEFAULT nextval('vehiculos_id_seq'::regclass);


SET search_path = public, pg_catalog;

--
-- TOC entry 2142 (class 2604 OID 411543)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY accionistas ALTER COLUMN id SET DEFAULT nextval('accionistas_id_seq'::regclass);


--
-- TOC entry 2132 (class 2604 OID 411480)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY bancos_contratistas ALTER COLUMN id SET DEFAULT nextval('bancos_contratistas_id_seq'::regclass);


--
-- TOC entry 2128 (class 2604 OID 411467)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY clientes ALTER COLUMN id SET DEFAULT nextval('clientes_id_seq'::regclass);


--
-- TOC entry 2138 (class 2604 OID 411505)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratistas ALTER COLUMN id SET DEFAULT nextval('contratistas_id_seq'::regclass);


--
-- TOC entry 2122 (class 2604 OID 411444)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY directores ALTER COLUMN id SET DEFAULT nextval('directores_id_seq'::regclass);


--
-- TOC entry 2139 (class 2604 OID 411523)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY empresas_relacionadas ALTER COLUMN id SET DEFAULT nextval('empresas_relacionadas_id_seq'::regclass);


--
-- TOC entry 2126 (class 2604 OID 411455)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY estatus_contratistas ALTER COLUMN id SET DEFAULT nextval('estatus_contratistas_id_seq'::regclass);


--
-- TOC entry 2148 (class 2604 OID 411601)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY nombres_cajas ALTER COLUMN id SET DEFAULT nextval('nombres_cajas_id_seq'::regclass);


--
-- TOC entry 2154 (class 2604 OID 411633)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY notas_revelatorias ALTER COLUMN id SET DEFAULT nextval('notas_revelatorias_id_seq'::regclass);


--
-- TOC entry 2119 (class 2604 OID 411432)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY personas_juridicas ALTER COLUMN id SET DEFAULT nextval('personas_juridicas_id_seq'::regclass);


--
-- TOC entry 2116 (class 2604 OID 411415)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY personas_naturales ALTER COLUMN id SET DEFAULT nextval('personas_naturales_id_seq'::regclass);


--
-- TOC entry 2145 (class 2604 OID 411563)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY repr_legales ALTER COLUMN id SET DEFAULT nextval('repr_legales_id_seq'::regclass);


--
-- TOC entry 2113 (class 2604 OID 411399)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY sys_bancos ALTER COLUMN id SET DEFAULT nextval('sys_bancos_id_seq'::regclass);


--
-- TOC entry 2150 (class 2604 OID 411617)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY sys_divisas ALTER COLUMN id SET DEFAULT nextval('sys_monedas_id_seq'::regclass);


--
-- TOC entry 2110 (class 2604 OID 411387)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY sys_inpc ALTER COLUMN id SET DEFAULT nextval('inpc_id_seq'::regclass);


--
-- TOC entry 2135 (class 2604 OID 411493)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY sys_naturales_juridicas ALTER COLUMN id SET DEFAULT nextval('naturales_juridicas_id_seq'::regclass);


--
-- TOC entry 2231 (class 2604 OID 412092)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY sys_tasas_divisas ALTER COLUMN id SET DEFAULT nextval('sys_tasas_divisas_id_seq'::regclass);


SET search_path = activos, pg_catalog;

--
-- TOC entry 2604 (class 0 OID 411792)
-- Dependencies: 221
-- Data for Name: activos_biologicos; Type: TABLE DATA; Schema: activos; Owner: postgres
--

COPY activos_biologicos (id, bien_id, catidad, certificado, num_certificado, detalles, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 0)
-- Dependencies: 220
-- Name: activos_biologicos_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: postgres
--

SELECT pg_catalog.setval('activos_biologicos_id_seq', 1, false);


--
-- TOC entry 2606 (class 0 OID 411812)
-- Dependencies: 223
-- Data for Name: activos_intangibles; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY activos_intangibles (id, bien_id, certificado_registro, fecha_registro, vigencia, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 0)
-- Dependencies: 222
-- Name: activos_intangibles_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('activos_intangibles_id_seq', 1, false);


--
-- TOC entry 2616 (class 0 OID 411913)
-- Dependencies: 233
-- Data for Name: avaluos; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY avaluos (id, bien_id, valor, fecha_informe, perito_id, gremio_id, num_inscripcion_gremio, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 0)
-- Dependencies: 232
-- Name: avaluos_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('avaluos_id_seq', 1, false);


--
-- TOC entry 2594 (class 0 OID 411698)
-- Dependencies: 211
-- Data for Name: bienes; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY bienes (id, sys_tipo_bien_id, principio_contable, depreciable, deterioro, detalle, origen, fecha_origen, contratista_id, propio) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 0)
-- Dependencies: 210
-- Name: bienes_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('bienes_id_seq', 1, false);


--
-- TOC entry 2642 (class 0 OID 412193)
-- Dependencies: 259
-- Data for Name: construcciones_inmuebles; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY construcciones_inmuebles (id, bien_id, area_construccion, porcentaje_ejecucion, monto_ejecutado, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 0)
-- Dependencies: 258
-- Name: construcciones_inmuebles_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('construcciones_inmuebles_id_seq', 1, false);


--
-- TOC entry 2596 (class 0 OID 411721)
-- Dependencies: 213
-- Data for Name: datos_importacion; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY datos_importacion (id, bien_id, num_guia_nac, costo_adquisicion, gastos_mon_extranjera, sys_moneda_id, tasa_cambio, gastos_imp_nacional, otros_costros_imp_instalacion, total_costo_adquisicion, sys_status, sys_fecha, pais_origen_id) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 0)
-- Dependencies: 212
-- Name: datos_importacion_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('datos_importacion_id_seq', 1, false);


--
-- TOC entry 2618 (class 0 OID 411938)
-- Dependencies: 235
-- Data for Name: depresiaciones_amortizaciones; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY depresiaciones_amortizaciones (id, bien_id, costo_adquisicion_avaluo, fecha_adquisicion_avaluo, vida_util, valor_residual, valor_depreciar, tasa_anual, unidades_estimadas, bs_unidad, unidades_producidas_periodo, unidades_consumidas, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 2990 (class 0 OID 0)
-- Dependencies: 234
-- Name: depresiaciones_amortizaciones_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('depresiaciones_amortizaciones_id_seq', 1, false);


--
-- TOC entry 2628 (class 0 OID 412035)
-- Dependencies: 245
-- Data for Name: desincorporacion_activos; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY desincorporacion_activos (id, sys_motivo_id, fecha, precio_venta, valor_neto_libro, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 0)
-- Dependencies: 244
-- Name: desincorporacion_activos_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('desincorporacion_activos_id_seq', 1, false);


--
-- TOC entry 2624 (class 0 OID 412005)
-- Dependencies: 241
-- Data for Name: deterioros; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY deterioros (id, bien_id, valor_razonable, costo_disposicion, valor_uso, acumulado_ejer_ant, ejercicios_anteriores, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 0)
-- Dependencies: 240
-- Name: deterioros_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('deterioros_id_seq', 1, false);


--
-- TOC entry 2612 (class 0 OID 411872)
-- Dependencies: 229
-- Data for Name: documentos_registrados; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY documentos_registrados (id, contratista_id, sys_tipo_documento_id, sys_tipo_registro_id, circunscripcion, num_registro_notaria, tomo, folio, fecha_registro, valor_adquisicion, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 0)
-- Dependencies: 228
-- Name: documentos_registrados_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('documentos_registrados_id_seq', 1, false);


--
-- TOC entry 2644 (class 0 OID 412208)
-- Dependencies: 261
-- Data for Name: fabricaciones_muebles; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY fabricaciones_muebles (id, bien_id, cantidad, porcentaje_fabricacion, monto_ejecutado, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 2994 (class 0 OID 0)
-- Dependencies: 260
-- Name: fabricaciones_muebles_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('fabricaciones_muebles_id_seq', 1, false);


--
-- TOC entry 2610 (class 0 OID 411842)
-- Dependencies: 227
-- Data for Name: facturas; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY facturas (id, num_factura, proveedor_id, fecha_emision, imprenta_id, fecha_emision_talonario, comprador_id, base_imponible_gravable, execto, iva, contratista_id, bien_id) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 0)
-- Dependencies: 226
-- Name: facturas_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('facturas_id_seq', 1, false);


--
-- TOC entry 2598 (class 0 OID 411741)
-- Dependencies: 215
-- Data for Name: inmuebles; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY inmuebles (id, bien_id, descripcion, direccion_ubicacion, ficha_catastral, zonificacion, extension, titulo_supletorio, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 0)
-- Dependencies: 214
-- Name: inmuebles_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('inmuebles_id_seq', 1, false);


--
-- TOC entry 2608 (class 0 OID 411827)
-- Dependencies: 225
-- Data for Name: licencia; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY licencia (id, activo_intangible_id, numero, fecha_adquisicion, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 2997 (class 0 OID 0)
-- Dependencies: 224
-- Name: licencia_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('licencia_id_seq', 1, false);


--
-- TOC entry 2622 (class 0 OID 411968)
-- Dependencies: 239
-- Data for Name: medicion; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY medicion (id, bien_id, medicion_activo, sys_metodo_medicion_id, sys_status, sys_fecha, aplica_deterioro, vinculado_proceso_productivo, vinculado_proceso_ventas) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 0)
-- Dependencies: 238
-- Name: medicion_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('medicion_id_seq', 1, false);


--
-- TOC entry 2999 (class 0 OID 0)
-- Dependencies: 246
-- Name: mejoras_propiedad_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('mejoras_propiedad_id_seq', 1, false);


--
-- TOC entry 2630 (class 0 OID 412050)
-- Dependencies: 247
-- Data for Name: mejoras_propiedades; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY mejoras_propiedades (id, clasificacion, sys_tipo_bien_id, principio_contable_id, depreciacion, deterioro, sys_status, sys_fecha, bien_id, monto, fecha, capitalizable) FROM stdin;
\.


--
-- TOC entry 2600 (class 0 OID 411759)
-- Dependencies: 217
-- Data for Name: muebles; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY muebles (id, bien_id, marca, modelo, serial, cantiad, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 0)
-- Dependencies: 216
-- Name: muebles_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('muebles_id_seq', 1, false);


--
-- TOC entry 2640 (class 0 OID 412167)
-- Dependencies: 257
-- Data for Name: sys_ciudades; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY sys_ciudades (id, sys_estado_id, nombre, codigo_postal, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 3001 (class 0 OID 0)
-- Dependencies: 256
-- Name: sys_ciudades_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('sys_ciudades_id_seq', 1, false);


--
-- TOC entry 2634 (class 0 OID 412106)
-- Dependencies: 251
-- Data for Name: sys_clasificaciones_bien; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY sys_clasificaciones_bien (id, nombre, descripcion, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 0)
-- Dependencies: 250
-- Name: sys_clasificaciones_bien_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('sys_clasificaciones_bien_id_seq', 1, false);


--
-- TOC entry 2638 (class 0 OID 412152)
-- Dependencies: 255
-- Data for Name: sys_estados; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY sys_estados (id, sys_pais_id, nombre, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 3003 (class 0 OID 0)
-- Dependencies: 254
-- Name: sys_estados_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('sys_estados_id_seq', 1, false);


--
-- TOC entry 2592 (class 0 OID 411683)
-- Dependencies: 209
-- Data for Name: sys_formas_org; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY sys_formas_org (id, nombre, descripcion, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 0)
-- Dependencies: 208
-- Name: sys_formas_org_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('sys_formas_org_id_seq', 1, false);


--
-- TOC entry 2614 (class 0 OID 411895)
-- Dependencies: 231
-- Data for Name: sys_gremios; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY sys_gremios (id, persona_juridica_id, direccion, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 0)
-- Dependencies: 230
-- Name: sys_gremios_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('sys_gremios_id_seq', 1, false);


--
-- TOC entry 2620 (class 0 OID 411953)
-- Dependencies: 237
-- Data for Name: sys_metodo_medicion; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY sys_metodo_medicion (id, nombre, descripcion, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 3006 (class 0 OID 0)
-- Dependencies: 236
-- Name: sys_metodo_medicion_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('sys_metodo_medicion_id_seq', 1, false);


--
-- TOC entry 2626 (class 0 OID 412020)
-- Dependencies: 243
-- Data for Name: sys_motivios; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY sys_motivios (id, nombre, descripcion, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 0)
-- Dependencies: 242
-- Name: sys_motivios_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('sys_motivios_id_seq', 1, false);


--
-- TOC entry 2636 (class 0 OID 412140)
-- Dependencies: 253
-- Data for Name: sys_paises; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY sys_paises (id, nombre, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 3008 (class 0 OID 0)
-- Dependencies: 252
-- Name: sys_paises_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('sys_paises_id_seq', 1, false);


--
-- TOC entry 3009 (class 0 OID 0)
-- Dependencies: 206
-- Name: sys_tipo_bien_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: postgres
--

SELECT pg_catalog.setval('sys_tipo_bien_id_seq', 1, false);


--
-- TOC entry 2588 (class 0 OID 411655)
-- Dependencies: 205
-- Data for Name: sys_tipo_documento; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY sys_tipo_documento (id, nombre, estado, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 3010 (class 0 OID 0)
-- Dependencies: 204
-- Name: sys_tipo_documento_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('sys_tipo_documento_id_seq', 1, false);


--
-- TOC entry 2590 (class 0 OID 411669)
-- Dependencies: 207
-- Data for Name: sys_tipos_bienes; Type: TABLE DATA; Schema: activos; Owner: postgres
--

COPY sys_tipos_bienes (id, nombre, sys_status, sys_fecha, descripcion, sys_clasificacion_bien_id) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 412229)
-- Dependencies: 263
-- Data for Name: sys_tipos_registros; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY sys_tipos_registros (id, nombre, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 0)
-- Dependencies: 262
-- Name: sys_tipos_registros_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('sys_tipos_registros_id_seq', 1, false);


--
-- TOC entry 2602 (class 0 OID 411777)
-- Dependencies: 219
-- Data for Name: vehiculos; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY vehiculos (id, mueble_id, anho, uso, num_certificado, placa, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 3012 (class 0 OID 0)
-- Dependencies: 218
-- Name: vehiculos_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('vehiculos_id_seq', 1, false);


SET search_path = public, pg_catalog;

--
-- TOC entry 2578 (class 0 OID 411540)
-- Dependencies: 195
-- Data for Name: accionistas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY accionistas (id, contratista_id, natural_juridica_id, porcentaje_accionario, valor_compra, fecha, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 3013 (class 0 OID 0)
-- Dependencies: 194
-- Name: accionistas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('accionistas_id_seq', 1, false);


--
-- TOC entry 2570 (class 0 OID 411477)
-- Dependencies: 187
-- Data for Name: bancos_contratistas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY bancos_contratistas (id, banco_id, contratista_id, num_cuenta, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 0)
-- Dependencies: 186
-- Name: bancos_contratistas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('bancos_contratistas_id_seq', 1, false);


--
-- TOC entry 2568 (class 0 OID 411464)
-- Dependencies: 185
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY clientes (id, nombre, publico, contratista_id, sys_status, sys_fecha, natural_juridico_id) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 0)
-- Dependencies: 184
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('clientes_id_seq', 1, false);


--
-- TOC entry 2574 (class 0 OID 411502)
-- Dependencies: 191
-- Data for Name: contratistas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY contratistas (id, natural_juridica_id, estatus_contratista_id) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 0)
-- Dependencies: 190
-- Name: contratistas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('contratistas_id_seq', 1, false);


--
-- TOC entry 2564 (class 0 OID 411441)
-- Dependencies: 181
-- Data for Name: directores; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY directores (id, miembro_junta, sys_status, sys_fecha, persona_natural_id) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 0)
-- Dependencies: 180
-- Name: directores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('directores_id_seq', 1, false);


--
-- TOC entry 2576 (class 0 OID 411520)
-- Dependencies: 193
-- Data for Name: empresas_relacionadas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY empresas_relacionadas (id, persona_juridica_id, contratista_id, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 0)
-- Dependencies: 192
-- Name: empresas_relacionadas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('empresas_relacionadas_id_seq', 1, false);


--
-- TOC entry 2566 (class 0 OID 411452)
-- Dependencies: 183
-- Data for Name: estatus_contratistas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY estatus_contratistas (id, descripcion, informacion_adicional, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 3019 (class 0 OID 0)
-- Dependencies: 182
-- Name: estatus_contratistas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('estatus_contratistas_id_seq', 1, false);


--
-- TOC entry 3020 (class 0 OID 0)
-- Dependencies: 172
-- Name: inpc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('inpc_id_seq', 1, false);


--
-- TOC entry 3021 (class 0 OID 0)
-- Dependencies: 188
-- Name: naturales_juridicas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('naturales_juridicas_id_seq', 1, false);


--
-- TOC entry 2582 (class 0 OID 411598)
-- Dependencies: 199
-- Data for Name: nombres_cajas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY nombres_cajas (id, nombre, contratistas_id, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 0)
-- Dependencies: 198
-- Name: nombres_cajas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('nombres_cajas_id_seq', 1, false);


--
-- TOC entry 2586 (class 0 OID 411630)
-- Dependencies: 203
-- Data for Name: notas_revelatorias; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY notas_revelatorias (id, nota, contratista_id, usuario_id, estado, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 0)
-- Dependencies: 202
-- Name: notas_revelatorias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('notas_revelatorias_id_seq', 1, false);


--
-- TOC entry 2562 (class 0 OID 411429)
-- Dependencies: 179
-- Data for Name: personas_juridicas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY personas_juridicas (id, rif, razon_social, sys_status, sys_fecha, creado_por) FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 0)
-- Dependencies: 178
-- Name: personas_juridicas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('personas_juridicas_id_seq', 1, false);


--
-- TOC entry 2560 (class 0 OID 411412)
-- Dependencies: 177
-- Data for Name: personas_naturales; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY personas_naturales (id, nombre, apellido, rif, ci, sys_status, sys_fecha, creado_por) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 0)
-- Dependencies: 176
-- Name: personas_naturales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('personas_naturales_id_seq', 1, false);


--
-- TOC entry 2580 (class 0 OID 411560)
-- Dependencies: 197
-- Data for Name: repr_legales; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY repr_legales (id, contratista_id, persona_natural_id, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 0)
-- Dependencies: 196
-- Name: repr_legales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('repr_legales_id_seq', 1, false);


--
-- TOC entry 2558 (class 0 OID 411396)
-- Dependencies: 175
-- Data for Name: sys_bancos; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY sys_bancos (id, nombre, rif, codigo_sudeban, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 0)
-- Dependencies: 174
-- Name: sys_bancos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('sys_bancos_id_seq', 1, false);


--
-- TOC entry 2584 (class 0 OID 411614)
-- Dependencies: 201
-- Data for Name: sys_divisas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY sys_divisas (id, nombre, codigo, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 2556 (class 0 OID 411384)
-- Dependencies: 173
-- Data for Name: sys_inpc; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY sys_inpc (id, mes, indice, anho, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 3028 (class 0 OID 0)
-- Dependencies: 200
-- Name: sys_monedas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('sys_monedas_id_seq', 1, false);


--
-- TOC entry 2572 (class 0 OID 411490)
-- Dependencies: 189
-- Data for Name: sys_naturales_juridicas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY sys_naturales_juridicas (id, rif, juridica, sys_status, sys_fecha, denominacion) FROM stdin;
\.


--
-- TOC entry 2632 (class 0 OID 412089)
-- Dependencies: 249
-- Data for Name: sys_tasas_divisas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY sys_tasas_divisas (id, sys_divisa_id, tasa, sys_status, sys_fecha) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 0)
-- Dependencies: 248
-- Name: sys_tasas_divisas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('sys_tasas_divisas_id_seq', 1, false);


SET search_path = activos, pg_catalog;

--
-- TOC entry 2336 (class 2606 OID 411803)
-- Name: activos_biologicos_pkey; Type: CONSTRAINT; Schema: activos; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY activos_biologicos
    ADD CONSTRAINT activos_biologicos_pkey PRIMARY KEY (id);


--
-- TOC entry 2338 (class 2606 OID 411819)
-- Name: activos_intangibles_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY activos_intangibles
    ADD CONSTRAINT activos_intangibles_pkey PRIMARY KEY (id);


--
-- TOC entry 2352 (class 2606 OID 411920)
-- Name: avaluos_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY avaluos
    ADD CONSTRAINT avaluos_pkey PRIMARY KEY (id);


--
-- TOC entry 2325 (class 2606 OID 411708)
-- Name: bienes_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY bienes
    ADD CONSTRAINT bienes_pkey PRIMARY KEY (id);


--
-- TOC entry 2389 (class 2606 OID 412200)
-- Name: construcciones_inmuebles_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY construcciones_inmuebles
    ADD CONSTRAINT construcciones_inmuebles_pkey PRIMARY KEY (id);


--
-- TOC entry 2327 (class 2606 OID 411728)
-- Name: datos_importacion_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY datos_importacion
    ADD CONSTRAINT datos_importacion_pkey PRIMARY KEY (id);


--
-- TOC entry 2354 (class 2606 OID 411945)
-- Name: depresiaciones_amortizaciones_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY depresiaciones_amortizaciones
    ADD CONSTRAINT depresiaciones_amortizaciones_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 412042)
-- Name: desincorporacion_activos_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY desincorporacion_activos
    ADD CONSTRAINT desincorporacion_activos_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 412012)
-- Name: deterioros_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY deterioros
    ADD CONSTRAINT deterioros_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 411882)
-- Name: documentos_registrados_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY documentos_registrados
    ADD CONSTRAINT documentos_registrados_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 412215)
-- Name: fabricaciones_muebles_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY fabricaciones_muebles
    ADD CONSTRAINT fabricaciones_muebles_pkey PRIMARY KEY (id);


--
-- TOC entry 2342 (class 2606 OID 411847)
-- Name: facturas_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 411849)
-- Name: facturas_proveedor_id_num_factura_key; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_proveedor_id_num_factura_key UNIQUE (proveedor_id, num_factura);


--
-- TOC entry 2330 (class 2606 OID 411751)
-- Name: inmuebles_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY inmuebles
    ADD CONSTRAINT inmuebles_pkey PRIMARY KEY (id);


--
-- TOC entry 2340 (class 2606 OID 411834)
-- Name: licencia_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY licencia
    ADD CONSTRAINT licencia_pkey PRIMARY KEY (id);


--
-- TOC entry 2360 (class 2606 OID 411976)
-- Name: medicion_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY medicion
    ADD CONSTRAINT medicion_pkey PRIMARY KEY (id);


--
-- TOC entry 2371 (class 2606 OID 412060)
-- Name: mejoras_propiedad_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY mejoras_propiedades
    ADD CONSTRAINT mejoras_propiedad_pkey PRIMARY KEY (id);


--
-- TOC entry 2332 (class 2606 OID 411769)
-- Name: muebles_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY muebles
    ADD CONSTRAINT muebles_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 412177)
-- Name: sys_ciudades_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_ciudades
    ADD CONSTRAINT sys_ciudades_pkey PRIMARY KEY (id);


--
-- TOC entry 2387 (class 2606 OID 412179)
-- Name: sys_ciudades_sys_estado_id_nombre_key; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_ciudades
    ADD CONSTRAINT sys_ciudades_sys_estado_id_nombre_key UNIQUE (sys_estado_id, nombre);


--
-- TOC entry 2377 (class 2606 OID 412116)
-- Name: sys_clasificaciones_bien_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_clasificaciones_bien
    ADD CONSTRAINT sys_clasificaciones_bien_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 412159)
-- Name: sys_estados_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_estados
    ADD CONSTRAINT sys_estados_pkey PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 411695)
-- Name: sys_formas_org_nombre_key; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_formas_org
    ADD CONSTRAINT sys_formas_org_nombre_key UNIQUE (nombre);


--
-- TOC entry 2323 (class 2606 OID 411693)
-- Name: sys_formas_org_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_formas_org
    ADD CONSTRAINT sys_formas_org_pkey PRIMARY KEY (id);


--
-- TOC entry 2350 (class 2606 OID 411905)
-- Name: sys_gremios_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_gremios
    ADD CONSTRAINT sys_gremios_pkey PRIMARY KEY (id);


--
-- TOC entry 2356 (class 2606 OID 411965)
-- Name: sys_metodo_medicion_nombre_key; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_metodo_medicion
    ADD CONSTRAINT sys_metodo_medicion_nombre_key UNIQUE (nombre);


--
-- TOC entry 2358 (class 2606 OID 411963)
-- Name: sys_metodo_medicion_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_metodo_medicion
    ADD CONSTRAINT sys_metodo_medicion_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 412032)
-- Name: sys_motivios_nombre_key; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_motivios
    ADD CONSTRAINT sys_motivios_nombre_key UNIQUE (nombre);


--
-- TOC entry 2366 (class 2606 OID 412030)
-- Name: sys_motivios_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_motivios
    ADD CONSTRAINT sys_motivios_pkey PRIMARY KEY (id);


--
-- TOC entry 2379 (class 2606 OID 412149)
-- Name: sys_paises_nombre_key; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_paises
    ADD CONSTRAINT sys_paises_nombre_key UNIQUE (nombre);


--
-- TOC entry 2381 (class 2606 OID 412147)
-- Name: sys_paises_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_paises
    ADD CONSTRAINT sys_paises_pkey PRIMARY KEY (id);


--
-- TOC entry 2317 (class 2606 OID 411680)
-- Name: sys_tipo_bien_nombre_key; Type: CONSTRAINT; Schema: activos; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sys_tipos_bienes
    ADD CONSTRAINT sys_tipo_bien_nombre_key UNIQUE (nombre);


--
-- TOC entry 2319 (class 2606 OID 411678)
-- Name: sys_tipo_bien_pkey; Type: CONSTRAINT; Schema: activos; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sys_tipos_bienes
    ADD CONSTRAINT sys_tipo_bien_pkey PRIMARY KEY (id);


--
-- TOC entry 2312 (class 2606 OID 411665)
-- Name: sys_tipo_documento_nombre_key; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_tipo_documento
    ADD CONSTRAINT sys_tipo_documento_nombre_key UNIQUE (nombre);


--
-- TOC entry 2314 (class 2606 OID 411663)
-- Name: sys_tipo_documento_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_tipo_documento
    ADD CONSTRAINT sys_tipo_documento_pkey PRIMARY KEY (id);


--
-- TOC entry 2393 (class 2606 OID 412237)
-- Name: sys_tipos_registros_nombre_key; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_tipos_registros
    ADD CONSTRAINT sys_tipos_registros_nombre_key UNIQUE (nombre);


--
-- TOC entry 2395 (class 2606 OID 412235)
-- Name: sys_tipos_registros_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_tipos_registros
    ADD CONSTRAINT sys_tipos_registros_pkey PRIMARY KEY (id);


--
-- TOC entry 2334 (class 2606 OID 411784)
-- Name: vehiculos_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY vehiculos
    ADD CONSTRAINT vehiculos_pkey PRIMARY KEY (id);


SET search_path = public, pg_catalog;

--
-- TOC entry 2298 (class 2606 OID 411547)
-- Name: accionistas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY accionistas
    ADD CONSTRAINT accionistas_pkey PRIMARY KEY (id);


--
-- TOC entry 2284 (class 2606 OID 411486)
-- Name: bancos_contratistas_num_cuenta_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY bancos_contratistas
    ADD CONSTRAINT bancos_contratistas_num_cuenta_key UNIQUE (num_cuenta);


--
-- TOC entry 2286 (class 2606 OID 411484)
-- Name: bancos_contratistas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY bancos_contratistas
    ADD CONSTRAINT bancos_contratistas_pkey PRIMARY KEY (id);


--
-- TOC entry 2280 (class 2606 OID 411472)
-- Name: clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- TOC entry 2294 (class 2606 OID 411507)
-- Name: contratistas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contratistas
    ADD CONSTRAINT contratistas_pkey PRIMARY KEY (id);


--
-- TOC entry 2275 (class 2606 OID 411449)
-- Name: directores_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY directores
    ADD CONSTRAINT directores_pkey PRIMARY KEY (id);


--
-- TOC entry 2296 (class 2606 OID 411527)
-- Name: empresas_relacionadas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY empresas_relacionadas
    ADD CONSTRAINT empresas_relacionadas_pkey PRIMARY KEY (id);


--
-- TOC entry 2278 (class 2606 OID 411461)
-- Name: estatus_contratistas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY estatus_contratistas
    ADD CONSTRAINT estatus_contratistas_pkey PRIMARY KEY (id);


--
-- TOC entry 2255 (class 2606 OID 411393)
-- Name: inpc_mes_anho_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_inpc
    ADD CONSTRAINT inpc_mes_anho_key UNIQUE (mes, anho);


--
-- TOC entry 2257 (class 2606 OID 411391)
-- Name: inpc_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_inpc
    ADD CONSTRAINT inpc_pkey PRIMARY KEY (id);


--
-- TOC entry 2290 (class 2606 OID 411497)
-- Name: naturales_juridicas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_naturales_juridicas
    ADD CONSTRAINT naturales_juridicas_pkey PRIMARY KEY (id);


--
-- TOC entry 2292 (class 2606 OID 411499)
-- Name: naturales_juridicas_rif_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_naturales_juridicas
    ADD CONSTRAINT naturales_juridicas_rif_key UNIQUE (rif);


--
-- TOC entry 2302 (class 2606 OID 411606)
-- Name: nombres_cajas_nombre_contratistas_id_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY nombres_cajas
    ADD CONSTRAINT nombres_cajas_nombre_contratistas_id_key UNIQUE (nombre, contratistas_id);


--
-- TOC entry 2304 (class 2606 OID 411604)
-- Name: nombres_cajas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY nombres_cajas
    ADD CONSTRAINT nombres_cajas_pkey PRIMARY KEY (id);


--
-- TOC entry 2310 (class 2606 OID 411641)
-- Name: notas_revelatorias_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY notas_revelatorias
    ADD CONSTRAINT notas_revelatorias_pkey PRIMARY KEY (id);


--
-- TOC entry 2271 (class 2606 OID 411436)
-- Name: personas_juridicas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY personas_juridicas
    ADD CONSTRAINT personas_juridicas_pkey PRIMARY KEY (id);


--
-- TOC entry 2273 (class 2606 OID 411438)
-- Name: personas_juridicas_rif_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY personas_juridicas
    ADD CONSTRAINT personas_juridicas_rif_key UNIQUE (rif);


--
-- TOC entry 2265 (class 2606 OID 411424)
-- Name: personas_naturales_ci_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY personas_naturales
    ADD CONSTRAINT personas_naturales_ci_key UNIQUE (ci);


--
-- TOC entry 2267 (class 2606 OID 411422)
-- Name: personas_naturales_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY personas_naturales
    ADD CONSTRAINT personas_naturales_pkey PRIMARY KEY (id);


--
-- TOC entry 2269 (class 2606 OID 411426)
-- Name: personas_naturales_rif_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY personas_naturales
    ADD CONSTRAINT personas_naturales_rif_key UNIQUE (rif);


--
-- TOC entry 2300 (class 2606 OID 411567)
-- Name: repr_legales_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY repr_legales
    ADD CONSTRAINT repr_legales_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 411407)
-- Name: sys_bancos_codigo_sudeban_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_bancos
    ADD CONSTRAINT sys_bancos_codigo_sudeban_key UNIQUE (codigo_sudeban);


--
-- TOC entry 2261 (class 2606 OID 411403)
-- Name: sys_bancos_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_bancos
    ADD CONSTRAINT sys_bancos_pkey PRIMARY KEY (id);


--
-- TOC entry 2263 (class 2606 OID 411405)
-- Name: sys_bancos_rif_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_bancos
    ADD CONSTRAINT sys_bancos_rif_key UNIQUE (rif);


--
-- TOC entry 2306 (class 2606 OID 411627)
-- Name: sys_monedas_nombre_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_divisas
    ADD CONSTRAINT sys_monedas_nombre_key UNIQUE (nombre);


--
-- TOC entry 2308 (class 2606 OID 411623)
-- Name: sys_monedas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_divisas
    ADD CONSTRAINT sys_monedas_pkey PRIMARY KEY (id);


--
-- TOC entry 2373 (class 2606 OID 412096)
-- Name: sys_tasas_divisas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_tasas_divisas
    ADD CONSTRAINT sys_tasas_divisas_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 412103)
-- Name: sys_tasas_divisas_sys_divisa_id_tasa_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_tasas_divisas
    ADD CONSTRAINT sys_tasas_divisas_sys_divisa_id_tasa_key UNIQUE (sys_divisa_id, tasa);


SET search_path = activos, pg_catalog;

--
-- TOC entry 2345 (class 1259 OID 412226)
-- Name: fki_bienes_facturas; Type: INDEX; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE INDEX fki_bienes_facturas ON facturas USING btree (bien_id);


--
-- TOC entry 2369 (class 1259 OID 412249)
-- Name: fki_bienes_mejoras; Type: INDEX; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE INDEX fki_bienes_mejoras ON mejoras_propiedades USING btree (bien_id);


--
-- TOC entry 2315 (class 1259 OID 412125)
-- Name: fki_clasificacion_bien_tipos_bienes; Type: INDEX; Schema: activos; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_clasificacion_bien_tipos_bienes ON sys_tipos_bienes USING btree (sys_clasificacion_bien_id);


--
-- TOC entry 2328 (class 1259 OID 412190)
-- Name: fki_pais_datos_importacion; Type: INDEX; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE INDEX fki_pais_datos_importacion ON datos_importacion USING btree (pais_origen_id);


--
-- TOC entry 2348 (class 1259 OID 412243)
-- Name: fki_tipos_registros_registrados; Type: INDEX; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE INDEX fki_tipos_registros_registrados ON documentos_registrados USING btree (sys_tipo_registro_id);


SET search_path = public, pg_catalog;

--
-- TOC entry 2287 (class 1259 OID 411589)
-- Name: fki_bancos_contratistas; Type: INDEX; Schema: public; Owner: eureka; Tablespace: 
--

CREATE INDEX fki_bancos_contratistas ON bancos_contratistas USING btree (contratista_id);


--
-- TOC entry 2281 (class 1259 OID 411583)
-- Name: fki_contratista_clientes; Type: INDEX; Schema: public; Owner: eureka; Tablespace: 
--

CREATE INDEX fki_contratista_clientes ON clientes USING btree (contratista_id);


--
-- TOC entry 2276 (class 1259 OID 411652)
-- Name: fki_persona_natural; Type: INDEX; Schema: public; Owner: eureka; Tablespace: 
--

CREATE INDEX fki_persona_natural ON directores USING btree (persona_natural_id);


--
-- TOC entry 2288 (class 1259 OID 411595)
-- Name: fki_sys_bancos_contratistas; Type: INDEX; Schema: public; Owner: eureka; Tablespace: 
--

CREATE INDEX fki_sys_bancos_contratistas ON bancos_contratistas USING btree (banco_id);


--
-- TOC entry 2282 (class 1259 OID 412081)
-- Name: fki_sys_naturales_juridicos; Type: INDEX; Schema: public; Owner: eureka; Tablespace: 
--

CREATE INDEX fki_sys_naturales_juridicos ON clientes USING btree (natural_juridico_id);


SET search_path = activos, pg_catalog;

--
-- TOC entry 2420 (class 2606 OID 411804)
-- Name: activos_biologicos_bien_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: postgres
--

ALTER TABLE ONLY activos_biologicos
    ADD CONSTRAINT activos_biologicos_bien_id_fkey FOREIGN KEY (bien_id) REFERENCES bienes(id);


--
-- TOC entry 2421 (class 2606 OID 411820)
-- Name: activos_intangibles_bien_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY activos_intangibles
    ADD CONSTRAINT activos_intangibles_bien_id_fkey FOREIGN KEY (bien_id) REFERENCES bienes(id);


--
-- TOC entry 2432 (class 2606 OID 411921)
-- Name: avaluos_bien_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY avaluos
    ADD CONSTRAINT avaluos_bien_id_fkey FOREIGN KEY (bien_id) REFERENCES bienes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2434 (class 2606 OID 411931)
-- Name: avaluos_gremio_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY avaluos
    ADD CONSTRAINT avaluos_gremio_id_fkey FOREIGN KEY (gremio_id) REFERENCES sys_gremios(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2433 (class 2606 OID 411926)
-- Name: avaluos_perito_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY avaluos
    ADD CONSTRAINT avaluos_perito_id_fkey FOREIGN KEY (perito_id) REFERENCES public.personas_naturales(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2412 (class 2606 OID 411709)
-- Name: bienes_contratista_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY bienes
    ADD CONSTRAINT bienes_contratista_id_fkey FOREIGN KEY (contratista_id) REFERENCES public.contratistas(id);


--
-- TOC entry 2413 (class 2606 OID 411714)
-- Name: bienes_principio_contable_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY bienes
    ADD CONSTRAINT bienes_principio_contable_fkey FOREIGN KEY (principio_contable) REFERENCES sys_formas_org(id);


--
-- TOC entry 2446 (class 2606 OID 412201)
-- Name: construcciones_inmuebles_bien_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY construcciones_inmuebles
    ADD CONSTRAINT construcciones_inmuebles_bien_id_fkey FOREIGN KEY (bien_id) REFERENCES bienes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2414 (class 2606 OID 411729)
-- Name: datos_importacion_bien_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY datos_importacion
    ADD CONSTRAINT datos_importacion_bien_id_fkey FOREIGN KEY (bien_id) REFERENCES bienes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2415 (class 2606 OID 411734)
-- Name: datos_importacion_sys_moneda_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY datos_importacion
    ADD CONSTRAINT datos_importacion_sys_moneda_id_fkey FOREIGN KEY (sys_moneda_id) REFERENCES public.sys_divisas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2435 (class 2606 OID 411946)
-- Name: depresiaciones_amortizaciones_bien_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY depresiaciones_amortizaciones
    ADD CONSTRAINT depresiaciones_amortizaciones_bien_id_fkey FOREIGN KEY (bien_id) REFERENCES bienes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2439 (class 2606 OID 412043)
-- Name: desincorporacion_activos_sys_motivo_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY desincorporacion_activos
    ADD CONSTRAINT desincorporacion_activos_sys_motivo_id_fkey FOREIGN KEY (sys_motivo_id) REFERENCES sys_motivios(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2438 (class 2606 OID 412013)
-- Name: deterioros_bien_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY deterioros
    ADD CONSTRAINT deterioros_bien_id_fkey FOREIGN KEY (bien_id) REFERENCES bienes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2428 (class 2606 OID 411883)
-- Name: documentos_registrados_contratista_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY documentos_registrados
    ADD CONSTRAINT documentos_registrados_contratista_id_fkey FOREIGN KEY (contratista_id) REFERENCES public.contratistas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2429 (class 2606 OID 411888)
-- Name: documentos_registrados_sys_tipo_documento_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY documentos_registrados
    ADD CONSTRAINT documentos_registrados_sys_tipo_documento_id_fkey FOREIGN KEY (sys_tipo_documento_id) REFERENCES sys_tipo_documento(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2447 (class 2606 OID 412216)
-- Name: fabricaciones_muebles_bien_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY fabricaciones_muebles
    ADD CONSTRAINT fabricaciones_muebles_bien_id_fkey FOREIGN KEY (bien_id) REFERENCES bienes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2425 (class 2606 OID 411860)
-- Name: facturas_comprador_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_comprador_id_fkey FOREIGN KEY (comprador_id) REFERENCES public.personas_juridicas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2426 (class 2606 OID 411865)
-- Name: facturas_contratista_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_contratista_id_fkey FOREIGN KEY (contratista_id) REFERENCES public.personas_juridicas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2424 (class 2606 OID 411855)
-- Name: facturas_imprenta_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_imprenta_id_fkey FOREIGN KEY (imprenta_id) REFERENCES public.personas_juridicas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2423 (class 2606 OID 411850)
-- Name: facturas_proveedor_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_proveedor_id_fkey FOREIGN KEY (proveedor_id) REFERENCES public.personas_juridicas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2427 (class 2606 OID 412221)
-- Name: fk_bienes_facturas; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT fk_bienes_facturas FOREIGN KEY (bien_id) REFERENCES bienes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2442 (class 2606 OID 412244)
-- Name: fk_bienes_mejoras; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY mejoras_propiedades
    ADD CONSTRAINT fk_bienes_mejoras FOREIGN KEY (bien_id) REFERENCES bienes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2411 (class 2606 OID 412120)
-- Name: fk_clasificacion_bien_tipos_bienes; Type: FK CONSTRAINT; Schema: activos; Owner: postgres
--

ALTER TABLE ONLY sys_tipos_bienes
    ADD CONSTRAINT fk_clasificacion_bien_tipos_bienes FOREIGN KEY (sys_clasificacion_bien_id) REFERENCES sys_clasificaciones_bien(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2416 (class 2606 OID 412185)
-- Name: fk_pais_datos_importacion; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY datos_importacion
    ADD CONSTRAINT fk_pais_datos_importacion FOREIGN KEY (pais_origen_id) REFERENCES sys_paises(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2430 (class 2606 OID 412238)
-- Name: fk_tipos_registros_registrados; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY documentos_registrados
    ADD CONSTRAINT fk_tipos_registros_registrados FOREIGN KEY (sys_tipo_registro_id) REFERENCES sys_tipos_registros(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2417 (class 2606 OID 411752)
-- Name: inmuebles_bien_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY inmuebles
    ADD CONSTRAINT inmuebles_bien_id_fkey FOREIGN KEY (bien_id) REFERENCES bienes(id);


--
-- TOC entry 2422 (class 2606 OID 411835)
-- Name: licencia_activos_intangibles_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY licencia
    ADD CONSTRAINT licencia_activos_intangibles_id_fkey FOREIGN KEY (activo_intangible_id) REFERENCES activos_intangibles(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2436 (class 2606 OID 411977)
-- Name: medicion_bien_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY medicion
    ADD CONSTRAINT medicion_bien_id_fkey FOREIGN KEY (bien_id) REFERENCES bienes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2437 (class 2606 OID 411982)
-- Name: medicion_sys_metodo_medicion_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY medicion
    ADD CONSTRAINT medicion_sys_metodo_medicion_id_fkey FOREIGN KEY (sys_metodo_medicion_id) REFERENCES sys_metodo_medicion(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2441 (class 2606 OID 412066)
-- Name: mejoras_propiedad_principio_contable_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY mejoras_propiedades
    ADD CONSTRAINT mejoras_propiedad_principio_contable_id_fkey FOREIGN KEY (principio_contable_id) REFERENCES sys_formas_org(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2440 (class 2606 OID 412061)
-- Name: mejoras_propiedad_sys_tipo_bien_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY mejoras_propiedades
    ADD CONSTRAINT mejoras_propiedad_sys_tipo_bien_id_fkey FOREIGN KEY (sys_tipo_bien_id) REFERENCES sys_tipos_bienes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2418 (class 2606 OID 411770)
-- Name: muebles_bien_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY muebles
    ADD CONSTRAINT muebles_bien_id_fkey FOREIGN KEY (bien_id) REFERENCES bienes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2445 (class 2606 OID 412180)
-- Name: sys_ciudades_sys_estado_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY sys_ciudades
    ADD CONSTRAINT sys_ciudades_sys_estado_id_fkey FOREIGN KEY (sys_estado_id) REFERENCES sys_estados(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2444 (class 2606 OID 412160)
-- Name: sys_estados_sys_pais_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY sys_estados
    ADD CONSTRAINT sys_estados_sys_pais_id_fkey FOREIGN KEY (sys_pais_id) REFERENCES sys_paises(id);


--
-- TOC entry 2431 (class 2606 OID 411906)
-- Name: sys_gremios_persona_juridica_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY sys_gremios
    ADD CONSTRAINT sys_gremios_persona_juridica_id_fkey FOREIGN KEY (persona_juridica_id) REFERENCES public.personas_juridicas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2419 (class 2606 OID 411785)
-- Name: vehiculos_mueble_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY vehiculos
    ADD CONSTRAINT vehiculos_mueble_id_fkey FOREIGN KEY (mueble_id) REFERENCES muebles(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = public, pg_catalog;

--
-- TOC entry 2406 (class 2606 OID 411553)
-- Name: accionistas_contratista_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY accionistas
    ADD CONSTRAINT accionistas_contratista_id_fkey FOREIGN KEY (contratista_id) REFERENCES contratistas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2405 (class 2606 OID 411548)
-- Name: accionistas_natural_juridica_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY accionistas
    ADD CONSTRAINT accionistas_natural_juridica_id_fkey FOREIGN KEY (natural_juridica_id) REFERENCES sys_naturales_juridicas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2402 (class 2606 OID 411513)
-- Name: contratistas_estatus_contratista_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratistas
    ADD CONSTRAINT contratistas_estatus_contratista_id_fkey FOREIGN KEY (estatus_contratista_id) REFERENCES estatus_contratistas(id);


--
-- TOC entry 2401 (class 2606 OID 411508)
-- Name: contratistas_natural_juridica_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratistas
    ADD CONSTRAINT contratistas_natural_juridica_id_fkey FOREIGN KEY (natural_juridica_id) REFERENCES sys_naturales_juridicas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2404 (class 2606 OID 411533)
-- Name: empresas_relacionadas_contratista_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY empresas_relacionadas
    ADD CONSTRAINT empresas_relacionadas_contratista_id_fkey FOREIGN KEY (contratista_id) REFERENCES contratistas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2403 (class 2606 OID 411528)
-- Name: empresas_relacionadas_persona_juridica_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY empresas_relacionadas
    ADD CONSTRAINT empresas_relacionadas_persona_juridica_id_fkey FOREIGN KEY (persona_juridica_id) REFERENCES personas_juridicas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2399 (class 2606 OID 411584)
-- Name: fk_bancos_contratistas; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY bancos_contratistas
    ADD CONSTRAINT fk_bancos_contratistas FOREIGN KEY (contratista_id) REFERENCES contratistas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2397 (class 2606 OID 411578)
-- Name: fk_contratista_clientes; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY clientes
    ADD CONSTRAINT fk_contratista_clientes FOREIGN KEY (contratista_id) REFERENCES contratistas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2396 (class 2606 OID 411647)
-- Name: fk_persona_natural; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY directores
    ADD CONSTRAINT fk_persona_natural FOREIGN KEY (persona_natural_id) REFERENCES personas_naturales(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2400 (class 2606 OID 411590)
-- Name: fk_sys_bancos_contratistas; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY bancos_contratistas
    ADD CONSTRAINT fk_sys_bancos_contratistas FOREIGN KEY (banco_id) REFERENCES sys_bancos(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2398 (class 2606 OID 412076)
-- Name: fk_sys_naturales_juridicos; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY clientes
    ADD CONSTRAINT fk_sys_naturales_juridicos FOREIGN KEY (natural_juridico_id) REFERENCES sys_naturales_juridicas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2409 (class 2606 OID 411607)
-- Name: nombres_cajas_contratistas_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY nombres_cajas
    ADD CONSTRAINT nombres_cajas_contratistas_id_fkey FOREIGN KEY (contratistas_id) REFERENCES contratistas(id);


--
-- TOC entry 2410 (class 2606 OID 411642)
-- Name: notas_revelatorias_contratista_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY notas_revelatorias
    ADD CONSTRAINT notas_revelatorias_contratista_id_fkey FOREIGN KEY (contratista_id) REFERENCES contratistas(id);


--
-- TOC entry 2408 (class 2606 OID 411573)
-- Name: repr_legales_contratista_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY repr_legales
    ADD CONSTRAINT repr_legales_contratista_id_fkey FOREIGN KEY (contratista_id) REFERENCES contratistas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2407 (class 2606 OID 411568)
-- Name: repr_legales_persona_natural_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY repr_legales
    ADD CONSTRAINT repr_legales_persona_natural_id_fkey FOREIGN KEY (persona_natural_id) REFERENCES personas_naturales(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2443 (class 2606 OID 412097)
-- Name: sys_tasas_divisas_sys_divisa_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY sys_tasas_divisas
    ADD CONSTRAINT sys_tasas_divisas_sys_divisa_id_fkey FOREIGN KEY (sys_divisa_id) REFERENCES sys_divisas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2653 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-04-04 14:42:54

--
-- PostgreSQL database dump complete
--

