/*
 * [PER-10] 공연/전시 찜하기
 * : INSERT, 찜 목록 테이블에 공연/전시 ID, 사용자 ID 설정하여 삽입
 */

INSERT INTO favorite (event_id, user_id, added_at)
VALUES (1, 1, NOW()); -- 각각 공연/전시ID, 사용자 ID 입력

SELECT * FROM favorite;

DELETE FROM favorite
WHERE event_id = 1 AND user_id = 1; -- 각각 공연/전시ID, 사용자 ID 입력