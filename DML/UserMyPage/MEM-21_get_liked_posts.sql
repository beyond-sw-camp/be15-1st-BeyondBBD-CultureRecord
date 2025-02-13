/*
 * [MEM-21] 추천 게시글 조회
 * : SELECT, 추천 테이블, 게시글 테이블, 사용자 테이블을 조회하여 추천한 게시글의 게시글ID, 게시글 제목, 작성자 닉네임, 작성 시각, 추천 시각을 추천한 시각 순으로 조회
*/

SELECT 
	l.post_id AS '게시글ID'
	, p.post_title AS '게시글 제목'
	, u.nickname AS '작성자닉네임'
	, p.created_at AS '글 작성시각'
	, l.liked_at AS '좋아요한 시각'
	FROM `like` l
	JOIN post p ON l.post_id = p.post_id
	JOIN user u ON p.user_id = u.user_id
	WHERE l.user_id = 1 AND p.is_post_deleted != 1
	AND l.writing_type = 'post'
	ORDER BY liked_at DESC;