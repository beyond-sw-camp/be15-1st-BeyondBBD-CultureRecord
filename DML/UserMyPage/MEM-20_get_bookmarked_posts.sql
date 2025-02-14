/*
 * [MEM-20] 북마크 게시글 조회
 * : SELECT, 북마크테이블, 게시글 테이블, 사용자 테이블을 조회하여 북마크한 게시글의 게시글ID, 게시글 제목, 작성자 닉네임, 작성 시각, 북마크한 시각을 북마크한 시각 순으로 조회
*/

SELECT 
	p.post_id AS '게시글 ID'
	, post_title AS '게시글 제목'
	, u.nickname AS '작성자'
	, created_at AS '게시글 작성 시각'
	, bookmarked_at AS '북마크한 시각'
FROM bookmark b
	JOIN post p ON b.post_id = p.post_id
	JOIN user u ON p.user_id = u.user_id
	WHERE b.user_id = 1 AND p.is_post_deleted != 1
	ORDER BY bookmarked_at DESC;