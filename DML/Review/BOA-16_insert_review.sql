/*
 * [BOA-16] 리뷰게시글 등록(이게 사실 1번내용을 업그레이드 시킨거인듯..?)
 * : INSERT, 게시글 테이블과 관람내역 테이블을 조인하여 사용자ID로 묶고
 * :         카테고리ID가 3이고, 티켓인증여부가 1인 값을 별점과 함께 리뷰테이블에 삽입
 * : 게시글ID, 관람내역ID, 별점
 */
INSERT INTO review
SELECT 
		  p.post_id
		, e.event_record_id
		, 5
  FROM post p 
  JOIN event_record e USING (user_id)
   WHERE p.category_id = 3
	  AND e.is_ticket_verified = 1;
	  
