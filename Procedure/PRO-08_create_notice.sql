/*
 * [PRO-08] 공지사항 등록 프로시저
 * : PROCEDURE, 공지사항을 등록하는 프로시저, 쉼표로 구분된 첨부파일을 분리하여 첨부파일 테이블에 삽입한다.
*/

DROP PROCEDURE create_notice;

DELIMITER //

CREATE PROCEDURE create_notice(
    IN p_admin_id INT,
    IN p_notice_title VARCHAR(255),
    IN p_notice_content TEXT,
    IN pin BOOLEAN,
    IN p_attachment_paths TEXT)
    BEGIN
    DECLARE new_notice_id INT;
    DECLARE attachment_path VARCHAR(255);
    DECLARE comma_index INT;
        
    INSERT INTO noticeboard (admin_id, notice_title, notice_content)
    VALUES (p_admin_id, p_notice_title, p_notice_content);

   	SET new_notice_id = LAST_INSERT_ID(); 
	
    
    WHILE LENGTH(p_attachment_paths) > 0 DO
        SET comma_index = LOCATE(',', p_attachment_paths);
        
        IF comma_index > 0 THEN
            SET attachment_path = SUBSTRING_INDEX(p_attachment_paths, ',', 1);
            SET p_attachment_paths = SUBSTRING(p_attachment_paths, comma_index + 1);
        ELSE
            SET attachment_path = p_attachment_paths;
            SET p_attachment_paths = '';
        END IF;

    	INSERT INTO attachment (post_id, file_url, post_type) VALUES (new_notice_id, attachment_path, 'notice');
    END WHILE;

END//

DELIMITER ;