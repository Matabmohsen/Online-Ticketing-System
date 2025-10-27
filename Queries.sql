

SELECT name, email FROM user1 WHERE username IN (SELECT userUsername FROM ticket
WHERE eventName IN (SELECT Partyname FROM PARTY
WHERE p_date >= (SELECT MAX(p_date) FROM PARTY) --retrieve most recent date, grateter                 equal to recent date
)
);
WHERE ( SELECT COUNT(*) FROM phoneNo p2 WHERE u.username = p2.username) >= 2;
select * from ticket t left outer join user1 u on t.userUsername= u.username;  
SELECT * FROM ticket t RIGHT OUTER JOIN user1 u ON t.userUsername = u.username WHERE t.type = 'vip';
SELECT username FROM user1 MINUS SELECT userUsername FROM ticket
SELECT username FROM (SELECT username FROM user1 UNION SELECT userUsername FROM ticket UNION SELECT AdminName FROM adminn) ;
select max(avg(price)) from ticket group by type
select howManyPArtyAttended('lamarahmed') from dual;
select calculate_total_price('moahmed') from dual;
select calculate_total_price('ranaM') from dual;
SELECT t.eventName, SUM(t.price) as total FROM ticket t GROUP BY t.eventName HAVING COUNT(*) > 1;
SELECT t.eventName, t.type, COUNT(*) as tickets_sold, SUM(t.price) as Total FROM ticket t GROUP BY t.eventName, t.type;
SELECT u.name, u.phoneNumber, p.phoneNumber FROM user1 u JOIN phoneNo p ON u.username = p.username
SELECT eventName, partyDate FROM ticket GROUP BY eventName, partyDate;
SELECT userUsername, type, eventName FROM ticket t WHERE eventName IN (SELECT eventName FROM ticket GROUP BY eventName);
SELECT Check_Admin_Relationship('ahmed', 'mostafa') FROM adminn;
SELECT * FROM PARTY WHERE place = 'New Cairo';
SELECT * FROM PARTY WHERE place = 'New Cairo' AND p_date > DATE'2023-08-03';
SELECT * FROM PARTY WHERE organizers IS NULL OR organizers = '';
SELECT * FROM PARTY WHERE artist = 'Tamer Hosny' AND p_date < '2024-01-01';
select count(*) from ticket where type='regular'
select count(*) from ticket where type='vip'
select count(*) from ticket where type='fan pit'
select avg(price) from ticket where type='regular'
select avg(price) from ticket where type='vip'
select avg(price) from ticket where type='fan pit'
select eventName,name from ticket , user1  where username=userUsername 
select eventName,name from ticket , user1  where username=userUsername and eventName='graduation'
select distinct eventName from ticket where price between 500 and 1000
select userUsername, name,eventName from ticket, user1 where username=userUsername and promotion='yes'
select * from ticket order by id desc
select eventName from ticket where type='regular'
    select count(*), type from ticket group by type

