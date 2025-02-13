-- [MEM-07] 관람 내역 등록 요청
-- INSERT, 관람 내역 테이블에 관람 내역 추가

INSERT
  INTO event_record
(event_id, user_id, admin_id, record_date, ticket_image_url, ticket_num)
VALUES
(1, 2, NULL, '2025-01-18', 'url 링크', '123456789');