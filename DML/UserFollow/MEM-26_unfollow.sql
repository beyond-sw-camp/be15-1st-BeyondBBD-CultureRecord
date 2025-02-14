-- MEM-27. 언팔로우하기 Unfollow : DELETE, 
-- 팔로우 관계 테이블에서 팔로우한 사람 ID, 팔로우 당한 사람 ID 설정하여 삭제

DELETE 
FROM follow_user
WHERE follower_id = 1 AND followed_user_id = 2;