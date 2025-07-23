/* Your first challenge begins now:
The organizers want to identify vulnerable living players who might be easily manipulated for the next game. 
Find all players who are alive, in severe debt (debt > 400,000,000 won), and are either elderly (age > 65) 
OR have a vice of Gambling with no family connections.
*/

select * from player
where status = 'alive' and debt > 400000000 
and (age > 65 or (vice = 'Gambling' and has_close_family=false));

/*
The organizers need to calculate how many food portions to withhold to create the right amount of tension. 
In a table, calculate how many rations would feed 90% of the remaining(alive) non-insider players (rounded down), 
and in another column, indicate if the current rations supply is sufficient. (True or False)
*/

SELECT 
    FLOOR(COUNT(*) * 0.90) AS "Needed rations",
    FLOOR(COUNT(*) * 0.90) <= (SELECT amount FROM rations) AS "Has enough rations"
FROM player 
WHERE status = 'alive' 
AND IsInsider IS FALSE;



