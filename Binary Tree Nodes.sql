/*
You are given a table, BST, containing two columns: N and P,
	where N represents the value of a node in Binary Tree, 
	and P is the parent of N.
Write a query to find the node type of Binary Tree ordered by the value of the node.
Output one of the following for each node:
- Root: If node is root node.
- Leaf: If node is leaf node.
- Inner: If node is neither root nor leaf node.
*/
select N as node, 
    case 
         -- when N doesn't have parent
         when P is null then 'Root' 
         -- when N is in P column, N has children
         when N in (select distinct P from BST) then 'Inner' 
         -- when N doesn't has children
         else 'Leaf'
    end as TypeNode
from BST
order by N;