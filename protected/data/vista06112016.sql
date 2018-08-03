--borra las vistas

DROP VIEW vistadetalle;

DROP VIEW vistacm;


--corre el script de peso 

alter table mascota alter column peso type double precision; 

--crea nuevamente la vista

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

CREATE OR REPLACE VIEW vistacm AS 
 SELECT a.id, a.cedula, a.nombre, a.apellido, a.sexo, a.direccion, a.telefono, a.telefono_casa, a.correo_electronico, a.created_date, a.modified_date, a.created_by, a.modified_by, b.nombre AS nombre_mascota, b.id_mascota, ( SELECT vistaporcion.cantidad_gramos
           FROM vistaporcion
          WHERE vistaporcion.cantidad >= b.peso AND vistaporcion.cantidad <= (( SELECT b.peso + 5::double precision)) AND vistaporcion.tipo::text = d.tipo::text
         LIMIT 1) AS porcion, ((d.tipo::text || ' ('::text) || d.descripcion::text) || ') '::text AS descripcion, b.peso
   FROM cliente a, mascota b, edad_mascota d
  WHERE a.id = b.id_cliente AND b.clasificacion = d.id;

ALTER TABLE vistacm
  OWNER TO postgres;

