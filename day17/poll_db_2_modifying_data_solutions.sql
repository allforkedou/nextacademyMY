--First find out the total number of data in every table.
SELECT COUNT(*) FROM congress_members;
SELECT COUNT(*) FROM voters;
SELECT COUNT(*) from votes;
-- 530
-- 5000
-- 10001

-- Will the Simple adding and deleting part the last to match the sample solutions
-- Simple adding and deleting
-- 1. The Texas vote is close! Add 2 new voters, and fabricate a vote for each of the 2 incumbent senators of Texas. Make up their names and info.
SELECT id, name FROM congress_members WHERE location = 'TX' AND name LIKE 'Sen.%'
-- 145|Sen. Kay Hutchison
-- 499|Sen. John Cornyn
INSERT INTO voters (first_name, last_name, created_at, updated_at)
OUTPUT INSERTED.ID
VALUES
('Ah', 'Kaw', DateTime('now'),DateTime('now')),
('Ah', 'Meow', DateTime('now'),DateTime('now'));

INSERT INTO votes (voter_id, politician_id, created_at, updated_at)
(,145,DateTime('now'),DateTime('now'))
(,499,DateTime('now'),DateTime('now'))

-- 2. Insert another politician, “Donald Trump”. Add suitable attributes and delete one of the senators from New Jersey. Add Trump there instead. Give Trump all the votes from the deleted politician.
SELECT id,name,party FROM congress_members WHERE location = 'NJ' LIMIT 3;
-- 102|Sen. Frank Lautenberg
-- 168|Rep. Bill Pascrell
-- 230|Rep. Rob Andrews
-- Choose 102, sayonara Frank Lautenberg~
UPDATE congress_members 
SET name = 'Donald Trump', party = 'R', location = 'NY', years_in_congress = 0, 
	updated_at = DateTime('now')
WHERE id = 102;

-- Delete specific voters
-- 1. Find all the voters that are not registered as republican or democrat (AND only voted once), and delete them.
DELETE
FROM voters
WHERE voters.id IN
(SELECT voters.id
FROM voters JOIN votes ON voters.id = voter_id
WHERE party NOT IN ('democrat','republican')
GROUP BY voters.id HAVING COUNT(*) = 1);

SELECT COUNT(*) FROM voters;
-- 4788

-- 2. Delete all the voters (and their votes) that are homeowners, employed, have no children, and have been with their party for less than 3 years AND have voted for politicians that speak at a grade level higher than 12.
CREATE TABLE votes_bkup AS SELECT * FROM votes;

DELETE
FROM votes
WHERE voter_id IN
(SELECT DISTINCT voters.id
FROM voters JOIN votes ON voters.id = voter_id
	 		JOIN congress_members ON politician_id = congress_members.id
WHERE homeowner = 1 AND employed = 1 AND children_count = 0 AND party_duration<3 AND grade_current>12);

SELECT COUNT(*) from votes;
--9988

DELETE
FROM voters
WHERE voters.id IN
(SELECT DISTINCT voters.id
FROM voters JOIN votes_bkup ON voters.id = voter_id
	 		JOIN congress_members ON politician_id = congress_members.id
WHERE homeowner = 1 AND employed = 1 AND children_count = 0 AND party_duration<3 AND grade_current>12);

SELECT COUNT(*) FROM voters;
--4783

DROP TABLE votes_bkup;

-- Updating records for more fudging
-- 1. Update the votes for all the men over 80 that have no children. Change their vote to be for the secret politician with ID 346.
UPDATE votes
SET politician_id = 346
WHERE voter_id IN
(SELECT id FROM voters WHERE gender = 'male' AND age>80 AND children_count=0);

SELECT COUNT(*) FROM votes
WHERE politician_id = 346;
--80

-- 2. Update the votes for top smarty pants politician (based on their speaking level - grade_1996). Shift the votes instead to the congress person that speaks at the lowest grade level.
SELECT id FROM congress_members ORDER BY grade_1996 ASC LIMIT 1;
--1
SELECT id FROM congress_members ORDER BY grade_1996 DESC LIMIT 1;
--530
SELECT COUNT(*) FROM votes WHERE politician_id = 1;
--15
SELECT COUNT(*) FROM votes WHERE politician_id = 530;
--15

UPDATE votes
SET politician_id = 1
WHERE politician_id = 530;

SELECT COUNT(*) FROM votes WHERE politician_id = 1;
--30
SELECT COUNT(*) FROM votes WHERE politician_id = 530;
--0

SELECT COUNT(*) FROM congress_members;
SELECT COUNT(*) FROM voters;
SELECT COUNT(*) from votes;
--530
--4783
--9988

-- Will the Simple adding and deleting part the last to match the sample solutions
-- Simple adding and deleting
-- 1. The Texas vote is close! Add 2 new voters, and fabricate a vote for each of the 2 incumbent senators of Texas. Make up their names and info.
SELECT id, name FROM congress_members WHERE location = 'TX' AND name LIKE 'Sen.%'
-- 145|Sen. Kay Hutchison
-- 499|Sen. John Cornyn
INSERT INTO voters (first_name, last_name, gender, party, created_at, updated_at)
VALUES
('Ah', 'Kaw', 'male', 'republican', DateTime('now'),DateTime('now')),
('Ah', 'Meow', 'female', 'republican', DateTime('now'),DateTime('now'));
SELECT COUNT(*) FROM voters;
--4785


INSERT INTO votes (voter_id, politician_id, created_at, updated_at)
VALUES
(5001,145,DateTime('now'),DateTime('now')),
(5002,499,DateTime('now'),DateTime('now'));
--9900

-- 2. Insert another politician, “Donald Trump”. Add suitable attributes and delete one of the senators from New Jersey. Add Trump there instead. Give Trump all the votes from the deleted politician.
SELECT id,name,party FROM congress_members WHERE location = 'NJ' LIMIT 3;
-- 102|Sen. Frank Lautenberg
-- 168|Rep. Bill Pascrell
-- 230|Rep. Rob Andrews
-- Choose 102, sayonara Frank Lautenberg~
UPDATE congress_members 
SET name = 'Donald Trump', party = 'R', location = 'NY', years_in_congress = 0, 
	updated_at = DateTime('now')
WHERE id = 102;

SELECT * FROM congress_members WHERE id =102;
--102|Donald Trump|R|NY|10.46638173|8.892749062|0|-0.417|2012-10-10 15:28:36 -0700|2017-08-21 06:06:15
