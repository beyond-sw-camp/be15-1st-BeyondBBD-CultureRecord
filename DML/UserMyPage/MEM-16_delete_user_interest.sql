/*
 * [MEM-17] 관심 분야 삭제
 * : DELETE, 관심분야 테이블에서 사용자 ID와 분야 ID로 조회해서 삭제
 */

DELETE FROM user_interest
	WHERE user_id = 1 AND field_id = 5;