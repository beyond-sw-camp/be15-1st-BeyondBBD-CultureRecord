/*
 * [PRO-05] 댓글 수정 프로시저
 * : PROCEDURE, 사용자ID, 댓글ID, 수정할 내용을 입력받아
 *  				 comment 테이블에 UPDATE
*/

DROP PROCEDURE IF EXISTS editcomment;

DELIMITER //

CREATE OR REPLACE PROCEDURE editcomment(
	IN userid INT,
	IN commentid INT,
	IN newcontent VARCHAR(1000)
)

BEGIN

	DECLARE nouserid CONDITION FOR SQLSTATE '45000';
	DECLARE EXIT HANDLER FOR nouserid
	BEGIN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '본인이 작성한 댓글이 아닙니다.';
	END;
	 
	IF (SELECT user_id FROM comment WHERE comment_id = commentid) = userid THEN
		UPDATE comment
			SET content = newcontent,
		 		 updated_at = NOW()
			 WHERE comment_id = commentid;
	ELSE 
		SIGNAL nouserid; 
	END IF;
END //

DELIMITER ;