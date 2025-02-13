-- MAN-04 관람내역 요청 조회 request_selection : SELECT, 
-- 관람 내역 테이블에서 관리자 검토 상태가 0인 모든 행 조회

INSERT INTO event_record
	(event_record_id, event_id, user_id, admin_id, record_date, ticket_image_url, ticket_num, authentication_date)
VALUES 
	(1, 1, 1, 3, '2025-02-02', 'url', 1111, NOW());

SELECT
	  event_record_id AS '관람내역 ID'
	, event_id AS '공연/전시 ID'
	, user_id AS '사용자ID'
	, admin_id AS '관리자 ID'
	, record_date AS '관람일자'
	, ticket_image_url AS '티켓 이미지 URL'
	, ticket_num AS '티켓일련번호'
	, is_ticket_verified AS '티켓 인증 여부'
	, admin_check_status AS '관리자 검토 상태'
	, authentication_date AS '인증 날짜'
	, is_hidden AS '관람내역 숨김 여부'
FROM event_record
WHERE admin_check_status = 0;