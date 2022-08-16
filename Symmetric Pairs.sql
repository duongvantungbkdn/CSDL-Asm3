/*
You are given a table, Functions, containing two columns: X and Y.
Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if X1 = Y2 and X2 = Y1.
Write a query to output all such symmetric pairs in ascending order by the value of X.
List the rows such that X1 ≤ Y1.
*/

select A.X, A.Y 
from Functions A, Functions B 
where A.X = B.Y and A.Y = B.X 
-- group the same row
group by A.X, A.Y
-- choose row have more than 1 row if X=Y or X<Y if X<>Y
having count(A.X) > 1 or A.X < A.Y 
order by A.X;