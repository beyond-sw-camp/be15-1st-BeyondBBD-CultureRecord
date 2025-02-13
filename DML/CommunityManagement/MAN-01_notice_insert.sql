-- MAN-01. 공지사항 등록 NoticeInsert : INSERT, 공지사항 테이블에 관리자 ID 설정하여 삽입

INSERT INTO noticeboard
	(admin_id, notice_title, notice_content, notice_modify_at)
VALUES (3, "first_notice", "testing", NULL);