/*
 * [BOA-10-1] 댓글 등록
 * : CALL, writecomment 프로시저 호출
 * : 사용자 ID, 게시글 ID, 내용 프로시저에 전달
 */

CALL writecomment(2, 1, 1, '이승재 첫 댓글등록입니다.');
