/*
 * [BOA-12] 댓글 수정
 * : CALL, editcomment 호출 
 * : 사용자ID, 댓글ID, 수정내용 프로시저에 전달
 */

--        (사용자id, 댓글id, 수정내용) 
CALL editcomment(1, 1, '댓글수정 테스트');