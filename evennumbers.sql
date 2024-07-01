DELIMITER //

CREATE PROCEDURE get_even_numbers()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE result VARCHAR(255) DEFAULT '';
    
    simple_loop: LOOP
        IF i > 10 THEN
            LEAVE simple_loop;
        END IF;
        
        IF i % 2 = 0 THEN
            SET result = CONCAT(result, i, ',');
        END IF;
        
        SET i = i + 1;
    END LOOP simple_loop;
    
    -- Убираем последнюю запятую
    SET result = LEFT(result, LENGTH(result) - 1);
    
    SELECT result AS even_numbers;
END //

DELIMITER ;

CALL get_even_numbers();
