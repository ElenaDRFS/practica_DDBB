CREATE TABLE "Profesores"(
    "Id" BIGINT NOT NULL,
    "Nombre" geography(LINESTRING, 4326) NOT NULL,
    "Vertical" geography(LINESTRING, 4326) NOT NULL,
    "Rol" geography(LINESTRING, 4326) NOT NULL,
    "Promoción" geography(LINESTRING, 4326) NOT NULL,
    "Id_Campus" BIGINT NOT NULL
);
ALTER TABLE
    "Profesores" ADD PRIMARY KEY("Id");
CREATE TABLE "Alumno"(
    "Id_alumno" BIGINT NOT NULL,
    "Nombre" geography(LINESTRING, 4326) NOT NULL,
    "Email" geography(LINESTRING, 4326) NOT NULL,
    "Id_promo" geography(LINESTRING, 4326) NOT NULL,
    "Proyect_1" geography(LINESTRING, 4326) NOT NULL,
    "Proyect_2" geography(LINESTRING, 4326) NOT NULL,
    "Proyect_3" geography(LINESTRING, 4326) NOT NULL,
    "Proyect_4" geography(LINESTRING, 4326) NOT NULL,
    "Proyect_5" geography(LINESTRING, 4326) NOT NULL
);
ALTER TABLE
    "Alumno" ADD PRIMARY KEY("Id_alumno");
CREATE TABLE "Data Science"(
    "Promoción" geography(LINESTRING, 4326) NOT NULL,
    "Fecha_comienzo" DATE NOT NULL,
    "Id_Campus" geography(LINESTRING, 4326) NOT NULL,
    "Id_profesor" BIGINT NOT NULL,
    "Proyect_HLF" BIGINT NOT NULL,
    "Proyect_EDA" BIGINT NOT NULL,
    "Proyect_BBDD" BIGINT NOT NULL,
    "Proyect_ML" BIGINT NOT NULL,
    "Proyect_Deployment" BIGINT NOT NULL,
    "Id_alumno" BIGINT NOT NULL,
    "Id_promo" BIGINT NOT NULL
);
ALTER TABLE
    "Data Science" ADD PRIMARY KEY("Id_promo");
CREATE TABLE "FullStack"(
    "Promoción" geography(LINESTRING, 4326) NOT NULL,
    "Fecha_comienzo" DATE NOT NULL,
    "Id_Campus" geography(LINESTRING, 4326) NOT NULL,
    "Id_profesor" BIGINT NOT NULL,
    "Proyect_WebDev" geography(LINESTRING, 4326) NOT NULL,
    "Proyect_FrontEnd" geography(LINESTRING, 4326) NOT NULL,
    "Proyect_Backend" geography(LINESTRING, 4326) NOT NULL,
    "Proyect_React" geography(LINESTRING, 4326) NOT NULL,
    "Proyect_FullStack" geography(LINESTRING, 4326) NOT NULL,
    "Id_alumno" BIGINT NOT NULL,
    "Id_promo" BIGINT NOT NULL
);
ALTER TABLE
    "FullStack" ADD PRIMARY KEY("Id_promo");
CREATE TABLE "Campus"(
    "id" BIGINT NOT NULL,
    "Localización" geography(LINESTRING, 4326) NOT NULL
);
ALTER TABLE
    "Campus" ADD PRIMARY KEY("id");
ALTER TABLE
    "Data Science" ADD CONSTRAINT "data science_id_profesor_foreign" FOREIGN KEY("Id_profesor") REFERENCES "Profesores"("Id");
ALTER TABLE
    "Profesores" ADD CONSTRAINT "profesores_id_campus_foreign" FOREIGN KEY("Id_Campus") REFERENCES "Campus"("id");
ALTER TABLE
    "FullStack" ADD CONSTRAINT "fullstack_id_alumno_foreign" FOREIGN KEY("Id_alumno") REFERENCES "Alumno"("Id_alumno");
ALTER TABLE
    "FullStack" ADD CONSTRAINT "fullstack_id_profesor_foreign" FOREIGN KEY("Id_profesor") REFERENCES "Profesores"("Id");
ALTER TABLE
    "Data Science" ADD CONSTRAINT "data science_id_alumno_foreign" FOREIGN KEY("Id_alumno") REFERENCES "Alumno"("Id_alumno");
ALTER TABLE
    "Data Science" ADD CONSTRAINT "data science_id_campus_foreign" FOREIGN KEY("Id_Campus") REFERENCES "Campus"("id");
ALTER TABLE
    "FullStack" ADD CONSTRAINT "fullstack_id_campus_foreign" FOREIGN KEY("Id_Campus") REFERENCES "Campus"("id");