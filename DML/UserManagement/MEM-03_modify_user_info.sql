-- [MEM-03] 회원 정보 수정
-- UPDATE, 사용자 테이블 정보 수정

UPDATE user
   SET phone_number = '010-1234-5678'
  	  , nickname = '짱구'
  	  , profile_image_url = 'url링크'
  	  , gender = 'F'
 WHERE user_id = 10;