-- MEM-26. 팔로우하기 Follow : INSERT, 
-- 팔로우 관계 테이블에 팔로우한 사람 ID, 팔로우 당한 사람 ID 설정하여 삽입

INSERT INTO follow_user (follower_id, followed_user_id, followed_at)
VALUES  (1, 2, NOW())
		, (2, 1, NOW())
		, (2, 3, NOW())
		, (3, 2, NOW())
		, (3, 1, NOW())
		, (1, 3, NOW());