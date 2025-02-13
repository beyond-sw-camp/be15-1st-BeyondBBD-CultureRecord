update report_check
set is_checked = 1
where comment_id = ?;

update comment
set is_comment_deleted = 1
where comment_id = ?;