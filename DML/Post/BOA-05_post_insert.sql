-- [BOA-05] 게시글 등록
-- INSERT, 게시글 테이블에 카테고리 ID, 사용자 ID 설정하여 삽입


CALL create_post(1, 1, '게시글 제목', '게시글 내용', 1, 5, '1.png,2.png');
