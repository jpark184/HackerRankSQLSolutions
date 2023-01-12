select city.name from city
join country on
COUNTRY.CODE = CITY.COUNTRYCODE
where country.continent = "Africa";