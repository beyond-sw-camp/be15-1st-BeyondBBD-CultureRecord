/*
 * [BOA-12] 댓글 수정
 * : UPDATE, 프로시저를 사용하여 사용자 ID가 수정하려고 하는 사용자 ID와 일치하면 수정 
 * :         ID가 일치하지않으면 오류메세지 출력  
 * : 댓글, 수정시각 업데이트
 */
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
/*             (사용자id, 댓글id, 수정내용)  */
CALL editcomment(1, 1, '댓글수정 테스트');