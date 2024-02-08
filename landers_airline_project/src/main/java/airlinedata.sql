use airline;

-- user 테이블에 더미 데이터 삽입
INSERT INTO user (user_id, user_pw, user_name, user_phone, user_address)
VALUES
    ('abc', '123', '관리자', '01011111111', '서울시 강남구'),
    ('user1', 'password1', '홍길동', '01012345678', '서울시 강남구'),
    ('user2', 'password2', '김영희', '01056781234', '서울시 서초구'),
    ('user3', 'password3', '이철수', '01078901234', '서울시 마포구');

-- flight_info 테이블에 더미 데이터 삽입
INSERT INTO flight_info (flight_name, departure_airport, arrival_airport, departure_date, arrival_date, price)
VALUES
    ('SSG03', '인천', '제주', '202402051614', '202402060930', 90000),
    ('SSG03', '김포', '김해', '202402102030', '202402111200', 90000),
    ('SSG03', '김해', '인천', '202402152345', '202402160500', 80000);

-- seat 테이블에 더미 데이터 삽입	(seat_price 3: 퍼스트, 2: 비즈니스, 1: 이코노미)
INSERT INTO seat (flight_id, seat_name, seat_price, is_available)
VALUES
    (1, 'A1', 3, 1),
    (1, 'A2', 3, 1),
    (1, 'A3', 3, 1),
    (1, 'A4', 3, 1),
    (1, 'B1', 2, 1),
    (1, 'B2', 2, 1),
    (1, 'B3', 2, 1),
    (1, 'B4', 2, 1),
    (1, 'C1', 1, 1),
    (1, 'C2', 1, 1),
    (1, 'C3', 1, 1),
    (1, 'C4', 1, 1),
    (1, 'C5', 1, 1),
    (1, 'C6', 1, 1),
    (1, 'C7', 1, 1),
    (1, 'C8', 1, 1),
    (1, 'C9', 1, 1),
    (1, 'C10', 1, 1),
    (1, 'C11', 1, 1),
    (1, 'C12', 1, 1),
    
    (2, 'A1', 3, 1),
    (2, 'A2', 3, 1),
    (2, 'A3', 3, 1),
    (2, 'A4', 3, 1),
    (2, 'B1', 2, 1),
    (2, 'B2', 2, 1),
    (2, 'B3', 2, 1),
    (2, 'B4', 2, 1),
    (2, 'C1', 1, 1),
    (2, 'C2', 1, 1),
    (2, 'C3', 1, 1),
    (2, 'C4', 1, 1),
    (2, 'C5', 1, 1),
    (2, 'C6', 1, 1),
    (2, 'C7', 1, 1),
    (2, 'C8', 1, 1),
    (2, 'C9', 1, 1),
    (2, 'C10', 1, 1),
    (2, 'C11', 1, 1),
    (2, 'C12', 1, 1),
    
    (3, 'A1', 3, 1),
    (3, 'A2', 3, 1),
    (3, 'A3', 3, 1),
    (3, 'A4', 3, 1),
    (3, 'B1', 2, 1),
    (3, 'B2', 2, 1),
    (3, 'B3', 2, 1),
    (3, 'B4', 2, 1),
    (3, 'C1', 1, 1),
    (3, 'C2', 1, 1),
    (3, 'C3', 1, 1),
    (3, 'C4', 1, 1),
    (3, 'C5', 1, 1),
    (3, 'C6', 1, 1),
    (3, 'C7', 1, 1),
    (3, 'C8', 1, 1),
    (3, 'C9', 1, 1),
    (3, 'C10', 1, 1),
    (3, 'C11', 1, 1),
    (3, 'C12', 1, 1);
    
    
    
    
    -- schedule 테이블에 더미 데이터 삽입
INSERT INTO schedule (departure_airport, arrival_airport, departure_date, person_num)
VALUES 
    ('인천', '제주', '2024-02-10 14:30:00', 1),
    ('김포', '김해', '2024-02-15 10:00:00', 2),
    ('김해', '인천', '2024-02-20 18:45:00', 3);
    
    
   -- 여러 개의 티켓 더미 데이터 추가
-- 티켓 1
INSERT INTO ticket (user_id, schedule_id, final_price, final_date, flight_id, seat_id)
VALUES ('abc', 1, 50000, '2024-02-10 14:30:00', 1, 1),
       ('user1', 1, 60000, '2024-02-15 10:00:00', 2, 2),
       ('user2', 1, 75000, '2024-02-20 18:45:00', 1, 3);

-- 티켓 2
INSERT INTO ticket (user_id, schedule_id, final_price, final_date, flight_id, seat_id)
VALUES ('user1', 2, 55000, '2024-02-12 15:30:00', 1, 5),
       ('user2', 2, 70000, '2024-02-17 11:30:00', 2, 7),
       ('user3', 2, 80000, '2024-02-22 20:15:00', 1, 9);

-- 티켓 3
INSERT INTO ticket (user_id, schedule_id, final_price, final_date, flight_id, seat_id)
VALUES ('user1', 3, 60000, '2024-02-14 16:45:00', 1, 13),
       ('user2', 3, 72000, '2024-02-19 14:00:00', 2, 16),
       ('user3', 3, 85000, '2024-02-24 22:30:00', 1, 18);
       
      
             -- 환불리스트
 INSERT INTO refund (user_id, ticket_id, content, refund_status)
VALUES
	( 'user1',8, '단순변심', '대기' ),
	( 'user2',9, '다른여행일정', '대기' );