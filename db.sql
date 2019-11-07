-- Table: public.check_in

DROP TABLE public.check_in;

CREATE TABLE public.check_in
(
    id integer NOT NULL,
    id_habitacion integer NOT NULL,
    fecha_entrada character(1)[] COLLATE pg_catalog."default" NOT NULL,
    fecha_salida character(1)[] COLLATE pg_catalog."default" NOT NULL,
    estado boolean NOT NULL,
    id_detalle_prorroga integer,
    id_detalles_usuarios integer,
    CONSTRAINT "Check_in_pkey" PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.check_in
    OWNER to postgres;

-- Table: public.detalles_usuarios

DROP TABLE public.detalles_usuarios;

CREATE TABLE public.detalles_usuarios
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

ALTER TABLE public.detalles_usuarios
    OWNER to postgres;

-- Table: public.habitaciones

DROP TABLE public.habitaciones;

CREATE TABLE public.habitaciones
(
    id integer NOT NULL,
    descripcion character varying(15) COLLATE pg_catalog."default" NOT NULL,
    precio_por_noche integer NOT NULL,
    disponible boolean NOT NULL,
    capacidad integer NOT NULL,
    CONSTRAINT "Habitaciones_pkey" PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.habitaciones
    OWNER to postgres;

-- Table: public.informaciones

DROP TABLE public.informaciones;

CREATE TABLE public.informaciones
(
    id integer NOT NULL,
    titulo character varying(200) COLLATE pg_catalog."default" NOT NULL,
    descripcion character varying(350) COLLATE pg_catalog."default" NOT NULL,
    url_foto character varying(500) COLLATE pg_catalog."default",
    CONSTRAINT "Informaciones_pkey" PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.informaciones
    OWNER to postgres;

-- Table: public.prorrogas

DROP TABLE public.prorrogas;

CREATE TABLE public.prorrogas
(
    id integer NOT NULL,
    id_check_in integer NOT NULL,
    nueva_fecha_salida character varying(30) COLLATE pg_catalog."default",
    cambia_habitacion boolean,
    id_nueva_habitacion integer,
    CONSTRAINT "Prorrogas_pkey" PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.prorrogas
    OWNER to postgres;

-- Table: public.servicio_habitacion

DROP TABLE public.servicio_habitacion;

CREATE TABLE public.servicio_habitacion
(
    id integer NOT NULL,
    id_check_in integer NOT NULL,
    fecha_compra character varying(30) COLLATE pg_catalog."default" NOT NULL,
    id_servicio integer NOT NULL,
    CONSTRAINT "Servicio_habitacion_pkey" PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.servicio_habitacion
    OWNER to postgres;


-- Table: public.servicios

DROP TABLE public.servicios;

CREATE TABLE public.servicios
(
    id integer NOT NULL,
    descripcion character varying(350) COLLATE pg_catalog."default" NOT NULL,
    titulo character varying(200) COLLATE pg_catalog."default" NOT NULL,
    precio_unitario integer NOT NULL,
    CONSTRAINT "Servicios_pkey" PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.servicios
    OWNER to postgres;

-- Table: public.usuarios

DROP TABLE public.usuarios;

CREATE TABLE public.usuarios
(
    id integer NOT NULL,
    nombre character varying(50) COLLATE pg_catalog."default" NOT NULL,
    cc character varying(20) COLLATE pg_catalog."default" NOT NULL,
    edad integer NOT NULL,
    CONSTRAINT usuarios_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.usuarios
    OWNER to postgres;
