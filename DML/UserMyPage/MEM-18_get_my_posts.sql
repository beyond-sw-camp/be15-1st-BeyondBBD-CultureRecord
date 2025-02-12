/*
 * [MEM-19] 본인 게시글 조회
 * : SELECT, 사용자 ID를 사용하여 게시판 테이블과 카테고리 테이블을 JOIN하여 카테고리명, 게시글 제목, 작성 시각을 작성 시각 순으로 조회
*/

SELECT
	post_id AS '게시글 ID'
	, c.category_name AS '카테고리 ID'
	, post_title AS '게시글 제목'
	, p.created_at AS '게시글 작성 시각'
 	FROM post p
 	JOIN post_category c ON p.category_id = c.category_id
 	JOIN user u ON p.user_id = u.user_id
	WHERE p.user_id = 1 AND p.is_post_deleted != 1
	ORDER BY created_at DESC;