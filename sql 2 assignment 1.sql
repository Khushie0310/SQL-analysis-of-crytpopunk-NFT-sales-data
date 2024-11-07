1 question
SELECT * FROM hero_battles;

2 question
SELECT * FROM hero_battles
ORDER BY num_enemies ASC;

3 question
SELECT * FROM hero_battles
ORDER BY num_enemies DESC;

4 question
SELECT * FROM hero_battles
WHERE name = 'Batman'
ORDER BY num_enemies DESC;

5 question
SELECT * FROM hero_battles
WHERE name != 'Batman'
ORDER BY num_enemies DESC;

6 question
SELECT * FROM hero_battles
WHERE num_enemies = 1 OR num_enemies = 2;

7 question 
SELECT * FROM hero_battles
WHERE num_enemies IN (1, 2, 10, 12);

8 question 
SELECT * FROM hero_battles
WHERE name LIKE '%man%';

