-- [BOA-03] 게시글 상세 조회
-- SELECT, 게시글 테이블에서 게시글 ID로 조회

SELECT p.post_id
       ,pc.category_name
       ,u.nickname
       ,p.post_title
       ,p.post_content
       ,COALESCE(GROUP_CONCAT(a.file_url SEPARATOR ', '), '') AS attachment  -- 첨부파일 URL 리스트
FROM post p
JOIN post_category pc ON pc.category_id = p.category_id
JOIN user u ON u.user_id = p.user_id
LEFT JOIN attachment a ON a.post_id = p.post_id  -- 첨부파일 URL 가져오기
WHERE p.post_id = 45
GROUP BY p.post_id, pc.category_name, u.nickname, p.post_title, p.post_content;