/*
You did such a great job helping Julia with her last coding contest challenge that she wants you to work on this one, too!
The total score of a hacker is the sum of their maximum scores for all of the challenges. 
Write a query to print the 
	hacker_id, 
	name, 
	and total score of the hackers 
ordered by the descending score. 
If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. 
Exclude all hackers with a total score of  from your result.

The following tables contain contest data:
	Hackers: 
		The hacker_id is the id of the hacker, 
		and name is the name of the hacker.
	Submissions: 
		The submission_id is the id of the submission, 
		hacker_id is the id of the hacker who made the submission, 
		challenge_id is the id of the challenge for which the submission belongs to, 
		and score is the score of the submission.
*/
-- create HS table contains: heacker_id, name, challenge_id, max_score join Hacker table and Submission table
with HS as
        (select H.hacker_id hacker_id, H.name name, S.challenge_id, max(S.score) as score
            from Hackers H, Submissions S
            where H.hacker_id = S.hacker_id and S.score <>0
            group by H.hacker_id, H.name, S.challenge_id
         )
-- select column from HS
select HS.hacker_id, HS.name, sum(HS.score)
from HS
group by HS.hacker_id, HS.name
order by sum(HS.score) desc, HS.hacker_id asc;