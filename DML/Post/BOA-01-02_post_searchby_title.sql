SELECT  pc.category_name
		, p.post_id
		, p.post_title
		, p.created_at
		, u.nickname
from post p
JOIN user u ON p.user_id = u.user_id
JOIN post_category pc ON pc.category_id = p.category_id
where post_title like "%?%" and is_post_deleted = 0;
ORDER BY created_at DESC;