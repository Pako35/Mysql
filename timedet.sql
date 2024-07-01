DELIMITER //

CREATE PROCEDURE format_seconds(IN total_seconds INT)
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE seconds INT;
    
    SET days = FLOOR(total_seconds / 86400); -- 1 день = 86400 секунд
    SET total_seconds = total_seconds MOD 86400;
    
    SET hours = FLOOR(total_seconds / 3600); -- 1 час = 3600 секунд
    SET total_seconds = total_seconds MOD 3600;
    
    SET minutes = FLOOR(total_seconds / 60); -- 1 минута = 60 секунд
    SET seconds = total_seconds MOD 60;
    
    SELECT CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds') AS formatted_time;
END //

DELIMITER ;

CALL format_seconds(123456);

