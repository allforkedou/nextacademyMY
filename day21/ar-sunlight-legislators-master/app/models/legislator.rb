require_relative '../../db/config'
class Legislator < ActiveRecord::Base
	scope :sens, -> {where(title: 'Sen')}
	scope :reps, -> {where(title: 'Rep')}
	scope :sens_active, -> {where(title: 'Sen', in_office: 1)}
	scope :reps_active, -> {where(title: 'Rep', in_office: 1)}

	#Query 1: Given any state, first print out the senators for that state (sorted by last name), then print out the representatives (also sorted by last name). Include the party affiliation next to the name.
	def self.by_states(state)
		list = self.where(state: state)
		sens = []
		reps = []
		for i in 0..list.length-1
			if list[i].title == 'Sen'
				sens << list[i]
			else
				reps << list[i]
			end
		end
		puts 'Senators:'
		for i in 0..sens.length-1
			puts " #{sens[i].firstname} #{sens[i].middlename} #{sens[i].lastname} (#{sens[i].party})".squeeze(" ")
		end

		puts 'Representatives:'
		for j in 0..reps.length-1
			puts " #{reps[j].firstname} #{reps[j].middlename} #{reps[j].lastname} (#{reps[j].party})".squeeze(" ")
		end
	end

	#Query 2: Given a gender, print out what number and percentage of the senators are of that gender as well as what number and percentage of the representatives, being sure to include only those congresspeople who are actively in office.
	def self.gender_percentage(gender)
		g = String.new
		if (gender == 'M')
			g = 'Male'
		elsif(gender == 'F')
			g = 'Female'
		else
			raise ArgumentError.new("Only 'M' or 'F' are allowed")
		end
		gender_sens = sens_active.where(gender: gender).count
		gender_reps = reps_active.where(gender: gender).count
		percentage_sens = gender_sens/sens_active.count
		percentage_reps = gender_reps/reps_active.count
		puts "#{g} Senators: #{gender_sens} (#{gender_sens*100/sens_active.count}%)"
		puts "#{g} Representatives: #{gender_reps} (#{gender_reps*100/reps_active.count}%)"
	end

	#Query 3: Print out the list of states along with how many active senators and representatives are in each, in descending order (i.e., print out states with the most congresspeople first).
	def self.legis_per_state
		state_sens = self.group(:state).order('state asc').sens_active.count
		state_reps = self.group(:state).order('state asc').reps_active.count
		states = []

		#Can skip this step if confirm every state has 2 senators
		state_sens.each do |state, value|
			states << state
		end
		states.each do |state|
			puts "#{state}: #{state_sens[state]} Senators, #{state_reps[state]} Representative(s)"
		end
	end

	#Query 4:For Senators and Representatives, count the total number of each (regardless of whether or not they are actively in office).
	def self.total_legis
		puts "Senators: #{sens.count}"
		puts "Representatives: #{reps.count}"
	end

	def self.delete_inactive
		inactives = self.where(in_office: 0)
		inactives.each do |inactive|
			inactive.destroy
		end
		puts "Senators: #{sens.count}"
		puts "Representatives: #{reps.count}"
	end
end


