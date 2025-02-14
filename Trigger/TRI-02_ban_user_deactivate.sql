/*
 * [TRI-02] 정지 사용자 비활성화 트리거
 * : TRIGGER, 정지테이블에 추가되는 사용자의 사용자 삭제 여부를 1로 변경
*/

DELIMITER //

CREATE TRIGGER ban_user_deactivate
AFTER INSERT ON banned_user
FOR EACH ROW
BEGIN
    UPDATE user
    SET is_user_deleted = 1
    WHERE user_id = NEW.banned_user_id;
END//

DELIMITER ;
