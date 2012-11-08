module ApplicationHelper
	
	# formats date as "name of month" "day of month", "year"
	def format_date(date)
		date.strftime("%B %e, %Y")
	end

end
