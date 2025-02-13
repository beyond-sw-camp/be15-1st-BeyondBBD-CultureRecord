/*
 * [PRO-01] 게시글 작성 프로시저
 * : PROCEDURE, 카테고리가 3이면 관람내역의 티켓 유효 여부를 판단해서 인증된 관람 내역인지 판단 후에
 * 리뷰 게시글 테이블에 추가할 수 있다. 카테고리가 3이 아닐 경우에는 게시글 테이블에 새로운 게시글을 추가한다.
*/

DROP PROCEDURE create_post;

DELIMITER //

CREATE PROCEDURE create_post(
    IN p_category_id INT,
    IN p_user_id INT,
    IN p_post_title VARCHAR(255),
    IN p_post_content TEXT,
    IN p_event_record_id INT,
    IN p_rating INT,
    IN p_attachment_paths TEXT -- 쉼표로 구분된 첨부파일 리스트 (MariaDB는 직접 파싱 필요)
)
BEGIN
    DECLARE ticket_verified INT;
    DECLARE new_post_id INT;
    DECLARE target_event_id INT;
    DECLARE attachment_path VARCHAR(255);
    DECLARE comma_index INT;
    
    IF p_category_id = 3 THEN
        SELECT is_ticket_verified INTO ticket_verified
        FROM event_record
        WHERE event_record_id = p_event_record_id;

        IF ticket_verified != 1 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = '인증되지 않은 관람내역입니다';
        END IF;
    END IF;

    INSERT INTO post (category_id, user_id, post_title, post_content)
    VALUES (p_category_id, p_user_id, p_post_title, p_post_content);

   	SET new_post_id = LAST_INSERT_ID(); 
	
	IF p_category_id = 3 THEN
    	INSERT INTO review (review_post_id, event_record_id, rating) 
    	VALUES (new_post_id, p_event_record_id, p_rating);
    	
    	SELECT event_id INTO target_event_id 
        FROM event_record 
        WHERE event_record_id = p_event_record_id;
        
        UPDATE event
        SET review_count = review_count + 1,
            review_rating_sum = review_rating_sum + p_rating
        WHERE event.event_id = target_event_id;
    END IF;
    
    WHILE LENGTH(p_attachment_paths) > 0 DO
        SET comma_index = LOCATE(',', p_attachment_paths);
        
        IF comma_index > 0 THEN
            SET attachment_path = SUBSTRING_INDEX(p_attachment_paths, ',', 1);
            SET p_attachment_paths = SUBSTRING(p_attachment_paths, comma_index + 1);
        ELSE
            SET attachment_path = p_attachment_paths;
            SET p_attachment_paths = '';
        END IF;

        INSERT INTO attachment (post_id, file_url) VALUES (new_post_id, attachment_path);
    END WHILE;

END//

DELIMITER ;