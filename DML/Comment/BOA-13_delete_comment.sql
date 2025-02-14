/*
 * [BOA-13] 댓글 삭제 
 * : UPDATE, deletecomment 프로시저 호출
 * : 사용자ID, 댓글ID 프로시저에 전달
 */

--         사용자id, 댓글id 
CALL deletecomment(1,1);

