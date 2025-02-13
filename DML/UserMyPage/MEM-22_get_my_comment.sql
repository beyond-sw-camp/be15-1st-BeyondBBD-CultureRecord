
/*
 * [MEM-22] 본인 댓글 조회
 * : SELECT, 댓글테이블에서 사용자ID로 댓글과 생성 시각을 생성 시각 순으로 조회한다.
  게시글 테이블과 댓글 테이블과 JOIN해서 부모댓글ID가 존재할경우 부모댓글 내용을, 부모댓글ID가 없을 경우 게시글 제목을 함께 조회한다.
*/

SELECT 
    c.comment_id AS '댓글 ID'
 	,CASE 
        WHEN c.parent_id IS NULL THEN '댓글'  -- 부모 댓글이 없으면 게시글에 달린 댓글
        ELSE '대댓글'  -- 부모 댓글이 있으면 대댓글
    END AS '댓글 유형'
    ,COALESCE(pc.content, p.post_title) AS '댓글이 달린 대상'
    ,c.content AS '댓글 내용'
 	,c.created_at AS '댓글 작성 시각'
	FROM `comment` c
	LEFT JOIN `comment` pc ON c.parent_id = pc.comment_id
	LEFT JOIN post p ON c.parent_id IS NULL AND c.post_id = p.post_id
	WHERE c.user_id = 1 AND c.is_comment_deleted != 1
	ORDER BY c.created_at DESC;
