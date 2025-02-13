/*
 * [MEM-15] 사용자 차단 기능
 * : INSERT, 차단 관계 테이블에 차단한 사람 ID와 차단 당한 사람 ID을 입력하여 삽입
*/

INSERT INTO block_user 
	(blocker_id, blocked_user_id)
	VALUES(1, 3);

