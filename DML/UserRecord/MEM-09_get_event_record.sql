-- 관람 내역 조회 SELECT, 관람 내역 테이블에서 사용자 ID로 관람 내역 공개 컬럼 값이 1인 행 조회
-- 관람 일자, 공연 제목, 포스터 이미지 url

SELECT *
  FROM event_record
 WHERE event_record_id = 3
   AND is_hidden = 0;