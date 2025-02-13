/*
 * [PRO-06] 댓글 수정 프로시저
 * : PROCEDURE, 사용자ID, 삭제할 댓글ID를 입력받아
 *  				 comment 테이블에 UPDATE
*/

DROP PROCEDURE IF EXISTS deletecomment;

DELIMITER //

CREATE OR REPLACE PROCEDURE deletecomment(
	IN userid INT,
	IN commentid INT
	
)

BEGIN

	DECLARE nouserid CONDITION FOR SQLSTATE '45000';
	DECLARE EXIT HANDLER FOR nouserid
	BEGIN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '본인이 작성한 댓글만 삭제 가능합니다.';
	END;
	 
	IF (SELECT user_id FROM comment WHERE comment_id = commentid) = userid THEN
		UPDATE comment
			SET is_comment_deleted = 1,
		 		 updated_at = NOW()
			 WHERE comment_id = commentid;
	ELSE 
		SIGNAL nouserid; 
	END IF;
END //

DELIMITER ;