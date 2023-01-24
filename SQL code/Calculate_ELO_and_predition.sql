
DELIMITER //

DROP TABLE IF EXISTS Modi_Post;
CREATE TABLE Modi_Post AS 

SELECT Syear AS Tyear, tmIDWinner as tmID, tmIDLoser as oppID, W,L,T
FROM SeriesPost
UNION
SELECT Syear AS Tyear, tmIDLoser as tmID, tmIDWinner as oppID, L AS W, W AS L, T
FROM SeriesPost//

DROP TABLE IF EXISTS Modi_Teams;
CREATE TABLE Modi_Teams AS
SELECT Tyear, tmID, oppID,W,L,T
FROM TeamVsTeam T//

alter table Modi_Teams add K int default 2//
alter table Modi_Post add K int default 5//

DROP TABLE IF EXISTS TOTAL_GAME;
CREATE TABLE TOTAL_GAME AS 

SELECT A.Tyear,A.tmID,A.oppID,A.W,A.L,A.T, A.K,
CASE 
WHEN A.W > A.L THEN "Win"
WHEN A.W < A.L THEN "Loss"
ELSE "Tie" 
END AS Statu
FROM 
(SELECT *
FROM Modi_Post UNION 
SELECT *
FROM Modi_Teams) AS A//


DROP TABLE IF EXISTS ELO2//
CREATE TABLE ELO2 AS
SELECT 
DISTINCT tmID,
Tyear,
CAST(0 AS DECIMAL(20, 10)) AS TELO
FROM TeamVsTeam//

DROP PROCEDURE IF EXISTS TeamElo//
CREATE PROCEDURE TeamElo(IN InputYear VARCHAR(255))
BEGIN
DROP TABLE IF EXISTS M;
CREATE TABLE M AS

SELECT BB.Tyear, BB.tmID, SUM(BB.TELO) AS TELO
FROM (SELECT 
    T.Tyear, T.tmID,
    CASE 
    WHEN T.W>T.L THEN IFNULL(E.TELO,0) + T.K*(1.0-1/(1+POW(10,(IFNULL(E2.TELO,0)-IFNULL(E.TELO,0))/400)))
    WHEN  T.W=T.L THEN IFNULL(E.TELO,0) + T.K*(0.5-1/(1+POW(10,(IFNULL(E2.TELO,0)-IFNULL(E.TELO,0))/400)))
    ELSE IFNULL(E2.TELO,0) + T.K*(0.0-1/(1+POW(10,(IFNULL(E2.TELO,0)-IFNULL(E.TELO,0))/400)))
    END AS TELO
 FROM TOTAL_GAME T
    LEFT JOIN ELO2 E ON E.Tyear = T.Tyear-1 AND T.tmID = E.tmID
    LEFT JOIN ELO2 E2 ON E2.Tyear = T.Tyear-1 AND T.oppID = E2.tmID
    WHERE T.Tyear = InputYear) AS BB
GROUP BY BB.tmID, BB.Tyear;

update ELO2 E, M
SET E.TELO = M.TELO
WHERE E.tmID = M.tmID and E.Tyear = M.Tyear;
DROP TABLE IF EXISTS M;
END//

DROP PROCEDURE IF EXISTS UpdateInfo//

Create Procedure UpdateInfo ( IN start_year INT, IN end_year INT)

BEGIN 
     
    DECLARE now_time INT;
    SET now_time = start_year;
    WHILE now_time < end_year DO
    SELECT now_time AS ANS;
    CALL TeamElo(CAST(now_time AS VARCHAR(255)));
    IF MOD(now_time,3) = 0 THEN
    update ELO2 E
    SET E.TELO = E.TELO/10000
    WHERE Tyear = now_time;
    END IF;
    SET now_time= now_time + 1;

    END WHILE;
ENd //


CALL UpdateInfo(1909,2011)//


DROP PROCEDURE IF EXISTS With_Pred//
CREATE PROCEDURE With_Pred(IN pred_year VARCHAR(255))
BEGIN
DROP TABLE IF EXISTS pred_P;
CREATE TABLE pred_P AS 
SELECT T.Tyear, T.Statu, T.tmID, T.oppID,
ROUND(1/(1+POW(10,(E2.TELO-E1.TELO)/400))/(1/(1+POW(10,(E2.TELO-E1.TELO)/400))+1/(1+POW(10,(E1.TELO-E2.TELO)/400))),5)
 AS P_tmWin,
ROUND(1/(1+POW(10,(E1.TELO-E2.TELO)/400))/(1/(1+POW(10,(E2.TELO-E1.TELO)/400))+1/(1+POW(10,(E1.TELO-E2.TELO)/400))),5) AS P_oppWin
FROM TOTAL_GAME T 
JOIN ELO2 E1 ON E1.Tyear = T.Tyear AND E1.tmID = T.tmID
JOIN ELO2 E2 ON E2.Tyear = T.Tyear AND T.oppID = E2.tmID
WHERE T.Tyear = pred_year-1;

DROP VIEW IF EXISTS pred_res;

CREATE VIEW pred_res AS 
SELECT Tyear, tmID, oppID,
CASE 
WHEN P_tmWin > P_oppWin AND Statu = "Win" THEN "True"
WHEN P_tmWin = P_oppWin AND Statu = "Tie" THEN "True"
WHEN P_tmWin < P_oppWin AND Statu = "Loss" THEN "True"
ELSE "False"
END 
AS Result
FROM pred_P;

SELECT SUM(CASE WHEN Result = "True" THEN 1 ELSE 0 END)/(COUNT(*)) AS Correct_Prob
FROM pred_res;
END//


CALL With_Pred("2011")//
