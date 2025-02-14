-- [MEM-11-2] 관람 내역 목록 조회
-- SELECT, 관람 내역 테이블에서 본인 사용자 ID로 조회

-- 1번 사용자가 본인의 관람 내역을 조회하는 상황

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
    u.user_id = 1
    AND u.is_user_deleted = 0;


