-- Requête 1 : Top 3 des types d'entraînement par calories brûlées

select
	"Workout_Type", 
	Round(AVG("Calories_Burned"::numeric), 2) as Avg_calories_burned
from final_data
group by "Workout_Type" 
order by Avg_calories_burned desc
limit 3

-- Requête 2 : Calories brûlées par durée d'entraînement

select 
	Round("Session_Duration (hours)"::numeric,1) as duration_hours, 
	Round(AVG("Calories_Burned"::numeric),2) as Avg_calories_burned
from final_data
group by duration_hours
order by duration_hours

-- Requête 3 : Fréquences cardiaques par âge et genre

select 
	"Gender",
	case
		when "Age" < 30 then '18-29'
		when "Age" between 30 and 39 then '30-39'
		when "Age" between 40 and 49 then '40-49'
		else '50+'
	end as Age_group,
	Round(AVG("Avg_BPM")::numeric,2) as avg_bpm,
	Round(AVG("Max_BPM")::numeric,2) as avg_max_bpm	
from final_data
group by "Gender", Age_group
order by Age_group, "Gender"