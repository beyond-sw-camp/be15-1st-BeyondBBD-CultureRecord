-- [MEM-11-1] 관람 내역 목록 조회
-- -> [PRO-07] 관람 내역 목록 조회 프로시저 실행
-- 관람 내역 테이블에서 특정 회원 ID로 다른 회원의 관람 내역 조회에 대해 권한(공개, 팔로우만 공개) 검증 이후 관람 내역 숨김 여부 컬럼 값이 0면서 티켓 인증 여부가 1인 행 조회

-- GetEventRecords(IN searched_id INT, IN search_id INT)
-- 입력 매개변수 searched_id는 조회당하는 user의 id, search_id는 관람내역 목록을 조회하는 user의 id
-- 3번 회원이 1번 회원의 관람 내역을 조회하려는 예시
CALL GetEventRecords(1, 3);


-- 테스트용 쿼리문

-- 1번 회원 관람내역 목록 조회
SELECT * FROM event_record er WHERE user_id = 1;

-- 1번은 자신의 관람내역 공개 여부를 '팔로우 공개'로 설정함
SELECT u.user_id, u.privacy_option
  FROM user u
 WHERE u.user_id = 1;
 
-- 3번 회원은 1번 회원을 팔로우하고 있으나 4번 회원은 1번 회원을 팔로우하고 있지 않음
SELECT f.follower_id AS '1번 회원을 팔로우 한 회원 id'
  FROM follow_user f
 WHERE f.followed_user_id = 1;
 
 
-- 1번 회원의 관람 내역 공개 여부를 공개/비공개로 수정해서 다시 테스트
UPDATE user u
   SET u.privacy_option = 'PUBLIC'
 WHERE u.user_id = 1;
 
 
 


-- SELECT, 관람 내역 테이블에서 특정 사용자 ID로 다른 사용자의 관람 내역 조회에 대해 권한(공개, 팔로우만 공개) 검증 이후 관람 내역 숨김 여부 컬럼 값이 0면서 티켓 인증 여부가 1인 행 조회
-- 3번 사용자가 1번 사용자의 관람 내역 목록을 조회하는 상황
-- 서브쿼리를 통해 1차적으로 데이터 추출 이후 비교적 적은 데이터 행으로 다시 JOIN

-- WITH event_record_user AS (
--     SELECT 
--         er.event_record_id, 
--         er.event_id, 
--         er.record_date, 
--         u.nickname
--     FROM user u
--     JOIN event_record er 
--         ON u.user_id = er.user_id
--     WHERE 
--         u.is_user_deleted = 0
--         AND u.user_id = 1
--         AND er.is_hidden = 0
--         AND er.is_ticket_verified = 1
--         AND (
--             u.privacy_option = 'PUBLIC'
--             OR (
--                 u.privacy_option = 'FOLLOWER'
--                 AND 3 IN (
--                     SELECT f.follower_id
--                     FROM follow_user f
--                     WHERE f.followed_user_id = 1
--                 )
--             )
--         )
-- )
-- SELECT 
--     eru.event_record_id AS '관람내역 id', 
--     e.event_id AS '공연/전시 id', 
--     e.title AS '관람공연 제목', 
--     eru.nickname AS '닉네임', 
--     e.poster_image_url AS '포스터 이미지'
-- FROM event_record_user eru
-- JOIN event e 
--     ON eru.event_id = e.event_id
-- ORDER BY eru.record_date ASC;