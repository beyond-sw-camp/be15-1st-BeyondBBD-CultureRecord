/*
 * [PER-09] 공연/전시 상세 조회
 * : SELECT, 공연/전시 테이블에서 특정 공연/전시 ID에 해당하는 행 조회
 * : 공연번호, 제목, 장소, 시작일, 종료일, 러닝타임, 관람연령, 가격, 포스터
 *   , 공연상태, 판매상태, 판매시작일, 판매종료일, 총 리뷰 수 (캐스트 추가해야 함)
 */

SELECT 
    e.event_id AS '공연/전시 ID'
    , e.title AS '제목'
    , e.location AS '관람 장소'
    , e.poster_image_url AS '포스터 이미지'
    , e.event_start_date AS '관람 시작일'
    , e.event_finish_date AS '관람 종료일'
    , e.running_time AS '관람 시간'
    , e.age_limit AS '관람 연령'
    , e.price AS '가격'
    , e.description AS '설명'
    , e.event_status AS '공연 상태'
    , e.sales_status AS '판매 상태'
    , e.sales_start_date '판매 시작일'
    , e.sales_finish_date '판매 종료일'
    , f.field_name AS '분야'
    ,GROUP_CONCAT(a.artist_name SEPARATOR ', ') AS '출연진'
    ,ROUND(e.review_rating_sum / NULLIF(e.review_count, 0), 1) AS '평균별점'
    FROM `event` e
    JOIN show_cast s ON s.show_id = e.event_id
    JOIN field f ON e.type_id = f.field_id
    JOIN artist a ON s.artist_id = a.artist_id
    WHERE e.event_id = 1;

