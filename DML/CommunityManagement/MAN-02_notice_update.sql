-- MAN-02. 공지사항 수정 Notice update : UPDATE, 
-- 공지사항 테이블에서 해당 공지사항 ID로 조회하여 수정

UPDATE noticeboard
SET notice_content = "testing_again", notice_modify_at = NOW();
WHERE notice_id = 1;

SELECT * FROM noticeboard;