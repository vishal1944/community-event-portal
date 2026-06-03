-- solutions.sql

-- 1
SELECT e.* FROM Events e
JOIN Registrations r ON e.event_id=r.event_id
JOIN Users u ON u.user_id=r.user_id
WHERE e.status='upcoming' AND e.city=u.city
ORDER BY e.start_date;

-- 2
SELECT e.title, AVG(f.rating) avg_rating
FROM Events e JOIN Feedback f ON e.event_id=f.event_id
GROUP BY e.event_id,e.title
HAVING COUNT(f.feedback_id)>=10
ORDER BY avg_rating DESC;

-- 3
SELECT u.* FROM Users u
LEFT JOIN Registrations r ON u.user_id=r.user_id
GROUP BY u.user_id
HAVING MAX(r.registration_date) < CURDATE()-INTERVAL 90 DAY OR MAX(r.registration_date) IS NULL;

-- 4
SELECT e.title, COUNT(*) session_count
FROM Events e JOIN Sessions s ON e.event_id=s.event_id
WHERE TIME(s.start_time) BETWEEN '10:00:00' AND '12:00:00'
GROUP BY e.event_id;

-- 5
SELECT u.city, COUNT(DISTINCT r.registration_id) registrations
FROM Users u JOIN Registrations r ON u.user_id=r.user_id
GROUP BY u.city
ORDER BY registrations DESC LIMIT 5;

-- 6
SELECT e.title,
SUM(resource_type='pdf') pdfs,
SUM(resource_type='image') images,
SUM(resource_type='link') links
FROM Events e LEFT JOIN Resources r ON e.event_id=r.event_id
GROUP BY e.event_id;

-- 7
SELECT u.full_name,f.comments,e.title
FROM Feedback f
JOIN Users u ON u.user_id=f.user_id
JOIN Events e ON e.event_id=f.event_id
WHERE f.rating<3;

-- 8
SELECT e.title, COUNT(s.session_id) session_count
FROM Events e LEFT JOIN Sessions s ON e.event_id=s.event_id
WHERE e.status='upcoming'
GROUP BY e.event_id;

-- 9
SELECT u.full_name,e.status,COUNT(*) total_events
FROM Events e JOIN Users u ON e.organizer_id=u.user_id
GROUP BY u.user_id,e.status;

-- 10
SELECT e.title
FROM Events e
JOIN Registrations r ON e.event_id=r.event_id
LEFT JOIN Feedback f ON e.event_id=f.event_id
GROUP BY e.event_id
HAVING COUNT(DISTINCT f.feedback_id)=0;

-- 11
SELECT registration_date,COUNT(*) users_count
FROM Users
WHERE registration_date>=CURDATE()-INTERVAL 7 DAY
GROUP BY registration_date;

-- 12
SELECT e.title,COUNT(s.session_id) cnt
FROM Events e JOIN Sessions s ON e.event_id=s.event_id
GROUP BY e.event_id
HAVING cnt=(SELECT MAX(c) FROM (SELECT COUNT(*) c FROM Sessions GROUP BY event_id)x);

-- 13
SELECT e.city,AVG(f.rating) avg_rating
FROM Events e JOIN Feedback f ON e.event_id=f.event_id
GROUP BY e.city;

-- 14
SELECT e.title,COUNT(r.registration_id) total_regs
FROM Events e LEFT JOIN Registrations r ON e.event_id=r.event_id
GROUP BY e.event_id
ORDER BY total_regs DESC LIMIT 3;

-- 15
SELECT s1.event_id,s1.title,s2.title
FROM Sessions s1
JOIN Sessions s2 ON s1.event_id=s2.event_id
AND s1.session_id<s2.session_id
AND s1.start_time<s2.end_time
AND s2.start_time<s1.end_time;

-- 16
SELECT u.* FROM Users u
LEFT JOIN Registrations r ON u.user_id=r.user_id
WHERE u.registration_date>=CURDATE()-INTERVAL 30 DAY
GROUP BY u.user_id
HAVING COUNT(r.registration_id)=0;

-- 17
SELECT speaker_name,COUNT(*) sessions_handled
FROM Sessions
GROUP BY speaker_name
HAVING COUNT(*)>1;

-- 18
SELECT e.title
FROM Events e
LEFT JOIN Resources r ON e.event_id=r.event_id
WHERE r.resource_id IS NULL;

-- 19
SELECT e.title,COUNT(DISTINCT r.registration_id) registrations,AVG(f.rating) avg_rating
FROM Events e
LEFT JOIN Registrations r ON e.event_id=r.event_id
LEFT JOIN Feedback f ON e.event_id=f.event_id
WHERE e.status='completed'
GROUP BY e.event_id;

-- 20
SELECT u.full_name,
COUNT(DISTINCT r.event_id) events_attended,
COUNT(DISTINCT f.feedback_id) feedbacks_submitted
FROM Users u
LEFT JOIN Registrations r ON u.user_id=r.user_id
LEFT JOIN Feedback f ON u.user_id=f.user_id
GROUP BY u.user_id;

-- 21
SELECT u.full_name,COUNT(*) feedback_count
FROM Feedback f JOIN Users u ON u.user_id=f.user_id
GROUP BY u.user_id
ORDER BY feedback_count DESC LIMIT 5;

-- 22
SELECT user_id,event_id,COUNT(*) duplicate_count
FROM Registrations
GROUP BY user_id,event_id
HAVING COUNT(*)>1;

-- 23
SELECT DATE_FORMAT(registration_date,'%Y-%m') month,COUNT(*) registrations
FROM Registrations
WHERE registration_date>=CURDATE()-INTERVAL 12 MONTH
GROUP BY month;

-- 24
SELECT e.title,
AVG(TIMESTAMPDIFF(MINUTE,s.start_time,s.end_time)) avg_duration
FROM Events e JOIN Sessions s ON e.event_id=s.event_id
GROUP BY e.event_id;

-- 25
SELECT e.title
FROM Events e
LEFT JOIN Sessions s ON e.event_id=s.event_id
WHERE s.session_id IS NULL;
