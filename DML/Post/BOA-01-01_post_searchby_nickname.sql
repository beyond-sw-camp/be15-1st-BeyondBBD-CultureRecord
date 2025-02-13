-- [BOA-01-01] 닉네임 사용해서 게시글 검색
-- SELECT, 게시글 테이블을 사용자 ID를 통해 사용자 테이블과 조인, 특정 닉네임의 사용자가 작성한 게시글에 대하여 게시글 삭제 여부가 0인 행 조회 ( VIEW 사용 ?)

SELECT  pc.category_name
		, p.post_id
		, p.post_title
		, p.created_at
		, u.nickname
from post p
join user u on p.user_id = u.user_id
JOIN post_category pc ON pc.category_id = p.category_id
where u.nickname like '%미선%' and p.is_post_deleted = 0
ORDER BY created_at DESC;