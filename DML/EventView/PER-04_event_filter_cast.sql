/*
 * [PER-04] 아티스트 별 공연/전시 필터
 * : SELECT, 공연 별 출연진 목록 테이블에서 특정 아티스트 ID로 조회한 공연 ID들에 대해 공연/전시 테이블에서 조회
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
JOIN show_cast sc ON e.event_id = sc.show_id
JOIN artist a ON sc.artist_id = a.artist_id
WHERE a.artist_name = '전동석' -- 더미데이터 필요
ORDER BY 
    CASE 
        WHEN e.event_status IN ('BEFORE', 'RUNNING') THEN 1
        WHEN e.event_status = 'AFTER' THEN 2
    END ASC,
    e.event_start_date ASC;


-- 테스트 수행에 필요한 데이터 insert
/*
INSERT
  INTO show_cast (show_id, artist_id, cast)
VALUES
(1, 86, '지킬'),
(1, 49, '엠마'),
(2, 30, '조시아나 여공작');

SELECT * from show_cast;
DELETE from show_cast;
*/