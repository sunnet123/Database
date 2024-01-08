#날짜 : 2024/01/08
#이름 : 최형욱
#내용 : 제 3장 SQL 기본 문법

#손코딩 p111
USE market_db;

#손코딩 p112
USE market_db;
SELECT * FROM member;

#손코딩 p114
SELECT mem_name FROM member;

#손코딩 p115
SELECT addr, debut_date, mem_name FROM member;

#손코딩 p116
SELECT * FROM membeR WHERE mem_name = '블랙핑크';

#손코딩 p117
SELECT mem_id, mem_name 
	FROM member
    WHERE height <= 162;
    
SELECT mem_name, height, mem_number
	FROM member
    WHERE height >= 165 AND mem_number > 6;

#손코딩 p118
SELECT mem_name, height, mem_number
	FROM member
    WHERE height >= 165 OR mem_number > 6;
    
SELECT mem_name, height
	FROM member
    WHERE height >= 163 AND height <= 165;
    
SELECT mem_name, height
	FROM member
    WHERE height BETWEEN 163 AND 165;
    
#손코딩 p119
SELECT mem_name, addr
	FROM member
    WHERE addr = '경기' OR addr = '전남' OR addr = '경남';
    
SELECT mem_name, addr
	FROM member
    WHERE addr IN('경기', '전남', '경남');
    
SELECT *
	FROM member
    WHERE mem_name LIKE '우%';

#손코딩 p120
SELECT *
	FROM member
    WHERE mem_name LIKE '__핑크';

#손코딩 p126
SELECT mem_id, mem_name, debut_date, height
	FROM member
    ORDER BY height DESC;
#   WHERE height >= 164; 오류 발생

#손코딩 p127
SELECT mem_id, mem_name, debut_date, height
	FROM member
    WHERE height >= 164
    ORDER BY height DESC;
    
SELECT mem_id, mem_name, debut_date, height
	FROM member
    WHERE height >= 164
    ORDER BY height DESC, debut_date ASC;
    
#손코딩 p128
SELECT * FROM member
	LIMIT 3;
    
SELECT mem_name, debut_date
	FROM member
    ORDER BY debut_date
    LIMIT 3;
    
#손코딩 p129
SELECT mem_name, height
	FROM member
    ORDER BY height DESC
    LIMIT 3, 2;
    
SELECT addr FROM member;

#손코딩 p130
SELECT addr FROM member ORDER BY addr;

SELECT DISTINCT addr FROM member;

#손코딩 p131
SELECT mem_id, amount FROM buy ORDER BY mem_id;

#손코딩 p132
SELECT mem_id, SUM(amount) FROM buy GROUP BY mem_id;

SELECT mem_id "회원 아이디", SUM(amount) "총 구매 개수"
	FROM buy GROUP BY mem_id;
    
#손코딩 p133
SELECT mem_id "회원 아이디", SUM(price*amount) "총 구매 금액"
	FROM buy GROUP BY mem_id;
    
SELECT AVG(amount) "평균 구매 개수" FROM buy;

#손코딩 p134
SELECT mem_id, AVG(amount) "평균 구매 개수"
	FROM buy
    GROUP BY mem_id;

SELECT COUNT(*) FROM member;

SELECT COUNT(phone1) "연락처가 있는 회원" FROM member;

SELECT mem_id "회원 아이디", SUM(price*amount) "총 구매 금액"
	FROM buy
    GROUP BY mem_id;
    
#손코딩 p135
SELECT mem_id "회원 아이디", SUM(price*amount) "총 구매 금액"
	FROM buy
    WHERE SUM(price*amount) > 1000;
 #  GROUP BY mem_id;
 
 SELECT mem_id "회원 아이디", SUM(price*amount) "총 구매 금액"
	FROM buy
    GROUP BY mem_id
    HAVING SUM(price*amount) > 1000;
    
#손코딩 p136
SELECT mem_id"회원 아이디", SUM(price*amount) "총 구매 금액"
	FROM buy
    GROUP BY mem_id
    HAVING SUM(price*amount) > 1000
    ORDER BY SUM(price*amount) DESC;

#손코딩 p141
USE market_db;
CREATE TABLE hongong1 (toy_id INT, toy_name CHAR(4), age INT);
INSERT INTO hongong1 VALUES(1, '우디', 25);

INSERT INTO hongong1 (toy_id, toy_name) VALUES (2, '버즈');

INSERT INTO hongong1 (toy_name, age, toy_id) VALUES ('제시', 20, 3);

#손코딩 p142
CREATE TABLE hongong2(
	toy_id INT AUTO_INCREMENT PRIMARY KEY,
    toy_name CHAR(4),
    age INT);
    
INSERT INTO hongong2 VALUES (NULL, '보핍', 25);
INSERT INTO hongong2 VALUES (NULL, '슬링키', 22);
INSERT INTO hongong2 VALUES (NULL, '렉스', 21);
SELECT * FROM hongong2;

SELECT LAST_INSERT_ID();

#손코딩 p143
ALTER TABLE hongong2 AUTO_INCREMENT=100;
INSERT INTO hongong2 VALUES (NULL, '재남', 35);
SELECT * FROM hongong2;

CREATE TABLE hongong3(
	toy_id INT AUTO_INCREMENT PRIMARY KEY,
    toy_name CHAR(4),
    age INT);
ALTER TABLE hongong3 AUTO_INCREMENT=1000;	#시작값은 1000으로 지정
SET @@auto_increment_increment=3;			#증가값은 3으로 지정

#손코딩 p144
INSERT INTO hongong3 VALUES (NULL, '토마스', 20);
INSERT INTO hongong3 VALUES (NULL, '제임스', 23);
INSERT INTO hongong3 VALUES (NULL, '고든', 25);
SELECT * FROM hongong3;

#손코딩 p145
SELECT COUNT(*) FROM world.city;

DESC world.city;

SELECT * FROM world.city LIMIT 5;

#손코딩 p146
CREATE TABLE city_popul (city_name CHAR(35), population INT);

INSERT INTO city_popul 
	SELECT Name, Population FROM world.city;
    
#손코딩 p147
USE market_db;
	UPDATE city_popul
		SET city_name = '서울'
        WHERE city_name = 'Seoul';
SELECT * FROM city_popul WHERE city_name = '서울';

#손코딩 p148
UPDATE city_popul
	SET city_name = '뉴욕', population = 0
    WHERE city_name = 'New York';
SELECT * FROM city_popul WHERE city_name = '뉴욕';

UPDATE city_popul
	SET city_name = '서울';

#손코딩 p149
UPDATE city_popul
	SET population = population / 10000;
SELECT * FROM city_popul LIMIT 5;

#손코딩 p149
DELETE FROM city_popul
	WHERE city_name LIKE 'New%';

#손코딩 p150
DELETE FROM city_popul
	WHERE city_name LIKE 'New%'
    LIMIT 5;
    
#손코딩 p151
CREATE TABLE big_table1 (SELECT * FROM world.city, sakila.country);
CREATE TABLE big_table2 (SELECT * FROM world.city, sakila.country);
CREATE TABLE big_table3 (SELECT * FROM world.city, sakila.country);
SELECT COUNT(*) FROM big_table1;

DELETE FROM big_table1;
DROP TABLE big_table2;
TRUNCATE TABLE big_table3;