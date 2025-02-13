UPDATE report_check
SET is_checked = 1
WHERE post_id = 5;

UPDATE post
SET is_post_deleted = 1
WHERE post_id = 5;
