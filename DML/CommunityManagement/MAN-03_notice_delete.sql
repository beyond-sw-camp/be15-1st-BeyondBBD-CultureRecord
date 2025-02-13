-- MAN-03. 공지사항 삭제 Delete notice : UPDATE, 
-- 공지사항 테이블에서 공지사항 삭제 여부 컬럼값을 1로 수정

UPDATE noticeboard
SET is_notice_deleted = 1, notice_modify_at = NOW()
WHERE notice_id = 1;