/*
 * [BOA-11] 댓글 조회 
 * : SELECT, 댓글 테이블에서 특정 게시글 ID에 대한 댓글 조회 
 * : 댓글 ID, 사용자 ID, 게시글 ID, 부모댓글 ID, 내용 조회
 */
SELECT
		  c.comment_id 댓글 ID
		, c.user_id 사용자 ID
		, c.post_id 게시글 ID
		, c.parent_id 부모댓글 ID
		, u.nickname 닉네임
		, c.content 내용
		, c.created_at 작성 시각
  FROM comment c
  JOIN user u USING (user_id)
 WHERE post_id = 1;
 
/*
DELIMITER //

CREATE OR REPLACE PROCEDURE viewcomment(
	IN postid INT
)

BEGIN

SELECT
		  c.comment_id AS '댓글 ID'
		, c.user_id AS '사용자 ID'
		, c.post_id AS '게시글 ID'
		, c.parent_id AS '부모댓글 ID'
		, u.nickname AS '닉네임'
		, c.content AS '내용'
		, c.created_at AS '작성 시각'
  FROM comment c
  JOIN user u USING (user_id)
 WHERE post_id = postid;

END //

DELIMITER ;
--            게시글 아이디 
CALL viewcomment(1);
*/