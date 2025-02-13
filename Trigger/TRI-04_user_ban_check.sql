/*
 * [TRI-04] 사용자 정지 테이블 추가
 * : TRIGGER, 사용자 검토 테이블에 검토 여부가 1로 변경되면 검토 여부가 1로 3번 변경된 사용자를 정지 사용자 테이블에 추가
*/

DELIMITER //

CREATE TRIGGER user_ban_check               
AFTER UPDATE ON report_check
FOR EACH ROW
BEGIN
    DECLARE count_checked INT;
    DECLARE target_user_id INT;

    IF NEW.is_checked = 1 AND OLD.is_checked = 0 THEN
        
        IF NEW.report_type = 'post' THEN
            SELECT COUNT(*) INTO count_checked
            FROM report_check r
            JOIN post p ON r.post_id = p.post_id
            WHERE p.user_id = (SELECT user_id FROM post WHERE post_id = NEW.post_id)
              AND r.is_checked = 1;

        
        ELSEIF NEW.report_type = 'comment' THEN
            SELECT COUNT(*) INTO count_checked
            FROM report_check r
            JOIN comment c ON r.comment_id = c.comment_id
            WHERE c.user_id = (SELECT user_id FROM comment WHERE comment_id = NEW.comment_id)
              AND r.is_checked = 1;
        END IF;

        
        IF count_checked >= 3 THEN
            IF NEW.report_type = 'post' THEN
                SELECT user_id INTO target_user_id FROM post WHERE post_id = NEW.post_id;
            ELSEIF NEW.report_type = 'comment' THEN
                SELECT user_id INTO target_user_id FROM comment WHERE comment_id = NEW.comment_id;
            END IF;

            INSERT INTO banned_user (banned_user_id, ban_reason) 
            VALUES (target_user_id, '신고 누적');      
        END IF;
    END IF;
END//

DELIMITER ;DELIMITER //

CREATE TRIGGER user_ban_check               
AFTER UPDATE ON report_check
FOR EACH ROW
BEGIN
    DECLARE count_checked INT;
    DECLARE target_user_id INT;

    IF NEW.is_checked = 1 AND OLD.is_checked = 0 THEN
        
        IF NEW.report_type = 'post' THEN
            SELECT COUNT(*) INTO count_checked
            FROM report_check r
            JOIN post p ON r.post_id = p.post_id
            WHERE p.user_id = (SELECT user_id FROM post WHERE post_id = NEW.post_id)
              AND r.is_checked = 1;

        
        ELSEIF NEW.report_type = 'comment' THEN
            SELECT COUNT(*) INTO count_checked
            FROM report_check r
            JOIN comment c ON r.comment_id = c.comment_id
            WHERE c.user_id = (SELECT user_id FROM comment WHERE comment_id = NEW.comment_id)
              AND r.is_checked = 1;
        END IF;

        
        IF count_checked >= 3 THEN
            IF NEW.report_type = 'post' THEN
                SELECT user_id INTO target_user_id FROM post WHERE post_id = NEW.post_id;
            ELSEIF NEW.report_type = 'comment' THEN
                SELECT user_id INTO target_user_id FROM comment WHERE comment_id = NEW.comment_id;
            END IF;

            INSERT INTO banned_user (banned_user_id, ban_reason) 
            VALUES (target_user_id, '신고 누적');      
        END IF;
    END IF;
END//

DELIMITER ;