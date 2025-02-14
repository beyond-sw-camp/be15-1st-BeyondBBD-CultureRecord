/*
 * [PER-01] 공연/전시 검색 기능
 * : SELECT, 공연/전시 테이블에서 검색 키워드를 포함하는 행을 조회하여 반환
 * : 공연번호, 제목, 장소, 시작일, 종료일, 가격, 공연상태, 판매상태, 포스터만
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
WHERE (title LIKE '%이%') -- 입력된 검색어
ORDER BY 
    CASE 
        WHEN event_status IN ('BEFORE', 'RUNNING') THEN 1
        WHEN event_status = 'AFTER' THEN 2
    END ASC,
    event_start_date ASC;




-- 테스트 수행에 필요한 데이터 insert
/*
INSERT INTO
    event(type_id, title, location, event_start_date, event_finish_date, running_time, age_limit, price, description, event_status, sales_status, sales_start_date, sales_finish_date, review_count, review_rating_sum)
VALUES
 (31, 2, '이름허수1', '장소허수1', '2025-02-01', '2025-02-10', '20분', 15, 50000, '가상의 뮤지컬입니다', 'AFTER', 0, '2025-01-01', '2025-01-20', 9, 43),
 (32, 2, '이름허수2', '장소허수2', '2025-02-10', '2025-05-10', '20분', 15, 50000, '가상의 뮤지컬입니다', 'RUNNING', 0, '2025-01-01', '2025-01-20', 13, 58),
 (33, 1, '이름허수3', '장소허수3', '2025-02-01', '2025-02-20', '180분', 15, 90000, '가상의 콘서트입니다', 'RUNNING', 0, '2025-01-01', '2025-01-30', 7, 29);

SELECT * FROM event e ;

DELETE FROM event 
WHERE event_id >30;
*/
    