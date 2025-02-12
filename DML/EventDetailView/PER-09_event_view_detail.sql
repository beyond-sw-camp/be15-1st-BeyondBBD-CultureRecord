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
    , e.event_start_date AS '관람 시작일'
    , e.event_finish_date AS '관람 종료일'
    , e.running_time AS '관람 시간'
    , e.age_limit AS '관람 연령'
    , e.price AS '가격'
    , e.description AS '설명'
    , e.event_status AS '공연 상태'
    , e.sales_status AS '판매 상태'
    , e.sales_start_date AS '판매 시작일'
    , e.sales_finish_date AS '판매 종료일'
    , e.poster_image_url AS '포스터 이미지 주소'
    , e.review_count AS '총 리뷰 수'
    , CASE 
        WHEN e.review_count > 0 THEN ROUND(e.review_rating_sum / e.review_count, 1)
        ELSE 0
    END AS avg_rating
FROM event e
JOIN show_cast sc ON e.event_id = sc.show_id
JOIN artist a ON sc.artist_id = a.artist_id
WHERE e.event_id = 2; -- 공연/전시 ID 입력


/*
 * [PER-XX] 공연/전시 별 캐스트 조회
 * : SELECT,show_cast 테이블에서 event 테이블의 특정 공연/전시 ID로 검색한 캐스트의 목록에 대해 조회 
 */
SELECT 
    a.artist_id,
    a.artist_name,
    a.artist_job,
    a.artist_age,
    a.artist_gender,
    a.profile_image_url,
    sc.cast
FROM show_cast sc
JOIN artist a ON sc.artist_id = a.artist_id
WHERE sc.show_id = 1; -- 공연/전시 ID 를 조회


