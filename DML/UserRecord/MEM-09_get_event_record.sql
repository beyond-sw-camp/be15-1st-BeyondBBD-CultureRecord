-- [MEM-09] 관람 내역 조회 
-- SELECT, 관람 내역 테이블에서 특정 관람 내역에 대해 권한(공개, 팔로우만 공개) 검증 이후 관람 내역 숨김 여부 컬럼 값이 1인 행 조회

SELECT *
  FROM event_record
 WHERE event_record_id = 3
   AND is_hidden = 0;