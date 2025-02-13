/*
 * [BOA-15] 댓글 신고
 * : INSERT, 신고 테이블에서 신고 댓글ID, 사유, 신고자를 관리함 
 * : 댓글ID, 신고 사유ID, 신고자ID 만 입력
 */
INSERT INTO report ( comment_id, report_reason_id, reporter_id)
VALUES
(1, 1, 6);