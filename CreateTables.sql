
delimiter $$
CREATE PROCEDURE CreateTables ()
BEGIN
    CREATE TABLE Autores (
        autor_id INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL,
        nacionalidad VARCHAR(100),
        fecha_nacimiento DATE,
        biografia TEXT,
        fecha_defuncion DATE,
        lugar_nacimiento VARCHAR(100)
    );

    CREATE TABLE Libros (
        libro_id INT AUTO_INCREMENT PRIMARY KEY,
        titulo VARCHAR(100) NOT NULL,
        autor_id INT,
        año_publicacion INT,
        genero VARCHAR(50),
        idioma VARCHAR(50),
        numero_paginas INT,
        precio INT,
        FOREIGN KEY (autor_id) REFERENCES Autores(autor_id)
    );
END
$$

CALL CreateTables();
