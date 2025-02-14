-- 1. 팔로워 목록 조회 Follower List : SELECT, 
-- 팔로우 관계 테이블에서 팔로우 당한 사람 ID로 조회
-- join 해서 사용자의 닉네임도 나오면 좋을 듯. 닉네임, 팔로우한 시각

SELECT
	  follower_id AS '팔로워 ID'
	, u.nickname AS '팔로워 닉네임'
	, followed_at AS '팔로우 시각'
FROM follow_user f
JOIN user u ON f.follower_id = u.user_id
WHERE f.followed_user_id = 1;