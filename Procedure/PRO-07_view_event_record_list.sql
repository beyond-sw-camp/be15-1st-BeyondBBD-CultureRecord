-- [PRO-07] 관람 내역 목록 조회 프로시저
-- 관람 내역 테이블에서 특정 사용자 ID로 다른 사용자의 관람 내역 조회에 대해 권한(공개, 팔로우만 공개) 검증 이후 관람 내역 숨김 여부 컬럼 값이 0면서 티켓 인증 여부가 1인 행 조회
-- 입력 매개변수 searched_id는 조회당하는 user의 id, search_id는 관람내역 목록을 조회하는 user의 id


DELIMITER //

CREATE PROCEDURE GetEventRecords(IN searched_id INT, IN search_id INT)
BEGIN
    SELECT 
        er.event_record_id AS '관람내역 id', 
        e.event_id AS '공연/전시 id', 
        e.title AS '관람공연 제목', 
        u.nickname AS '닉네임', 
        e.poster_image_url AS '포스터 이미지'
    FROM user u  
    JOIN event_record er 
        ON u.user_id = er.user_id
    JOIN event e 
        ON er.event_id = e.event_id
    WHERE 
        u.is_user_deleted = 0
        AND u.user_id = searched_id
        AND er.is_hidden = 0
        AND er.is_ticket_verified = 1
        AND (
            u.privacy_option = 'PUBLIC'
            OR (
                u.privacy_option = 'FOLLOWER'
                AND search_id IN (
                    SELECT f.follower_id
                    FROM follow_user f
                    WHERE f.followed_user_id = searched_id
                )
            )
        )
    ORDER BY er.record_date ASC;
END //

DELIMITER ;