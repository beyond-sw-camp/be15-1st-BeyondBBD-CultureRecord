/*
 * [BOA-14] 댓글 추천 
 * : INSERT, 추천 테이블에서 댓글 추천을 등록함
 * : 사용자ID, 댓글ID, 글 타입 만 입력
 */
INSERT INTO `like` (user_id, comment_id, writing_type)
VALUES
(1, 2, 'comment');