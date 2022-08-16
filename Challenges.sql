/*
Julia asked her students to create some coding challenges. 
Write a query to print the 
	hacker_id, 
	name, 
	and the total number of challenges created by each student. 
Sort your results by the total number of challenges in descending order. 
If more than one student created the same number of challenges, then sort the result by hacker_id. 
If more than one student created the same number of challenges and the count 
is less than the maximum number of challenges created, then exclude those students from the result.

The following tables contain challenge data:
	Hackers: 
		The hacker_id is the id of the hacker, 
		and name is the name of the hacker.
	Challenges: 
		The challenge_id is the id of the challenge, 
		and hacker_id is the id of the student who created the challenge.
*/
-- create temporary table HC combine Challenges and Hackers contain: 
-- hacker_id, name and count(C.challenge_id)
with HC as
        (select H.hacker_id hacker_id, H.name name, count(C.challenge_id) cnt_challenges
            from  Challenges C, Hackers H
            where C.hacker_id = H.hacker_id
            group by H.hacker_id, H.name
         )

-- select column from HC
select HC.hacker_id, HC.name, HC.cnt_challenges
from HC
where 
        -- choose when cnt_challenges max 
        HC.cnt_challenges = (
                select max(HC.cnt_challenges) from HC
            )
        -- choose when cnt_challenges not max but unique
        or HC.cnt_challenges in (
                select HC.cnt_challenges from HC
                group by HC.cnt_challenges
                having count(HC.cnt_challenges) = 1                
            )
order by HC.cnt_challenges desc, HC.hacker_id