-- MEM-25. 팔로잉 목록 조회 Following List : SELECT, 
-- 팔로우 관계 테이블에서 팔로우 한 사람 ID로 조회

SELECT  
		f.followed_user_id AS '팔로잉 ID'
	 , u.nickname AS '팔로우한 사람 닉네임'	
	 , f.followed_at AS '팔로우 시각'
FROM follow_user f
JOIN user u ON f.followed_user_id = u.user_id
WHERE follower_id = 1;