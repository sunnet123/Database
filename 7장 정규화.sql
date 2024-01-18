#날짜 : 2024/01/18
#이름 : 최형욱
#내용 : 7장 정규화 실습하기

CREATE TABLE `BookOrder`(
	`orderNo`	int,
    `orderDate`		date,
    `userId`	varchar(10),
    `userName`	varchar(10),
    `userAddr`	varchar(50),
    `bookNo`	int,
    `bookName`	varchar(20),
    `count`		int,
    `price`		int
);

INSERT INTO `BookOrder` VALUES (10001, NOW(), 'a101', '김유신', '김해', 101, '프로그래밍', 1, 28000);
INSERT INTO `BookOrder` VALUES (10002, NOW(), 'a102', '김춘추', '경주', 101, '프로그래밍', 1, 28000);
INSERT INTO `BookOrder` VALUES (10002, NOW(), 'a102', '김춘추', '경주', 102, '자료구조', 2, 16000);
INSERT INTO `BookOrder` VALUES (10003, NOW(), 'a103', '장보고', '완도', 102, '자료구조', 2, 32000);
INSERT INTO `BookOrder` VALUES (10004, NOW(), 'a104', '강감찬', '서울', 110, '데이터베이스', 1, 25000);
INSERT INTO `BookOrder` VALUES (10005, NOW(), 'a105', '이순신', '서울', 110, '데이터베이스', 1, 25000);
INSERT INTO `BookOrder` VALUES (10005, NOW(), 'a105', '이순신', '서울', 102, '자료구조', 1, 16000);

INSERT INTO `User` VALUES('a101', '김유신', '김해');
INSERT INTO `User` VALUES('a102', '김춘추', '경주');
INSERT INTO `User` VALUES('a103', '장보고', '완도');
INSERT INTO `User` VALUES('a104', '강감찬', '서울');
INSERT INTO `User` VALUES('a105', '이순신', '서울');

INSERT INTO `UserOrder` VALUES(10001, NOW(), 'a101');
INSERT INTO `UserOrder` VALUES(10002, NOW(), 'a102');
INSERT INTO `UserOrder` VALUES(10003, NOW(), 'a103');
INSERT INTO `UserOrder` VALUES(10004, NOW(), 'a104');
INSERT INTO `UserOrder` VALUES(10005, NOW(), 'a105');

INSERT INTO `Book` VALUES(101, '프로그래밍');
INSERT INTO `Book` VALUES(102, '자료구조');
INSERT INTO `Book` VALUES(110, '데이터베이스');

INSERT INTO `Order` VALUES(10001, 101, 1, 28000);
INSERT INTO `Order` VALUES(10002, 101, 1, 28000);
INSERT INTO `Order` VALUES(10002, 102, 2, 32000);
INSERT INTO `Order` VALUES(10003, 102, 2, 32000);
INSERT INTO `Order` VALUES(10004, 110, 1, 25000);
INSERT INTO `Order` VALUES(10005, 110, 1, 25000);
INSERT INTO `Order` VALUES(10005, 102, 1, 16000);