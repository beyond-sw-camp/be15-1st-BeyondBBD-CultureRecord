UPDATE post 
SET post_title = '수정본', 
    post_content = '수정본입니다.', 
    updated_at = NOW() 
WHERE post_id = 1 AND is_post_deleted = 0;
