-- [BOA-01-02] 제목 사용해서 게시글 검색
-- SELECT, 게시글 테이블에서 검색 키워드를 포함하는 제목의 게시글이면서 게시글 삭제 여부가 0인 행  조회

SELECT  pc.category_name
		, p.post_id
		, p.post_title
		, p.created_at
		, u.nickname
from post p
JOIN user u ON p.user_id = u.user_id
JOIN post_category pc ON pc.category_id = p.category_id
where post_title like "%?%" and is_post_deleted = 0;
ORDER BY created_at DESC;