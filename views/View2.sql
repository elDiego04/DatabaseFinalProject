-- obtener información detallada sobre los libros que tienen el precio más alto dentro de cada género, 
-- pero solo aquellos libros cuyo año de publicación sea anterior a 2000 y cuyo número de páginas esté por encima del promedio global de páginas.

CREATE VIEW View2 AS
WITH libros_filtrados AS (
    SELECT 
        *,
        ROW_NUMBER() OVER (PARTITION BY genero ORDER BY precio DESC) AS ranking_precio
    FROM 
        Final.Libros
    WHERE 
        año_publicacion < 2000
        AND numero_paginas > (SELECT AVG(numero_paginas) FROM Final.Libros)
)
SELECT 
    lf.titulo,
    lf.precio,
    lf.genero,
    a.nombre AS autor
FROM 
    libros_filtrados lf
JOIN 
    Autores a ON lf.autor_id = a.autor_id
WHERE 
    lf.ranking_precio = 1;


SELECT * FROM View2;
