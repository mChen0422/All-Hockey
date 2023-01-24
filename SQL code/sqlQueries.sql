
/*
a) List the difference in winning percentage for each team in the first and second half of each year.
*/
SELECT
T1.tmID AS tmID,
T1.Tyear AS Tyear,
ROUND(T1.W/T1.G,2) AS FirstHalfWinningRate,
ROUND(T2.W/T2.G,2) AS SecondHalfWinningRate,
ROUND(T1.W/T1.G - T2.W/T2.G,2) AS DiffWinningRate
FROM TeamsHalf AS T1
JOIN TeamsHalf AS T2 
ON T1.tmID = T2.tmID AND T1.Tyear = T2.Tyear
WHERE T1.half = 1 AND T2.half = 2
GROUP BY T1.Tyear, T1.tmID
ORDER BY T1.tmID ASC, T1.Tyear DESC;

/*
b) List the average penalty minute for each position through all the games.
*/

With S AS 
(SELECT pos,  SUM(PIM) AS total, COUNT(*) AS num
	FROM Scoring
	GROUP BY pos
UNION 
SELECT pos, SUM(PIM) AS total, COUNT(*) AS num
	FROM ScoringSC
	GROUP BY pos
UNION 
SELECT pos, SUM(PIM) AS total, COUNT(*) AS num
	FROM ScoringSC
	GROUP BY pos )

SELECT  pos, ROUND(SUM(total)/SUM(num),2) AS AvgPenaltyMin
FROM S
WHERE pos is not null
GROUP BY pos
ORDER BY SUM(total)/SUM(num) ;

/*
c) List the players born and died in a different state and have never been awarded.
*/
SELECT M.playerID
FROM Masters M 
JOIN AwardsPlayers A ON M.playerID = A.playerID
WHERE M.birthState is not null and M.deathState is not null and M.birthState != M.deathState;

/*
d) According to TeamVsTeam, list the team IDs and their names if one has never won any game  (including overtime) against the other.
*/

SELECT T,
SELECT DISTINCT(T.tmID)
FROM TeamVsTeam T
EXCEPT
SELECT DISTINCT(T.tmID)
FROM TeamVsTeam T
WHERE T.W > T.L;

/*
e) List the player id, total points (including regular, post and final Stanely Cups) who has the maximum total points for each year but didn't get award at this year  (if there is a tie, list all).
*/


SELECT P.Syear, P.playerID, P.Total_Pts
FROM (
SELECT T.Syear,T.playerID, T.Total_Pts
FROM (
SELECT Syear, playerID, SUM(pts) AS Total_Pts

FROM (SELECT S.Syear AS Syear, S.playerID AS playerID,IFNULL(S.pts,0) AS pts FROM Scoring S
LEFT JOIN ScoringSC SC ON S.playerID = SC.playerID AND S.Pts = SC.Pts AND S.Syear = SC.year
UNION 
SELECT SC.year AS Syear,SC.playerID AS playerID,IFNULL(SC.pts,0) AS pts FROM Scoring S
RIGHT JOIN ScoringSC SC ON S.playerID = SC.playerID AND S.Pts = SC.Pts AND S.Syear = SC.year) AS U

GROUP BY Syear, playerID) AS T LEFT JOIN 

(
SELECT Syear, playerID, SUM(pts) AS Total_Pts

FROM (SELECT S.Syear AS Syear, S.playerID AS playerID,IFNULL(S.pts,0) AS pts FROM Scoring S
LEFT JOIN ScoringSC SC ON S.playerID = SC.playerID AND S.Pts = SC.Pts AND S.Syear = SC.year
UNION 
SELECT SC.year AS Syear,SC.playerID AS playerID,IFNULL(SC.pts,0) AS pts FROM Scoring S
RIGHT JOIN ScoringSC SC ON S.playerID = SC.playerID AND S.Pts = SC.Pts AND S.Syear = SC.year) AS U

GROUP BY Syear, playerID) AS B on B.Syear = T.Syear AND B.Total_Pts > T.Total_Pts

WHERE B.playerID is Null ) AS P 

LEFT JOIN AwardsPlayers AS A ON P.playerID = A.playerID AND P.Syear = A.Ayear

WHERE A.award IS NULL;

/*
f) List the players who neither have received any awards nor been placed in the Hall of Fame 
#AND the his total vote number and rank from students

!!!!!!!!no student info now
*/

select Name, Vote,dense_rank() over (order by Vote desc) as rank

from StuVote S

where S.Name IN(
	
	SELECT CONCAT(M.firstName," ",M.lastName) AS name
	FROM Masters M
	WHERE M.playerID IN (
	SELECT M.playerID
	FROM Masters AS M 
	WHERE M.hofID IS NULL 
	EXCEPT 
	SELECT playerID
	FROM AwardsPlayers AS A))

order by rank asc,Name asc;

/*
g)
List the id, penalty kill percentage for the team with the highest penalty kill percentage each year. 
The penalty kill percentage formula: power play opportunities - power play goals against)/power play opportunities against.

*/

SELECT A.Tyear, A.tmID, A.penalty_kill_percentage AS MAX_in_year
FROM 
(SELECT Tyear, tmID, IFNULL(ROUND((PPC-PKG)/PPG,3),0) AS penalty_kill_percentage
FROM TeamsPost T) AS A 
LEFT JOIN 
(SELECT Tyear, tmID, IFNULL(ROUND((PPC-PKG)/PPG,3),0) AS penalty_kill_percentage
FROM TeamsPost T) AS B 

ON A.Tyear = B.Tyear AND A.penalty_kill_percentage < B.penalty_kill_percentage

WHERE B.penalty_kill_percentage IS NULL//


/*

#h) List the year, coached team, and winning percentage in the postseason series for each Coach,ordering by winning percentage.
*/

SELECT Co.Cyear, Co.coachID, C.ID, C.rate
FROM Coaches AS Co 
INNER JOIN
(SELECT a.ID, Round(a.totalWins/(a.totalWins+ b.totalLose),4) AS rate
FROM
(SELECT tmIDWinner as ID, IFNULL(COUNT(tmIDWinner),0) AS totalWins
FROM SeriesPost
GROUP BY tmIDWinner) AS a
JOIN
(SELECT tmIDLoser as ID, IFNULL(COUNT(tmIDLoser),0) AS totalLose
FROM SeriesPost
GROUP BY tmIDWinner) AS b on a.ID = b.ID) AS C ON Co.tmID = C.ID
ORDER BY C.rate DESC;

/*
i) List the average weight, height, career length, and lifespan for each position. Lifespan is only calculated by pass-away people.
*/
SELECT
M2.pos AS Position,
ROUND(AVG(M2.weight),2)AS AvgWeight,
ROUND(AVG(M2.height),2) AS AvgHeight,
ROUND(AVG(M2.lastNHL- M2.firstNHL),2) AS AvgCareerLength,
ROUND(M1.AvgLifespan,2) AS AvgLifespan
FROM (SELECT pos ,
AVG(deathYear-birthYear) AS AvgLifespan
FROM Masters
WHERE deathYear is not null AND birthYear is not null AND weight is not null 
and height is not null and lastNHL is not null and firstNHL is not null 
GROUP BY pos) AS M1
JOIN Masters AS M2 ON M1.pos = M2.pos
GROUP BY M2.pos;

/*
j) List the player who has been voted by students most, has played for.*/

SELECT CONCAT(M.firstName," ",M.lastName) AS Name
FROM Masters M
WHERE M.playerID = (
SELECT playerID
FROM StuVote S
ORDER BY Vote DESC
LIMIT 1);


/*
k) Count the total award times (includes being placed in the Hall of Fame) for each goalie regardless of games
*/


SELECT A.playerID, CONCAT(M.firstName," ",M.lastName) AS Name, IFNULL(Total_Appearance,0)
FROM (
SElECT DISTINCT playerID
FROM Goalies AS G 
UNION
SELECT DISTINCT playerID
FROM GoaliesSC AS SC ) AS A
LEFT JOIN 
(SELECT playerID, COUNT(*) AS Total_Appearance
FROM 
(SELECT M.playerID, M.hofID AS Award
FROM Masters AS M 
WHERE M.hofID IS NOT NULL 
UNION ALL
SELECT playerID, A.award AS Award
FROM AwardsPlayers AS A) AS Info) AS B
ON B.playerID = A.playerID
JOiN Masters M 
ON A.playerID = M.playerID ;



/*n) Create View as List player id, player names, total points of players who gain the maximum points per year in Stanley Cup finals in
each position(except golliaes) and the awards they received.(list if there is a tie), using this view, find the average maximum points for each position*/

DROP VIEW IF EXISTS Info;
CREATE VIEW Info AS 
SELECT A.year, A.playerID, CONCAT(M.firstName," ",M.lastName) AS Name, A.pos, A.Pts AS Max_Pts
FROM (
SELECT SC.year, SC.playerID, SC.pos, SC.Pts
FROM ScoringSC AS SC ) AS A 

LEFT JOIN 

(SELECT SC.year, SC.playerID, SC.pos, SC.pts
FROM ScoringSC AS SC ) AS B

ON A.year = B.year AND A.pos = B.pos AND A.Pts < B.Pts

JOiN Masters M ON A.playerID = M.playerID

WHERE B.Pts IS NULL AND A.pos != "G";

SELECT I.pos, ROUND(AVG(I.Max_Pts),2)
FROM Info I
GROUP BY I.pos;



/*o) List the number of players born and died for each state separately, ordered by the number of dead players.
*/

SELECT A.States, pass_away_player,born_player
FROM (
SELECT M.deathState AS States, COUNT(*) AS pass_away_player
FROM Masters M
GROUP BY deathState ) AS A 
INNER JOIN 
(SELECT M.birthState AS States, COUNT(*) AS born_player
FROM Masters M
GROUP BY birthState) AS B ON A.States = B.States
ORDER BY pass_away_player DESC;


-- m)      List each team's id and wining rate in 2000, list the rank.
select Tyear, tmID, sum(W)/sum(G) as WinningRates,
Rank() over(Order by sum(W)/sum(G) DESC ) AS RNK
from  Teams
WHERE Tyear=2000 
Group by  tmID
ORDER BY RNK

--l        List the player id and the number of awards of players. 
select playerID, count(*) TotalAwards from AwardsPlayers GROUP BY playerID ORDER BY count(*) DESC;





