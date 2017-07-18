#One billion seconds... Find out the exact second you were born (if you can). Figure out when you will turn (or perhaps when you did turn?) one billion seconds old. Then go mark your calendar. 
def birthSecBil(year,month,day,hour,min,sec)
	birthday = Time.new(year,month,day,hour,min,sec)
	now = Time.now
	puts 'You have lived '+(now-birthday).to_s+' seconds'
	puts 'The date you will turn one billion seconds old: ' +(birthday+1000000000).to_s
end

#Testing
birthSecBil(2000,12,25,23,59,59)

# Happy Birthday! Ask what year a person was born in, then the month, then the day. Figure out how old they are and give them a big SPANK! for each birthday they have had. 
def birthdaySpank(year,month,day)
	if (Time.now.month >= month)
		if (Time.now.day >= day)
			puts ('Spank'+"\n")*(Time.now.year - year)
			puts 'Total '+(Time.now.year-year).to_s+' Spank(s)!'
		else
			puts ('Spank'+"\n")*(Time.now.year-year-1)
			puts 'Total '+(Time.now.year-year-1).to_s+' Spank(s)!'
		end
	else
		puts ('Spank!'+"\n")*(Time.now.year-year-1)
		puts 'Total '+(Time.now.year-year-1).to_s+' Spank(s)!'
	end
end

#Testing
birthdaySpank(2000,12,25)