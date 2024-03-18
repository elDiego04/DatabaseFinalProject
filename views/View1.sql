CREATE VIEW View1 AS

WITH Total AS (
    SELECT SUM(precio) AS total_suma_precios
    FROM Final.Libros 
    WHERE autor_id IN (SELECT autor_id FROM Final.Autores WHERE fecha_defuncion IS NULL)
)

SELECT L.titulo AS 'Nombre del Libro',
       A.nombre AS 'Nombre del Autor',
       ROUND((SUM(L.precio) / T.total_suma_precios * 100), 2) AS 'Porcentaje en Total',
       T.total_suma_precios AS Total
FROM Final.Libros L
INNER JOIN Final.Autores A ON L.autor_id = A.autor_id
CROSS JOIN Total T -- mostrar por cada registro la suma total de precios de los libros
WHERE A.fecha_defuncion IS NULL -- verificar que el autor no este muerto
GROUP BY L.titulo, A.nombre, T.total_suma_precios
ORDER BY A.nombre DESC;

SELECT * FROM View1;