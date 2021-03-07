SELECT routes.Name
	,COUNT(flights.IDRoute) AS Route
FROM routes
JOIN flights ON routes.IDRoute = flights.IDRoute
WHERE NOW() - INTERVAL 8 HOUR
GROUP BY routes.Name
ORDER BY COUNT(Route) ASC LIMIT 10