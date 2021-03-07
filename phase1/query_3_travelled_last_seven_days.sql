SELECT routes.IDArrieved
	,COUNT(users.IDUser)
FROM users
INNER JOIN bookings ON users.IDUser = bookings.IDUser
INNER JOIN flights ON bookings.IDFlight = flights.IDFlight
INNER JOIN routes ON flights.IDRoute = routes.IDRoute
WHERE flights.ArrievedTime >= DATE (NOW()) - INTERVAL 7 DAY
GROUP BY routes.IDArrieved
ORDER BY routes.IDArrieved;