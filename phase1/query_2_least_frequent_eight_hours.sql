SELECT  Routes.Name, COUNT(Flights.IDRoute) as Route
FROM Routes 
JOIN Flights
ON Flights.IDRoute = Routes.IDRoute


WHERE NOW() - INTERVAL 8 HOUR

GROUP BY Route
ORDER BY COUNT(Route) desc 
LIMIT 10