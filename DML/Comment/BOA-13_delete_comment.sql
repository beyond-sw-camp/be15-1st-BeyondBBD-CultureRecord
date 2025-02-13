/*
 * [BOA-13] 댓글 삭제 
 * : UPDATE, 프로시저를 사용하여 사용자 ID가 삭제하려고 하는 사용자 ID와 일치하면 댓글 삭제 여부를 1로 변경(soft delete) 
 * :         ID가 일치하지않으면 오류메세지 출력  
 * : 댓글 삭제 여부 업데이트
 */

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
/*           사용자id, 댓글id  */
CALL deletecomment(1,1);