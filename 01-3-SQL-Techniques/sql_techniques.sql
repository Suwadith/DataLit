create table exercise_logs ( 
  id integer primary key auto_increment,  
  type text, 
  minutes integer,  
  calories integer,  
  heart_rate integer
);

insert into exercise_logs(type, minutes, calories, heart_rate) 
values ('biking', 30, 100, 110);

select * from exercise_logs;

select type, sum(calories) as total_calories 
from exercise_logs 
group by type;

select count(*),    
  case         
    when heart_rate > 220 - 30 then 'above max'        
    when heart_rate > round(.9 * (220 - 30)) then 'above target'
    when heart_rate > round(.5 * (220 - 30)) then 'within target'
    else 'below target'    
end as 'heart_rate_zone'
from exercise_logs
group by heart_rate_zone;

/* This is a comment */
create table drs_favorites ( 
  id integer primary key auto_increment,    /* Unique identifier */
  type text,                 /* Type of activity */
  reason text                /* Why the doctor recommends it */
);

insert into drs_favorites(type, reason) 
values ('running', 'improves cardiovascular health.');
  
SELECT * FROM exercise_logs WHERE type IN (SELECT type FROM drs_favorites WHERE reason LIKE "%cardiovascular%");
