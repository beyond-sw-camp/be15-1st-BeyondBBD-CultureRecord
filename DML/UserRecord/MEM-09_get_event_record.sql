-- [MEM-09] 관람 내역 조회 
-- SELECT, 관람 내역 테이블에서 특정 관람 내역에 대해 조회

SELECT e.title AS '공연/전시 제목', e.poster_image_url AS '포스터 이미지', er.record_date AS '관람일자', e.location AS '장소'
  FROM event e
  JOIN event_record er ON e.event_id = er.event_id
 WHERE er.event_record_id = 3;
 
