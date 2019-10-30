-- Table: public."Check_in"

-- DROP TABLE public."Check_in";

CREATE TABLE public."Check_in"
(
    id integer NOT NULL,
    id_habitacion integer NOT NULL,
    fecha_entrada character varying(30)[] COLLATE pg_catalog."default" NOT NULL,
    fecha_salida character varying(30)[] COLLATE pg_catalog."default" NOT NULL,
    estado boolean NOT NULL,
    id_detalle_prorroga integer,
    id_detalles_usuarios integer,
    CONSTRAINT "Check_in_pkey" PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Check_in"
    OWNER to postgres;


-- Table: public."Detalles_usuarios"

-- DROP TABLE public."Detalles_usuarios";

CREATE TABLE public."Detalles_usuarios"
(
    id integer NOT NULL,
    id_check_in integer NOT NULL,
    id_usuario integer NOT NULL,
    CONSTRAINT "Detalles_usuarios_pkey" PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Detalles_usuarios"
    OWNER to postgres;


-- Table: public."Habitaciones"

-- DROP TABLE public."Habitaciones";

CREATE TABLE public."Habitaciones"
(
    id integer NOT NULL,
    descripcion character varying(15)[] COLLATE pg_catalog."default" NOT NULL,
    precio_por_noche integer NOT NULL,
    disponible boolean NOT NULL,
    capacidad integer NOT NULL,
    CONSTRAINT "Habitaciones_pkey" PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Habitaciones"
    OWNER to postgres;

-- Table: public."Informaciones"

-- DROP TABLE public."Informaciones";

CREATE TABLE public."Informaciones"
(
    id integer NOT NULL,
    titulo character varying(200)[] COLLATE pg_catalog."default" NOT NULL,
    descripcion character varying(350)[] COLLATE pg_catalog."default" NOT NULL,
    url_foto character varying(500)[] COLLATE pg_catalog."default",
    CONSTRAINT "Informaciones_pkey" PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Informaciones"
    OWNER to postgres;

-- Table: public."Prorrogas"

-- DROP TABLE public."Prorrogas";

CREATE TABLE public."Prorrogas"
(
    id integer NOT NULL,
    id_check_in integer NOT NULL,
    nueva_fecha_salida character varying(30)[] COLLATE pg_catalog."default",
    cambia_habitacion boolean,
    id_nueva_habitacion integer,
    CONSTRAINT "Prorrogas_pkey" PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Prorrogas"
    OWNER to postgres;

-- Table: public."Servicio_habitacion"

-- DROP TABLE public."Servicio_habitacion";

CREATE TABLE public."Servicio_habitacion"
(
    id integer NOT NULL,
    id_check_in integer NOT NULL,
    fecha_compra character varying(30)[] COLLATE pg_catalog."default" NOT NULL,
    id_servicio integer NOT NULL,
    CONSTRAINT "Servicio_habitacion_pkey" PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Servicio_habitacion"
    OWNER to postgres;

-- Table: public."Servicios"

-- DROP TABLE public."Servicios";

CREATE TABLE public."Servicios"
(
    id integer NOT NULL,
    descripcion character varying(350)[] COLLATE pg_catalog."default" NOT NULL,
    titulo character varying(200)[] COLLATE pg_catalog."default" NOT NULL,
    precio_unitario integer NOT NULL,
    CONSTRAINT "Servicios_pkey" PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Servicios"
    OWNER to postgres;

-- Table: public.usuarios

-- DROP TABLE public.usuarios;

CREATE TABLE public.usuarios
(
    nombre character varying(50)[] COLLATE pg_catalog."default" NOT NULL,
    id integer NOT NULL,
    edad integer NOT NULL,
    cc character varying(20)[] COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Usuarios_pkey" PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.usuarios
    OWNER to postgres;
