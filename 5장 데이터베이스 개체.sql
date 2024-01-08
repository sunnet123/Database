#날짜 : 2024/01/08
#이름 : 최형욱
#내용 : 제 5장 데이터베이스 개체

###################
#인덱스
###################
#실습 5-1
SHOW INDEX FROM `User1`;
SHOW INDEX FROM `User2`;
SHOW INDEX FROM `User3`;

#실습 5-2
CREATE INDEX `idx_user1_uid` ON `User1` (`uid`);
ANALYZE TABLE `User1`;

#실습5-3
DROP INDEX `idx_user1_uid` ON `User1`;

###################
#뷰
###################

#실습 5-4
CREATE VIEW `vw_user1` AS (
	SELECT `name`, `hp`, `age` FROM `User1`
);
CREATE VIEW `vw_user4_age_under30` AS (
	SELECT * FROM `User4` WHERE `age` <30
);
CREATE VIEW `vw_member_with_sales` AS (
	SELECT
		a.`uid`		AS `직원아이디`,
        b.`name`	AS `직원이름`,
        b.`pos`		AS `직급`,
        c.`name`	AS `부서명`,
        a.`year`	AS `매출년도`,
        a.`month`	AS `월`,
        a.`sale`	AS `매출액`
	FROM `Sales` AS a
    JOIN `Member` AS b ON a.uid = b.uid
    JOIN `Department` AS c ON b.dep = depNo
);

#실습 5-5
SELECT * FROM `vw_user1`;
SELECT * FROM `vw_user4_age_under30`;
SELECT * FROM `vw_member_with_sales`;

#실습 5-6
DROP VIEW `vw_user1`;
DROP VIEW `vw_user4_age_under30`;
DROP VIEW `vw_member_with_sales`;

###############################
# 저장 프로시저
###############################

#실습 5-7
DELIMITER $$
CREATE PROCEDURE proc_test1()
BEGIN
	SELECT * FROM `Member`;
    SELECT * FROM `Department`;
END $$
DELIMITER ;

CALL proc_test1();

#실습 5-8
DELIMITER $$
	CREATE PROCEDURE proc_test2(IN _userName VARCHAR(10))
    BEGIN
		SELECT * FROM `Member` WHERE `name`=_userName;
	END $$
DELIMITER ;

CALL proc_test2('김유신');

DELIMITER $$
	CREATE PROCEDURE proc_test3(IN _pos VARCHAR(10), IN _dep TINYINT)
    BEGIN
		SELECT * FROM `Member` WHERE `pos`=_pos AND `dep`=_dep;
	END $$
DELIMITER ;

CALL proc_test3('차장', 101);

#실습 5-9
DELIMITER $$
	CREATE PROCEDURE proc_test4(IN _pos VARCHAR(10), OUT _count INT)
    BEGIN
		SELECT COUNT(*) INTO _count FROM `Member` WHERE `pos`=_pos;
	END $$
DELIMITER ;

CALL proc_test4('대리', @_count);
SELECT CONCAT('_count : ', @_count);

DELIMITER $$
	CREATE PROCEDURE proc_test6()
    BEGIN
		DECLARE num1 INT;
        DECLARE num2 INT;
        
        SET num1 = 1;
        SET num2 = 2;
        
        IF(NUM1 > NUM2) THEN
			SELECT 'NUM1이 NUM2보다 크다.' AS '결과1';
		ELSE
            SELECT 'NUM1이 NUM2보다 작다.' AS '결과2';
		END IF;
	END $$
DELIMITER ;

CALL proc_test6();

DELIMITER $$
	CREATE PROCEDURE proc_test7()
    BEGIN
		DECLARE sum INT;
        DECLARE num INT;
        
        SET sum = 0;
        SET num = 1;
        
        WHILE (num <= 10) DO
			SET sum = sum + num;
            SET num = num + 1;
		END WHILE;
        
        SELECT sum AS '1부터 10까지 합계';
	END $$
DELIMITER ;
CALL proc_test7();

#실습 5-10
DELIMITER $$
	CREATE PROCEDURE proc_test8()
    BEGIN
		# 변수 선언
        DECLARE total INT DEFAULT 0;
        DECLARE sale INT;
        DECLARE endOfRow BOOLEAN DEFAULT false;
        
        #커서 선언
        DECLARE salesCursor CURSOR FOR
			SELECT `sale` FROM `Sales`;
		
        #반복 조건
        DECLARE CONTINUE HANDLER
			FOR NOT FOUND SET endOfRow = TRUE;
            
		#커서 열기
        OPEN salesCursor;
        
        cursor_loop: LOOP
			FETCH salesCursor INTO sale;
            
            IF endOfRow THEN
				LEAVE cursor_loop;
			END IF;
            
            SET total = toal + sale;
		END LOOP;
    
		SELECT total AS '전체 합계';
    
		CLOSE salesCursor;
	END $$
DELIMITER ;

CALL proc_test8();

DROP PROCEDURE proc_test8;


#####################
# 저장 함수
#####################

#실습 5-11
DELIMITER $$
CREATE FUNCTION func_test1(_userid VARCHAR(10)) RETURNS INT
BEGIN
	declare total int;
    select sum(`sale`) into total from `Sales` where `uid`=_userid;
	return total;
END $$
DELIMITER ;

SELECT func_test1('a101');

DELIMITER $$
CREATE FUNCTION func_test2(_sale INT) RETURNS DOUBLE
BEGIN
	DECLARE bonus DOUBLE;
    
    IF (_sale >= 100000) THEN
		SET bonus = _sale * 0.1;
	ELSE
		SET bonus = _sale * 0.05;
	END IF;
RETURN bonus;
END $$
DELIMITER ;

SELECT 
	`uid`,
    `year`,
    `month`,
    `sale`,
    func_test2(`sale`) as `bonus`
FROM `Sales`;