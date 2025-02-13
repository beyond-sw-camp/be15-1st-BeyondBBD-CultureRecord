-- [B0A-07] 게시글 삭제
-- UPDATE, 게시글 테이블에서 해당 게시글 ID로 조회한 행의 게시글 삭제 여부 1로 설정

update post 
	set is_post_deleted = 1
WHERE post_id = ?;
