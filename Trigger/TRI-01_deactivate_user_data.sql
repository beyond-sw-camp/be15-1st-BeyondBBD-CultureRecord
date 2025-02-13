/*
 * [TRI-01] 사용자 데이터 비활성화
 * : TRIGGER, 사용자의 사용자 삭제여부가 1이 되면 사용자의 활동 내역을 삭제 또는 비활성
*/

DELIMITER //

CREATE TRIGGER deactivate_user_data
AFTER UPDATE ON user
FOR EACH ROW
BEGIN
    IF OLD.is_user_deleted = 0 AND NEW.is_user_deleted = 1 THEN
        -- 글 비활성화
        UPDATE post SET is_post_deleted = 1 WHERE user_id = NEW.user_id;
        
        -- 댓글 비활성화
        UPDATE comment SET is_comment_deleted = 1 WHERE user_id = NEW.user_id;
        
        -- 팔로우 관계 삭제 (내가 팔로우한 사람 & 나를 팔로우한 사람)
        DELETE FROM follow_user WHERE follower_id = NEW.user_id OR followed_user_id = NEW.user_id;
        
        -- 차단 관계 삭제 (내가 차단한 사람 & 나를 차단한 사람)
        DELETE FROM block_user WHERE blocker_id = NEW.user_id OR blocked_user_id = NEW.user_id;
        
        -- 북마크 삭제
        DELETE FROM bookmark WHERE user_id = NEW.user_id;
        
        -- 찜한 콘텐츠 삭제
        DELETE FROM `like` WHERE user_id = NEW.user_id;
        
        -- 관심분야 삭제
        DELETE FROM user_interest WHERE user_id = NEW.user_id;
        
        -- 관람내역 삭제
        DELETE FROM event_record WHERE user_id = NEW.user_id;
    END IF;
END//

DELIMITER ;