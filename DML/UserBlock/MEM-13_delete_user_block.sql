
/*
 * [MEM-13] 사용자 차단 취소
 * : DELETE, 차단 관계 테이블에서 차단한 사람 ID와 차단 당한 사람 ID로 조회해서 삭제
*/

DELETE FROM block_user
	WHERE blocker_id = 1 AND blocked_user_id = 3;

