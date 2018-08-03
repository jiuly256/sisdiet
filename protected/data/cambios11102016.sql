/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  jrojas
 * Created: 15/08/2016
 */
/**
 * Numero:  1
 * Author:  jrojas
 * Created: 15/08/2016
 * cambio: modificaciones de la base de datos 
 */

alter table mascota alter column longitud type double precision; 

alter table mascota alter column peso type double precision; 

--eliminar tipo alimento adicional
delete from tipo_alimento where id=6;

--issue 1

INSERT INTO raza_mascota (id, id_tipo, descripcion, foto) VALUES (211, 1, 'Otra', NULL);

--issue 2

INSERT INTO unidad_medida (id, descripcion, descripcion_completa, tipo) VALUES (4, 'LT', 'Litro', 'peso');
INSERT INTO unidad_medida (id, descripcion, descripcion_completa, tipo) VALUES (5, 'UNID', 'Unidad', 'peso');

--issue 3

update alimento set descripcion ='LECHOSA' where id=11;

--issue 5
insert into tipo_alimento (id,descripcion) values (7,'Premio'); 
insert into tipo_alimento (id,descripcion) values (0,'Envase');

--con este query vamos a poder crear varias dietas en una misma transaccion
alter table dieta_detalle add column numero integer  default 1;

CREATE TABLE dieta_subdieta
(
  id serial NOT NULL,
  id_dieta integer,
  descripcion character varying,
  monto double precision,
  dias integer,
  total double precision,
  CONSTRAINT dieta_subdieta_pkey PRIMARY KEY (id )
)
WITH (
  OIDS=FALSE
);
ALTER TABLE dieta_subdieta
  OWNER TO postgres;


drop VIEW vistacm;
CREATE OR REPLACE VIEW vistacm AS 
 SELECT a.id, a.cedula, a.nombre, a.apellido, a.sexo, a.direccion, a.telefono, a.telefono_casa, a.correo_electronico, a.created_date, a.modified_date, a.created_by, a.modified_by, b.nombre AS nombre_mascota, b.id_mascota,
( SELECT vistaporcion.cantidad_gramos
           FROM vistaporcion
          WHERE vistaporcion.cantidad >= b.peso AND vistaporcion.cantidad <= (( SELECT b.peso + 5::double precision)) AND vistaporcion.tipo::text = d.tipo::text
         LIMIT 1) AS porcion,(d.tipo || ' (' || d.descripcion || ') ' ) as descripcion,b.peso

   FROM cliente a, mascota b,edad_mascota d
  WHERE a.id = b.id_cliente AND b.clasificacion = d.id;

--para agregar envases y premios

INSERT INTO alimento (descripcion, tipo_alimento, observaciones, id_unidad, cantidad) VALUES ( 'PAPILLAS', 7, NULL, 5, NULL);
INSERT INTO alimento (descripcion, tipo_alimento, observaciones, id_unidad, cantidad) VALUES ('ENVASE GRANDE', 0, NULL, 5, NULL);
INSERT INTO alimento (descripcion, tipo_alimento, observaciones, id_unidad, cantidad) VALUES ( 'ENVASE PEQUEÑO', 0, NULL, 5, NULL);
INSERT INTO alimento (descripcion, tipo_alimento, observaciones, id_unidad, cantidad) VALUES ('HIGADO PREMIO', 7, NULL, 5, NULL);
INSERT INTO alimento (descripcion, tipo_alimento, observaciones, id_unidad, cantidad) VALUES ( 'CALDOS', 7, NULL, 5, NULL);
INSERT INTO alimento (descripcion, tipo_alimento, observaciones, id_unidad, cantidad) VALUES ( 'ENVASE MEDIANO', 0, NULL, 5, NULL);

-- cambios 26/10/2016

 DROP VIEW vistadetalle;

CREATE OR REPLACE VIEW vistadetalle AS 
 SELECT a.id, a.fecha, b.nombre AS nombre_mascota, b.id_mascota, b.clasificacion, b.peso, e.descripcion AS medida, d.tipo, d.descripcion, c.nombre, c.apellido, ( SELECT vistaporcion.cantidad_gramos
           FROM vistaporcion
          WHERE vistaporcion.cantidad >= b.peso AND vistaporcion.cantidad <= (( SELECT b.peso + 5::double precision)) AND vistaporcion.tipo::text = d.tipo::text
         LIMIT 1) AS porcion, ( SELECT vistaporcion.porcentaje_proteina
           FROM vistaporcion
          WHERE vistaporcion.cantidad >= b.peso AND vistaporcion.cantidad <= (( SELECT b.peso + 5::double precision)) AND vistaporcion.tipo::text = d.tipo::text
         LIMIT 1) AS porcentaje_proteina, ( SELECT vistaporcion.porcentaje_vegetal
           FROM vistaporcion
          WHERE vistaporcion.cantidad >= b.peso AND vistaporcion.cantidad <= (( SELECT b.peso + 5::double precision)) AND vistaporcion.tipo::text = d.tipo::text
         LIMIT 1) AS porcentaje_vegetal
   FROM dieta a, mascota b, cliente c, edad_mascota d, unidad_medida e
  WHERE b.id_mascota = a.id_mascota AND c.id = a.id_cliente AND b.peso_medida = e.id AND b.clasificacion = d.id;

ALTER TABLE vistadetalle
  OWNER TO postgres;

alter table dieta_detalle add column id_subdieta integer;