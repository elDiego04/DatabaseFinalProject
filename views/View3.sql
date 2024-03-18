-- Se agrupa por el nombre del autor y se filtran aquellos autores cuya diferencia promedio entre el año actual y el año de publicación de sus libros sea mayor a 30 años.
CREATE VIEW View3 AS
SELECT 
    A.nombre AS Autor,
    AVG(calcular_diferencia(L.año_publicacion)) AS Promedio_Diferencia
FROM FinalProject.Autores A
JOIN FinalProject.Libros L ON A.autor_id = L.autor_id
GROUP BY A.nombre
HAVING Promedio_Diferencia > 30
ORDER BY Promedio_Diferencia DESC;