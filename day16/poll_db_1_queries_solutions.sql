-- Query to extract voting data
-- Let’s get going with some simple queries.

-- 1. Count the votes for Sen. Olympia Snowe, whose id is 524.
SELECT COUNT(id) FROM votes WHERE politician_id = 524;
-- COUNT(id) = 23

-- 2. Now do that query with a JOIN statement without hard-coding the id 524 explicitly, querying both the votes and congress_members table.
SELECT COUNT(*) FROM
	votes JOIN congress_members ON votes.politician_id = congress_members.id 
	WHERE congress_members.name = 'Sen. Olympia Snowe';
-- COUNT(*) = 23

-- 3. How about Rep. Erik Paulsen? How many votes did he get?
SELECT COUNT(*) FROM
	votes JOIN congress_members ON votes.politician_id = congress_members.id 
	WHERE congress_members.name = 'Rep. Erik Paulsen';
-- COUNT(*) = 21

-- 4. Make a list of Congress members that got the most votes, in descending order. Exclude the create_at and updated_at columns.
SELECT congress_members.id, name, party, location, grade_1996, grade_current, years_in_congress, dw1_score, COUNT(*) AS votes FROM
	votes JOIN congress_members ON votes.politician_id = congress_members.id 
	GROUP BY congress_members.name
	ORDER BY COUNT(*) DESC
	LIMIT 5;
-- id          name               party       location    grade_1996   grade_current  years_in_congress  dw1_score   votes     
-- ----------  -----------------  ----------  ----------  -----------  -------------  -----------------  ----------  ----------
-- 224         Rep. Dan Benishek  R           MI          11.29829673  11.29829673    1                  0.625       32        
-- 336         Rep. Dale Kildee   D           MI          11.92746368  12.04087167    35                 -0.4        31        
-- 472         Rep. Frank Pallon  D           NJ          12.73500724  11.24205814    25                 -0.423      31        
-- 471         Rep. Jim Costa     D           CA          12.73091018  13.20082289    5                  -0.213      31        
-- 302         Rep. Tammy Baldwi  D           WI          11.75013228  12.92146101    13                 -0.603      31        

-- 5. Now make a list of all the Congress members that got the least number of votes, in ascending order. Again, skip the date columns.
SELECT congress_members.id, name, party, location, grade_1996, grade_current, years_in_congress, dw1_score, COUNT(*) AS votes FROM
	votes JOIN congress_members ON votes.politician_id = congress_members.id 
	GROUP BY congress_members.name
	ORDER BY COUNT(*) ASC
	LIMIT 5;
-- id          name               party       location    grade_1996   grade_current  years_in_congress  dw1_score   votes     
-- ----------  -----------------  ----------  ----------  -----------  -------------  -----------------  ----------  ----------
-- 32          Rep. Bill Cassidy  R           LA          9.385173006  9.285165569    3                  0.43        7         
-- 520         Rep. Jim Sensenbr  R           WI          13.69396284  11.56066479    33                 0.647       7         
-- 506         Rep. Ileana Ros-L  R           FL          13.14271644  12.93132331    23                 0.241       8         
-- 88          Rep. Tim Huelskam  R           KS          10.23278515  10.23278515    1                  0.693       8         
-- 92          Rep. Alan Nunnele  R           MS          10.33893365  10.33893365    1                  0.464       9    

-- Advanced queries to expose voter fraud
-- The Election Board suspects there’s some cheating going on! Help them figure out what is going on and if anyone is to blame.

-- 1. Which Congress member received the most votes? List their name and a count of their votes. Who were the people that voted for that politician? List their names, gender and party.
SELECT name, COUNT(*) AS votes FROM
	votes JOIN congress_members ON votes.politician_id = congress_members.id 
	GROUP BY congress_members.name
	ORDER BY COUNT(*) DESC
	LIMIT 1;
-- name               votes     
-- -----------------  ----------
-- Rep. Dan Benishek  32 

SELECT first_name, last_name, party, gender FROM 
	voters JOIN votes ON voters.id = voter_id
	WHERE politician_id = (SELECT id FROM congress_members WHERE name = 'Rep. Dan Benishek')
	LIMIT 8;
-- first_name  last_name   party        gender    
-- ----------  ----------  -----------  ----------
-- Watson      Mueller     independent  female    
-- Reed        Schneider   democrat     male      
-- Frederique  Schuppe     republican   male      
-- Thurman     Hills       republican   female    
-- Heloise     Schowalter  democrat     female    
-- Halie       Barton      democrat     female    
-- Valentina   Wyman       republican   female    
-- Althea      Bergnaum    democrat     female 

-- 2. How many votes were received by Congress members whose communication grade average was less than 9 (this number can be found in the grade_current field)? List their name, location, grade since 1996, and the vote count.
SELECT name, location, grade_1996, grade_current, COUNT(*) FROM
	votes JOIN congress_members ON votes.politician_id = congress_members.id
	WHERE grade_current < 9
	GROUP BY congress_members.name
	LIMIT 6;
-- name                 location    grade_1996   grade_current  COUNT(*)  
-- -------------------  ----------  -----------  -------------  ----------
-- Rep. Adam Kinzinger  IL          8.995621754  8.995621754    18        
-- Rep. Ander Crenshaw  FL          11.22521629  8.329363943    23        
-- Rep. Collin Peterso  MN          10.41898905  7.370128281    19        
-- Rep. Connie Mack     FL          12.03584092  6.686799034    14        
-- Rep. David Schweike  AZ          8.606102568  8.606102568    17        
-- Rep. Don Young       AK          12.33638826  8.986709512    13 

-- 3. What 10 states had the most voters turnout? (Does this correspond to the population of those states?) List the people that voted in the top state’s elections. (It will be a big list, and you can use the results from your first query to help simplify this next query.)
SELECT location, COUNT(*) FROM
	votes JOIN congress_members ON votes.politician_id = congress_members.id
	GROUP BY location
	ORDER BY COUNT(*) DESC
	LIMIT 10;
-- location    COUNT(*)  
-- ----------  ----------
-- CA          1025      
-- TX          643       
-- NY          582       
-- FL          497       
-- PA          400       
-- IL          395       
-- OH          380       
-- MI          333       
-- NC          297       
-- GA          296  
SELECT first_name, last_name FROM
	votes JOIN voters ON voters.id = voter_id
	JOIN congress_members ON votes.politician_id = congress_members.id
	WHERE location IN 
		(SELECT location FROM
		votes JOIN congress_members ON votes.politician_id = congress_members.id
		GROUP BY location
		ORDER BY COUNT(*) DESC
		LIMIT 10)
	LIMIT 10;
-- first_name  last_name 
-- ----------  ----------
-- Jeffery     Schulist  
-- Brisa       Ratke     
-- Donnell     Durgan    
-- Trevor      Braun     
-- Ephraim     Kertzmann 
-- Fritz       Wiegand   
-- Elenor      Davis     
-- Aglae       Aufderhar 
-- Candace     Torphy    
-- Marian      Cormier  

-- 4. List the people that voted more than 2 times? (It should only be once for their Senator and once for their representative!) Ay Caramba! We have some serious ballot stuffing! Report this to the Election Board!
SELECT voters.id, first_name, last_name, COUNT(*)
	FROM voters JOIN votes ON voters.id = voter_id
	GROUP BY voters.id HAVING COUNT(*) > 2
	LIMIT 10;
-- id          first_name  last_name   COUNT(*)  
-- ----------  ----------  ----------  ----------
-- 1           Aiden       Kuhlman     3         
-- 5           Marshall    Osinski     3         
-- 11          Carmine     Ankunding   3         
-- 14          Caden       Greenfelde  4         
-- 17          Luz         Collins     4         
-- 18          Elenor      Davis       3         
-- 20          Norval      Hilpert     3         
-- 22          Alexzander  Hickle      3         
-- 26          Geo         Christians  3         
-- 28          Verla       Ondricka    5  

-- 5.Did anyone vote for the same politician twice? What was the name of the voter and the politician they voted for? Pretty sneaky…
SELECT first_name,last_name, name, COUNT(*)AS c FROM
	votes JOIN voters ON voters.id = voter_id
	JOIN congress_members ON votes.politician_id = congress_members.id
	GROUP BY voters.id,politician_id HAVING c >= 2;
-- first_name  last_name   name              c         
-- ----------  ----------  ----------------  ----------
-- Dallas      Padberg     Rep. Andy Harris  2         
-- Mckayla     Kilback     Rep. Joe Wilson   2         
-- Kayley      Rohan       Rep. Dale Kildee  2         
-- Amara       Wyman       Rep. Steve Scali  2         
-- Jakayla     Wintheiser  Rep. Donna Edwar  2         
-- Glennie     Raynor      Rep. Stephen Fin  2         
-- Nayeli      Ryan        Sen. Sherrod Bro  2         
-- Armand      Effertz     Rep. Todd Platts  2         
-- Adah        Flatley     Rep. Jim Costa    2         
-- Christiana  Schamberge  Rep. Jeff Forten  2         
-- Jules       Larkin      Rep. Dennis Ross  2         
-- Cynthia     Bruen       Rep. Mike Simpso  2         
-- Efrain      Collier     Sen. Ron Johnson  2         
-- Aubree      Mohr        Rep. Collin Pete  2         
-- Madalyn     Feil        Rep. Kurt Schrad  2         
-- Ronaldo     Douglas     Rep. Jeff Forten  2         
-- Cyrus       Feil        Rep. Mike McInty  2         
-- Rogers      Abshire     Sen. Lamar Alexa  3         
-- Brett       Pollich     Rep. Joe Baca     2         
-- Maryse      Moen        Sen. Bernie Sand  2 
