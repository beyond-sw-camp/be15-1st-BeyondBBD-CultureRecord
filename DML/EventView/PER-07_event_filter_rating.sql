/*
 * [PER-07] 별점순 공연/전시 필터
 * : SELECT, 공연/전시 테이블에서 order by 총 별점 합/총 리뷰 수로 전체 행 조회
 * : 공연번호, 제목, 장소, 시작일, 종료일, 가격, 공연상태, 판매상태, 포스터, 평균 별만
 */

/*
 * average rating 계산을 위한 review_rating_sum 필요.
 * event 테이블에 review count, review rating sum 더미데이터 필요. 
 */
SELECT 
    event_id AS '공연/전시 ID'
    , title AS '제목'
    , location AS '관람 장소'
    , event_start_date AS '관람 시작일'
    , event_finish_date AS '관람 종료일'
    , price AS '가격'
    , event_status AS '공연 상태'
    , sales_status AS '판매 상태'
    , poster_image_url AS '포스터 이미지 주소'
    , CASE 
        WHEN review_count > 0 THEN ROUND(review_rating_sum / review_count, 1)
        ELSE 0
    END AS avg_rating
FROM event
ORDER BY -- order by로 정렬 거는 순서 조정 필요
    avg_rating DESC,
    CASE 
        WHEN event_status IN ('BEFORE', 'RUNNING') THEN 1
        WHEN event_status = 'AFTER' THEN 2
    END ASC,
    event_start_date ASC;

