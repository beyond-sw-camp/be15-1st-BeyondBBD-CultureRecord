/*
 * [BOA-16] 리뷰게시글 등록
 * : INSERT, 게시글 테이블과 관람내역 테이블을 조인하여 사용자ID로 묶고
 * :         카테고리ID가 3이고, 티켓인증여부가 1인 값을 별점과 함께 리뷰테이블에 삽입
 * : 게시글ID, 관람내역ID, 별점
 */
DROP PROCEDURE IF EXISTS create_post;

DELIMITER //

CREATE PROCEDURE create_post(
    IN p_category_id INT,
    IN p_user_id INT,
    IN p_post_title VARCHAR(255),
    IN p_post_content TEXT,
    IN p_event_record_id INT,
    IN p_rating INT
)
BEGIN
    DECLARE ticket_verified INT;
    DECLARE new_post_id INT;
    DECLARE target_event_id INT;

    IF p_category_id = 3 THEN
        SELECT is_ticket_verified INTO ticket_verified
        FROM event_record
        WHERE event_record_id = p_event_record_id;

        IF ticket_verified != 1 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = '인증되지 않은 관람내역입니다';
        END IF;
    END IF;

    -- 게시글 작성
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
 
END//

DELIMITER ;

CALL create_post(3, 1, '리뷰 게시글', '이건 리뷰 게시글 입니다', 2, 5);

