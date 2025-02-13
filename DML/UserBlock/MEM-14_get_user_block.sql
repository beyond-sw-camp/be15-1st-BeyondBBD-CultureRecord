/*
 * [MEM-15] 차단 목록 조회
 * : SELECT, 사용자 ID로 자신이 차단한 유저 ID와 닉네임, 차단한 시각을 차단한 시각 순으로 조회
*/

SELECT 
	u.user_id AS '차단한 유저 닉네임'
	,u.nickname AS '차단당한 유저 닉네임'
	,blocked_at AS '차단한 날짜'
	FROM block_user b
	JOIN user u ON b.`blocked_user_id`= u.user_id
	WHERE blocker_id = 1
	ORDER BY blocked_at DESC;



