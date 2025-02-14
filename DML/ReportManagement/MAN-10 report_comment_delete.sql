-- [MAN-10] 신고 댓글 삭제
-- UPDATE, 신고 검토 테이블에서 해당 댓글 신고에 대한 검토 여부를 1로 변경하고, 댓글 테이블에서 해당 댓글 ID로 조회한 행의 댓글 삭제 여부 1로 설정

update report_check
set is_checked = 1
where comment_id = ?;

update comment
set is_comment_deleted = 1
where comment_id = ?;