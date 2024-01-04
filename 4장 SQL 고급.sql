#날짜 : 2024/01/03
#이름 : 최형욱
#내용 : 4장 SQL 고급

#실습 4-1
CREATE TABLE `Member`(
	`uid`	VARCHAR(10) PRIMARY KEY,
    `name`	VARCHAR(10) NOT NULL,
    `hp`	CHAR(13) UNIQUE NOT NULL,
    `pos`	VARCHAR(10) DEFAULT '사원',
    `dep`	INT DEFAULT NULL,
    `rdate`	datetime NOT NULL
);
    
CREATE TABLE `Department`(
	`depNo`	INT PRIMARY KEY,
    `name`	VARCHAR(10) NOT NULL,
    `tel`	CHAR(12) NOT NULL
);

CREATE TABLE `Sales`(
	`seq`	INT PRIMARY KEY AUTO_INCREMENT,
    `uid`	VARCHAR(10) NOT NULL,
    `year`	INT NOT NULL,
    `month`	INT NOT NULL,
    `sale`	INT NOT NULL
);

DROP TABLE `Member`;
DROP TABLE `Department`;
DROP TABLE `Sales`;

SELECT * FROM `Member`;
SELECT * FROM `Sales`;
SELECT * FROM `Department`;
#실습 4-2
INSERT INTO `Member` VALUES ('a101', '박혁거세', '010-1234-1001', '부장', '101', now());
INSERT INTO `Member` VALUES ('a102', '김유신', '010-1234-1002', '차장', '101', now());
INSERT INTO `Member` VALUES ('a103', '김춘추', '010-1234-1003', '사장', '101', now());
INSERT INTO `Member` VALUES ('a104', '장보고', '010-1234-1004', '대리', '102', now());
INSERT INTO `Member` VALUES ('a105', '강감찬', '010-1234-1005', '과장', '102', now());
INSERT INTO `Member` VALUES ('a106', '이성계', '010-1234-1006', '차장', '103', now());
INSERT INTO `Member` VALUES ('a107', '정철', '010-1234-1007', '차장', '103', now());
INSERT INTO `Member` VALUES ('a108', '이순신', '010-1234-1008', '부장', '104', now());
INSERT INTO `Member` VALUES ('a109', '허균', '010-1234-1009', '부장', '104', now());
INSERT INTO `Member` VALUES ('a110', '정약용', '010-1234-1010', '사원', '105', now());
INSERT INTO `Member` VALUES ('a111', '박지원', '010-1234-1011', '사원', '105', now());

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2018, 1, 98100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2018, 1, 136000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2018, 1, 80100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2018, 1, 78000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2018, 1, 93000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2018, 2, 23500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2018, 2, 126000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2018, 2, 18500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2018, 2, 19000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2018, 2, 53000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2019, 1, 24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2019, 1, 109000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2019, 1, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2019, 1, 53500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a107', 2019, 1, 24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2019, 2, 160000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2019, 2, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2019, 2, 43000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2019, 2, 24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2019, 2, 109000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2020, 1, 201000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2020, 1, 63000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2020, 1, 74000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2020, 1, 122000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a107', 2020, 1, 111000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2020, 2, 120000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2020, 2, 93000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2020, 2, 84000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2020, 2, 180000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a108', 2020, 2, 76000);

INSERT INTO `Department` VALUES ('101', '영업1부', '051-512-1001');
INSERT INTO `Department` VALUES ('102', '영업2부', '051-512-1002');
INSERT INTO `Department` VALUES ('103', '영업3부', '051-512-1003');
INSERT INTO `Department` VALUES ('104', '영업4부', '051-512-1004');
INSERT INTO `Department` VALUES ('105', '영업5부', '051-512-1005');
INSERT INTO `Department` VALUES ('106', '영업지원부', '051-512-1006');
INSERT INTO `Department` VALUES ('107', '인사부', '051-512-1007');

#실습 4-3
SELECT * FROM `Member` WHERE `name`='김유신';
SELECT * FROM `Member` WHERE `pos`='차장' AND `dep`=101;
SELECT * FROM `Member` WHERE `pos`='차장' OR `dep`=101;
SELECT * FROM `Member` WHERE `name` != '김춘추';
SELECT * FROM `Member` WHERE `name` <> '김춘추';
SELECT * FROM `Member` WHERE `pos`='사원' OR `pos`='대리';
SELECT * FROM `Member` WHERE `pos` IN('사원', '대리');
SELECT * FROM `Member` WHERE `dep` IN(101, 102, 103);
SELECT * FROM `Member` WHERE `name` LIKE '%신';
SELECT * FROM `Member` WHERE `name` LIKE '김%';
SELECT * FROM `Member` WHERE `name` LIKE '김__';
SELECT * FROM `Member` WHERE `name` LIKE '_성_';
SELECT * FROM `Member` WHERE `name` LIKE '정_';
SELECT * FROM `Sales` WHERE `sale` > 50000;
SELECT * FROM `Sales` WHERE `sale` >= 50000 AND `sale` < 100000 AND `month`=1;
SELECT * FROM `Sales` WHERE `sale` BETWEEN 50000 AND 100000;
SELECT * FROM `Sales` WHERE `sale` NOT BETWEEN 50000 AND 100000;
SELECT * FROM `Sales` WHERE `year` IN(2020);
SELECT * FROM `Sales` WHERE `month` IN(1, 2);


#실습 4-4
SELECT * FROM `Sales` ORDER BY `sale`;
SELECT * FROM `Sales` ORDER BY `sale` ASC;
SELECT * FROM `Sales` ORDER BY `sale` DESC;
SELECT * FROM `Member` ORDER BY `name`;
SELECT * FROM `Member` ORDER BY `name` DESC;
SELECT * FROM `Member` ORDER BY `rdate` ASC;
SELECT * FROM `Sales` WHERE `sale` > 50000 ORDER BY `sale` DESC;
SELECT * FROM `Sales` WHERE `sale` > 50000 ORDER BY `year`, `month`, `sale` DESC;


#실습 4-5
SELECT * FROM `Sales` LIMIT 3;
SELECT * FROM `Sales` LIMIT 0, 3;
SELECT * FROM `Sales` LIMIT 1, 2;
SELECT * FROM `Sales` LIMIT 5, 3;
SELECT * FROM `Sales` ORDER BY `sale` DESC LIMIT 3, 5;
SELECT * FROM `Sales` WHERE `sale` < 50000 ORDER BY `sale` DESC LIMIT 3;
SELECT * FROM `Sales` WHERE `sale` > 50000 ORDER BY `year` DESC, `month`, `sale` DESC LIMIT 5;


#실습4-6
SELECT SUM(sale) AS `합계` FROM `Sales`;
SELECT AVG(sale) AS `평균` FROM `Sales`;
SELECT MAX(sale) AS `최대값` FROM `Sales`;
SELECT MIN(sale) AS `최소값` FROM `Sales`;
SELECT CEILING(1.2);
SELECT CEILING(1.8);
SELECT FLOOR(1.2);
SELECT FLOOR(1.8);
SELECT ROUND(1.2);
SELECT ROUND(1.8);
SELECT RAND();
SELECT CEILING(RAND() * 10);
SELECT COUNT(sale) AS `갯수` FROM `Sales`;
SELECT COUNT(*) AS `갯수` FROM `Sales`;
SELECT LEFT('HelloWorld', 5);
SELECT RIGHT('HelloWorld', 5);
SELECT SUBSTRING('HelloWorld', 6, 5);
SELECT CONCAT('Hello', 'World');
SELECT CONCAT(`uid`, `name`, `hp`) FROM `member` WHERE `uid`='a108';
SELECT CURDATE();
SELECT CURTIME();
SELECT NOW();
INSERT INTO `Member` VALUES ('a112', '유관순', '010-1234-1012', '대리', 107, NOW());


#실습 4-7 
SELECT SUM(`sale`) AS `2018년1월매출의 총합` FROM `Sales` WHERE `year`=2018 AND `month`=1;

#실습 4-8
SELECT SUM(`sale`) AS `총합`, AVG(`sale`) AS `평균` FROM `Sales` WHERE `year`=2019 AND `month`=2 AND `sale` >=50000;

#실습 4-9
SELECT MAX(`sale`) AS `최고`, MIN(`sale`) AS `최저` FROM `Sales` WHERE `year`=2020; 

#실습 4-10
SELECT * FROM `Sales` GROUP BY `uid`;
SELECT * FROM `Sales` GROUP BY `year`;
SELECT * FROM `Sales` GROUP BY `uid`, `year`;
SELECT `uid`, COUNT(*) AS `건수` FROM `Sales` GROUP BY `uid`;
SELECT `uid`, SUM(sale) AS `합계` FROM `Sales` GROUP BY `uid`;
SELECT `uid`, AVG(sale) AS `평균` FROM `Sales` GROUP BY `uid`;
SELECT `uid`, `year`, SUM(sale) AS `합계` FROM `Sales` GROUP BY `uid`, `year`;
SELECT `uid`, `year`, SUM(sale) AS `합계` FROM `Sales` GROUP BY `uid`, `year` ORDER BY `year` ASC, `합계` DESC;
SELECT `uid`, `year`, SUM(sale) AS `합계` FROM `Sales`WHERE `sale` >= 50000 GROUP BY `uid`, `year` ORDER BY `합계` DESC;

 
#실습 4-11
SELECT `uid`, SUM(sale) AS `합계` 
FROM `Sales` 
GROUP BY `uid` HAVING `합계` >= 200000;



#실습 4-12
create table `Sales2` LIKE `Sales`;
insert into `Sales2` select * from `Sales`;
update `Sales2` set `year` = `year` + 3;

select * from `Sales` union select * from `Sales2`;
select * from `Sales` where `sale` >= 100000
union
select * from `Sales2` where `sale`>=100000;

SELECT `uid`, `year`, `sale` FROM `Sales`
UNION 
SELECT `uid`, `year`, `sale` FROM `Sales2`;

SELECT `uid`, `year`, SUM(sale) AS `합계` 
FROM `Sales` 
GROUP BY `uid`, `year`
UNION
SELECT `uid`, `year`, SUM(sale) AS `합계` 
FROM `Sales2` 
GROUP BY `uid`, `year`
ORDER BY `year` ASC, `합계` DESC;

#실습4-13
select * from `Sales` inner join `member` on `Sales`.`uid` = `Member`.`uid`;
select * from `Sales` as a
join `Member` as b on a.uid = b.uid;
select * from `Sales` as a, `Member` as b where a.uid = b.uid;

select * from `Sales` as a
join `Member` as b USING (`uid`);

select * from `Sales` as a
join `Member` as b on a.uid = b.uid
join `Department` as c on b.dep = c.depNo;

select
	a.`uid`,
    a.`year`,
    a.`month`,
    a.`sale`,
    b.`name`,
    b.`hp`,
    c.`name`
from `Sales` as a
join `Member` as b on a.uid = b.uid
join `Department` as c on b.dep = c.depNo;


#실습 4-14
select * from `Sales` as a inner join `Member` as b on a.uid = b.uid;
select * from `Sales` as a left join `Member` as b on a.uid = b.uid;
select * from `Sales` as a right join `Member` as b on a.uid = b.uid;

#실습 4-15

#실습 4-16

#실습 4-17