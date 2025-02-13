-- [MEM-08] 관람 내역 숨김 설정
-- UPDATE, 관람 내역 숨김 여부 컬럼 값 1으로 설정

UPDATE event_record
   SET is_hidden = 1
 WHERE event_record_id = 2; 