-- MAN-06 관람내역 요청 거절 event_record_request_reject : UPDATE, 
-- 관람 내역 테이블에서 해당 관람 내역 ID로 조회한 행에 대해 관리자 검토 상태 1, 티켓 인증 여부 0으로 설정

UPDATE event_record
SET admin_check_status = 1, is_ticket_verified = 0, authentication_date = NOW()
WHERE event_record_id = 1;