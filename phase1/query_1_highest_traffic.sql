WITH highest_routes
AS (
	SELECT r.IDRoute
		,count(f.IDFlight) AS 'totalFlights'
	FROM flights f
	INNER JOIN routes r ON r.IDRoute = f.IDRoute
	GROUP BY r.IDRoute
	)
    
SELECT r.name
	,aDeparture.IataCode
	,aArrive.IataCode
FROM routes r
INNER JOIN highest_routes hr ON hr.IDRoute = r.IDRoute
LEFT JOIN airports aDeparture ON aDeparture.IDAirport = r.IDDepartured
LEFT JOIN airports aArrive ON aArrive.IDAirport = r.IDArrieved
ORDER BY totalFlights DESC