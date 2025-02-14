/*
 * [PER-11] 공연/전시 예매 중개
 * : SELECT, 예매처 별 공연/전시 테이블에서 특정 공연/전시 ID에 해당하는 행 전부 조회
 */

SELECT 
    e.title, 
    rs.reserve_service_name,
    r.reserve_service_link
FROM reservation r
JOIN event e ON r.event_id = e.event_id 
JOIN reserve_service rs ON r.reserve_service_id = rs.reserve_service_id
WHERE r.event_id = 2;



-- 테스트 수행에 필요한 데이터 insert
/*
INSERT
  INTO reservation  (event_id, reserve_service_id, reserve_service_link)
VALUES
(1, 1, 'https://tickets.interpark.com/goods/24013928'),
(2, 2, 'http://ticket.yes24.com/Perf/51792'),
(2, 1, 'https://tickets.interpark.com/goods/24016737');

SELECT * FROM reservation;
DELETE from reservation ;
*/