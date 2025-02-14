/*
 * [TRI-03] 신고 검토 테이블 추가
 * : TRIGGER, 신고 테이블에 새로운 신고가 추가될 때, 신고 테이블에 5회 이상 등장한 게시글이나 댓글이면 신고 검토 테이블에 추가
*/


DELIMITER //

CREATE TRIGGER report_check_insert
AFTER INSERT ON report
FOR EACH ROW
BEGIN
    IF NEW.post_id IS NOT NULL THEN
        IF (SELECT COUNT(*) FROM report WHERE post_id = NEW.post_id) = 5 THEN
            INSERT INTO report_check (post_id, comment_id, report_type)
            VALUES (NEW.post_id, NULL, 'post');
        END IF;
    END IF;

    IF NEW.comment_id IS NOT NULL THEN
        IF (SELECT COUNT(*) FROM report WHERE comment_id = NEW.comment_id) = 5 THEN
            INSERT INTO report_check (post_id, comment_id, report_type)
            VALUES (NULL, NEW.comment_id, 'comment');
        END IF;
    END IF;
END//


DELIMITER ;