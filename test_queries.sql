-- Average Number of Incidents per Location:
-- This query calculates the average number of incidents reported at each unique location. It uses a subquery to count incidents per Location_id and then calculates the average of these counts. The view AverageIncidentsPerLocation stores this single aggregated value.
-- Query 6 :
SELECT AVG(IncidentCount) AS AverageIncidentsPerLocation
FROM (SELECT Location_id, COUNT(Incidents_id) AS IncidentCount
      FROM Incidents
      GROUP BY Location_id) AS LocationIncidentCounts;

-- View 6 :
CREATE VIEW AverageIncidentsPerLocation AS
SELECT AVG(IncidentCount) AS AverageIncidentsPerLocation
FROM (SELECT Location_id, COUNT(Incidents_id) AS IncidentCount
      FROM Incidents
      GROUP BY Location_id) AS LocationIncidentCounts;


-- Cities with More Than a Certain Number of Incidents
-- This query identifies cities that have a total number of reported incidents exceeding a specified threshold (in this case, 100). It joins Locations and Incidents, groups by city, and uses the HAVING clause to filter based on the aggregated count. The view HighIncidentCities provides a list of these high-incident cities.
-- Query 7 :
SELECT l.City, COUNT(i.Incidents_id) AS TotalIncidents
FROM Locations l
JOIN Incidents i ON l.Location_id = i.Location_id
GROUP BY l.City
HAVING COUNT(i.Incidents_id) > 100 -- Adjust the threshold as needed
ORDER BY TotalIncidents DESC;

-- View 7 :
CREATE VIEW HighIncidentCities AS
SELECT l.City, COUNT(i.Incidents_id) AS TotalIncidents
FROM Locations l
JOIN Incidents i ON l.Location_id = i.Location_id
GROUP BY l.City
HAVING COUNT(i.Incidents_id) > 100;


-- Most Common Crime Against Category
-- This query determines the most frequently occurring crime_description from the Crime_against table by joining it with NIBRS, Offenses, and Offenses_has_Incidents to count the number of associated incidents. It groups by the crime description, orders by frequency, and limits the result to the top one. The view MostCommonCrimeAgainst stores this single most frequent crime category.
-- Query 8 :
SELECT ca.crime_description, COUNT(n.NIBRS_code) AS Frequency
FROM Crime_against ca
JOIN NIBRS n ON ca.Crime_against_id = n.Crime_against_id
JOIN Offenses o ON n.NIBRS_code = o.NIBRS_code
JOIN Offenses_has_Incidents ohi ON o.Offense_Code = ohi.Offense_Code
GROUP BY ca.crime_description
ORDER BY Frequency DESC
LIMIT 1;

-- View 8 :
CREATE VIEW MostCommonCrimeAgainst AS
SELECT ca.crime_description, COUNT(n.NIBRS_code) AS Frequency
FROM Crime_against ca
JOIN NIBRS n ON ca.Crime_against_id = n.Crime_against_id
JOIN Offenses o ON n.NIBRS_code = o.NIBRS_code
JOIN Offenses_has_Incidents ohi ON o.Offense_Code = ohi.Offense_Code
GROUP BY ca.crime_description
ORDER BY Frequency DESC
LIMIT 1;

-- Number of Distinct Offense Codes per Police District
-- This query counts the number of unique offense codes reported in each police district. It joins several tables to link police districts to incidents and their associated offenses, then uses COUNT(DISTINCT o.Offense_Code) to get the count of unique offenses per district. The view DistinctOffensesPerDistrict shows the variety of offenses in each district.

-- Query 9 :
SELECT p.police_district_name, COUNT(DISTINCT o.Offense_Code) AS DistinctOffenseCount
FROM Police p
JOIN Locations l ON p.Police_district_id = l.Police_district_id
JOIN Incidents i ON l.Location_id = i.Location_id
JOIN Offenses_has_Incidents ohi ON i.Incidents_id = ohi.Incidents_id
JOIN Offenses o ON ohi.Offense_Code = o.Offense_Code
GROUP BY p.police_district_name
ORDER BY DistinctOffenseCount DESC;

-- View 9 :
CREATE VIEW DistinctOffensesPerDistrict AS
SELECT p.police_district_name, COUNT(DISTINCT o.Offense_Code) AS DistinctOffenseCount
FROM Police p
JOIN Locations l ON p.Police_district_id = l.Police_district_id
JOIN Incidents i ON l.Location_id = i.Location_id
JOIN Offenses_has_Incidents ohi ON i.Incidents_id = ohi.Incidents_id
JOIN Offenses o ON ohi.Offense_Code = o.Offense_Code
GROUP BY p.police_district_name;

