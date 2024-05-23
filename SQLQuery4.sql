select   d.location, d.date, population,
sum(convert(int, v.new_vaccinations))  as rolling_people 
from portfolio..covid_death as d 
    inner join portfolio..covid_vacc as v on d.date=v.date and d.location=v.location
	where d.continent is not null
	group by d.location , d.date 
order by rolling_people desc ;