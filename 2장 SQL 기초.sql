#날짜 : 2024/01/02
#이름 : 최형욱
#내용 : 2장 SQL 기초

#실습 2-1
CREATE TABLE `User1` (
	`uid`	VARCHAR(10),
    `name`	VARCHAR(10),
    `hp`	CHAR(13),
    `age`	int
    );
    
    DROP TABLE `User1`;
    
#실습 2-2
INSERT INTO `User1` VALUES('A101', '김유신', '010-1234-1111', 25);
INSERT INTO `User1` VALUES('A102', '김춘추', '010-1234-2222', 23);
INSERT INTO `User1` VALUES('A103', '장보고', '010-1234-3333', 32);
INSERT INTO `User1` (`uid`, `name`, `age`) VALUES('A104', '강감찬', 45);
INSERT INTO `User1` SET `uid`='105', `name`='이순신', `hp`='010-1234-5555';


#실습 2-3
SELECT * FROM `User1`;
SELECT * FROM `User1` WHERE `uid`='A101';
SELECT * FROM `User1` WHERE `name`='김춘추';
SELECT * FROM `User1` WHERE `age` < 30;
SELECT * FROM `User1` WHERE `age` >= 30;
SELECT `uid`, `name`, `age` FROM `User1`;


#실습 2-4
UPDATE `User1` SET `hp`='010-1234-4444' WHERE `uid`='A104';
UPDATE `User1` SET `age`='51' WHERE `uid`='A105';
UPDATE `User1` SET `hp`='010-1234-1001', `age`=27 WHERE `uid`='A101';


#실습 2-5
DELETE FROM `User1` WHERE `uid`='A101';
DELETE FROM `User1` WHERE `uid`='A102' AND `age`=25;
DELETE FROM `User1` WHERE `age` >= 30;