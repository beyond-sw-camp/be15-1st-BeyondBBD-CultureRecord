-- [MEM-06] 회원 탈퇴
-- UPDATE, 사용자 테이블에서 사용자 삭제 여부 = 1로 설정

UPDATE user
   SET is_user_deleted = 1
 WHERE login_id = 'splguyjr';