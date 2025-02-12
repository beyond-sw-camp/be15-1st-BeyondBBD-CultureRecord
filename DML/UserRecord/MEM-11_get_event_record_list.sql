-- 관람 내역 목록 조회	SELECT, 사용자 테이블에서 관람 내역 목록 공개범위가 공개, 팔로우만 공개 + 조회하려는 사용자 ID에 대해 팔로워 관계인 경우, 관람 내역 테이블에서 사용자 ID로 관람 내역 숨김 여부 컬럼 값이  0인 행 조회
-- 1번 사용자의 관람 내역 목록 조회

SELECT *
  FROM user u1
  JOIN event_record e ON u1.user_id = e.user_id
 WHERE 
 (privacy_option = 'PUBLIC'
    OR 
	 (u1.user_id IN 
	 (SELECT follower_id
  FROM follow_user f
  JOIN user u2 ON u2.user_id = f.follower_id
 WHERE followed_user_id = 1)
 AND u1.privacy_option = 'FOLLOWER')
) 
	AND is_hidden = 0;