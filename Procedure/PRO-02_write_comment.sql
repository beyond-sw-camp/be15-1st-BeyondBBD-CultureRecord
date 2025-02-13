/*
 * [PRO-02] 댓글 작성 프로시저
 * : PROCEDURE, 사용자ID, 게시글ID, 내용을 받아서 
 *  				 comment테이블에 INSERT 한다.
*/

DROP PROCEDURE IF EXISTS writecomment;

DELIMITER //

CREATE PROCEDURE writecomment(
	IN userid INT,
	IN postid INT,
	IN content VARCHAR(1000)
)

BEGIN

INSERT INTO comment (user_id, post_id, content)
VALUES
(userid, postid, content);

END //

DELIMITER ;