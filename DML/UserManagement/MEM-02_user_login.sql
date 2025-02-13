-- [MEM-02] 로그인
-- SELECT, 사용자 테이블에서 아이디, 비밀번호 일치하는 회원이 존재하는지 확인

SELECT
		 COUNT(1)
  FROM user
 WHERE login_id = 'splguyjr'
   AND PASSWORD = '1234';