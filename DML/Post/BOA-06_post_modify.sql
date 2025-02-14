-- [BOA-06] 게시글 수정
-- UPDATE, 게시글 테이블에서 해당 게시글 ID로 조회한 행의 제목, 내용, 수정시각 수정

UPDATE post 
SET post_title = '수정본', 
    post_content = '수정본입니다.', 
    updated_at = NOW() 
WHERE post_id = 1 AND is_post_deleted = 0;
