/*
 * [PER-03] 분류 별 공연/전시 필터
 * : SELECT, 공연/전시 테이블에서 특정 분야 ID에 해당하는 행 조회
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
JOIN field f ON e.type_id = f.field_id
WHERE e.type_id = 2 -- 숫자로 분야 ID 입력
ORDER BY 
    CASE 
        WHEN e.event_status IN ('BEFORE', 'RUNNING') THEN 1
        WHEN e.event_status = 'AFTER' THEN 2
    END ASC,
    e.event_start_date ASC;
