-- [MEM-04] 아이디 찾기
-- SELECT, 사용자 테이블에서 where email = '입력 이메일'로 조회

SELECT login_id
  FROM user
 WHERE email = 'splguyjr@naver.com';