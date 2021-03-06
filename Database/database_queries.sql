

 SELECT * FROM flights WHERE dateFlight BETWEEN DATEADD(hh, -8, GETDATE()) AND GETDATE()


