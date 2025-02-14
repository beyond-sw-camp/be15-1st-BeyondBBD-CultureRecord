-- [MAN-09] 신고 게시글 삭제
-- UPDATE, 신고 검토 테이블에서 해당 게시글 신고에 대한 검토 여부를 1로 변경하고, 게시글 테이블에서 해당 게시글 ID로 조회한 행의 게시글 삭제 여부 1로 설정

UPDATE report_check
SET is_checked = 1
WHERE post_id = 5;

UPDATE post
SET is_post_deleted = 1
WHERE post_id = 5;
