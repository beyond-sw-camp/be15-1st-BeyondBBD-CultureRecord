/*
 * [PRO-03] 대댓글 작성 프로시저
 * : PROCEDURE, 사용자ID, 게시글ID, 부모댓글ID, 내용을 받아서 
 *  				 comment 테이블에 insert 한다.
*/

DROP PROCEDURE IF EXISTS writeparentcomment;

DELIMITER //

CREATE PROCEDURE writeparentcomment(
	IN userid INT,
	IN postid INT,
	IN parentid INT,
	IN content VARCHAR(1000)
)

BEGIN

INSERT INTO comment (user_id, post_id, parent_id, content)
VALUES
(userid, postid, parentid, content);

END //

DELIMITER ;