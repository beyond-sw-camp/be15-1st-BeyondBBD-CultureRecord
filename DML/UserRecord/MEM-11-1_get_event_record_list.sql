-- [MEM-11-1] 관람 내역 목록 조회
-- SELECT, 관람 내역 테이블에서 특정 사용자 ID로 관람 내역 숨김 여부 컬럼 값이  0인 행 조회

SELECT *
  FROM user u1
  JOIN event_record e ON u1.user_id = e.user_id
 WHERE e.user_id IN (SELECT f.followed_user_id
  							FROM follow_user f
 							WHERE f.follower_id = 1)
 	AND u1.privacy_option = 'FOLLOWER'
	AND is_hidden = 0;


SELECT *
  FROM user u1
  JOIN event_record e ON u1.user_id = e.user_id
 WHERE u1.privacy_option = 'PUBLIC'
	AND is_hidden = 0;
	

-- 1번을 팔로우한 유저들의 user_id를 추출
SELECT follower_id
  FROM follow_user f
 WHERE f.followed_user_id = 1;

-- 1번이 팔로우한 유저들의 user_id를 추출
SELECT f.followed_user_id
  FROM follow_user f
 WHERE f.follower_id = 1;


SELECT * FROM follow_user;
SELECT * FROM user;
SELECT * FROM event_record;

INSERT INTO follow_user(follower_id, followed_user_id)
VALUES(1,3);