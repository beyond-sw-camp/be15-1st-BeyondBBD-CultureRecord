/*
 * [MEM-17] 찜한 공연 조회
 * : SELECT, 찜 목록 테이블과 공연/전시 테이블을 JOIN하여 찜한 공연 포스터, 제목, 찜한시각, 공연상태를 찜한 시각 순으로 조회
*/

SELECT f.event_id AS '공연/전시 ID'
	, e.poster_image_url AS '포스터 이미지 URL'
	, e.title AS '공연/전시 제목'
	, f.added_at AS '찜한 시각'
	, e.event_status AS '공연 상태'
	FROM favorite f
	JOIN event e ON f.event_id = e.event_id
	WHERE user_id = 1
	ORDER BY added_at DESC;