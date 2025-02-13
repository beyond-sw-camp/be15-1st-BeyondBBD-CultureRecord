/*
 * [PRO-03] 댓글 조회 프로시저
 * : PROCEDURE, 게시글ID를 입력받아 댓글ID, 사용자ID, 게시글ID
 *  				 ,부모댓글ID, 닉네임, 내용, 작성 시각을 SELECT
*/

DROP PROCEDURE IF EXISTS viewcomment;

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