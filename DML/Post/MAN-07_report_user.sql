SELECT DISTINCT r.*, rr.report_reason
FROM report r
JOIN report_check rc ON r.post_id = rc.post_id
JOIN report_reason rr ON r.report_reason_id = rr.report_reason_id
WHERE rc.is_checked = 0;