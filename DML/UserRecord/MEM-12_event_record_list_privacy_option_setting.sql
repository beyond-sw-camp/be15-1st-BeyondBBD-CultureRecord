-- 관람 내역 목록 공개 범위 설정	UPDATE, 사용자 테이블에서  관람 내역 목록 공개범위 값 설정

UPDATE user
   SET privacy_option = 'FOLLOWER'
 WHERE user_id = 2;