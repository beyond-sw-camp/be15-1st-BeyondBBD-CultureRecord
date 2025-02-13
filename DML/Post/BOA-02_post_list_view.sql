-- [BOA-02] 게시글 목록 조회
-- SELECT, 게시글 테이블에서 특정 카테고리 ID에 대해 게시글 삭제 여부가 0인 행 조회

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