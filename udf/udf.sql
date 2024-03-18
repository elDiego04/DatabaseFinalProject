DELIMITER %%
CREATE FUNCTION calcular_diferencia(año INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE año_actual INT;
    DECLARE diferencia INT;
    
    SET año_actual = YEAR(CURRENT_DATE());
    SET diferencia = año_actual - año;
    
    RETURN diferencia;
END %%
DELIMITER ;