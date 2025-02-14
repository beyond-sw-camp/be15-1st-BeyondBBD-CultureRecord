/*
 * [BOA-10-2] 대댓글 등록
 * : CALL, writeparentcomment 프로시저 호출
 * : 사용자 ID, 게시글 ID, 부모 ID, 내용 프로시저에 전달
 */
-- 					  사용자ID,게시글ID,부모댓글ID,내용
CALL writeparentcomment(2,1,1,'이승재 첫번째 대댓글등록입니다.'); 
