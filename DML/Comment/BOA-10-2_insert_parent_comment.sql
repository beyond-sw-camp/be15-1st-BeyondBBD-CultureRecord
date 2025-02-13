/*
 * [BOA-10-2] 대댓글 등록
 * : INSERT, 댓글 테이블에서 원하는 게시글에 존재하는 댓글에 대해서 대댓글 작성
 * : 사용자 ID, 게시글 ID, 부모 ID, 내용만 입력
 */
 
INSERT INTO comment (user_id, post_id, parent_id, content)
VALUES
(1, 1, 1, '이승재 두번째 대댓글 등록입니다.');

/*
DELIMITER //

CREATE OR REPLACE PROCEDURE writeparentcomment(
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
                       -- 사용자ID,게시글ID,부모댓글ID,내용
CALL writeparentcomment(2,1,1,'이승재 두번째 대댓글등록입니다.'); 
 */