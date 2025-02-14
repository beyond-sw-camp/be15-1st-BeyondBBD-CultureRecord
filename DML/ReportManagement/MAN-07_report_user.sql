-- [MAN-07] 회원 신고 조회
-- SELECT, 신고 테이블에서 관리자 검토 상태가 0인 모든 행 조회

SELECT DISTINCT r.*, rr.report_reason
FROM report r
JOIN report_check rc ON r.post_id = rc.post_id
JOIN report_reason rr ON r.report_reason_id = rr.report_reason_id
WHERE rc.is_checked = 0;