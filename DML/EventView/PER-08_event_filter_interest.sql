/*
 * [PER-08] 관심 분야 공연/전시 필터
 * : SELECT, 관심 분야 테이블에서 사용자 ID로 분류 ID 리스트 조회 후 공연/전시 테이블에서 특정 분류ID에 해당하는 행들 조회
 * : 공연번호, 제목, 장소, 시작일, 종료일, 가격, 공연상태, 판매상태, 포스터만
 */


SELECT 
    e.event_id AS '공연/전시 ID'
    , e.title AS '제목'
    , e.location AS '관람 장소'
    , e.event_start_date AS '관람 시작일'
    , e.event_finish_date AS '관람 종료일'
    , e.price AS '가격'
    , e.event_status AS '공연 상태'
    , e.sales_status AS '판매 상태'
    , e.poster_image_url AS '포스터 이미지 주소'
    , CASE 
        WHEN e.review_count > 0 THEN ROUND(e.review_rating_sum / e.review_count, 1)
        ELSE 0
    END AS avg_rating
FROM event e
JOIN user_interest ui ON e.type_id = ui.field_id
WHERE ui.user_id = 4 -- 사용자 아이디 입력
ORDER BY 
    CASE 
        WHEN event_status IN ('BEFORE', 'RUNNING') THEN 1
        WHEN event_status = 'AFTER' THEN 2
    END ASC,
    event_start_date ASC;



-- 테스트 수행에 필요한 데이터 insert
/*
INSERT
  INTO user_interest (user_id, field_id)
VALUES
(4, 2), -- 뮤지컬
(5, 1); -- 콘서트

SELECT * from user_interest;
DROP from user_interest;
*/