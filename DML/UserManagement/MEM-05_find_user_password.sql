-- 비밀번호 찾기	UPDATE, 사용자 테이블에서 where id = '유저 아이디'인 row의 비밀번호 업데이트

UPDATE user
   SET PASSWORD = '12345'
 WHERE login_id = 'splguyjr';