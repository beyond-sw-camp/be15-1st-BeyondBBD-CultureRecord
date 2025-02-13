/*
 * [BOA-10-1] 댓글 등록
 * : INSERT, 댓글 테이블에서 원하는게시글에 대해서 댓글 작성
 * : 사용자 ID, 게시글 ID, 내용만 입력
 */

INSERT INTO comment (user_id, post_id, content)
VALUES
(1, 1, '이승재 두번째 댓글 등록입니다.');

/*
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
--              사용자ID, 게시글ID, 내용         
CALL writecomment(1,1,'이승재 첫 댓글등록입니다.');
*/