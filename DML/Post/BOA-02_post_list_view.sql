SELECT p.post_id
		,pc.category_name
		,u.nickname
		,p.post_title
		,p.created_at
		,p.updated_at
	from post p
join post_category pc on pc.category_id = p.category_id
JOIN user u ON u.user_id = p.user_id
where p.is_post_deleted = 0
ORDER BY created_at DESC;