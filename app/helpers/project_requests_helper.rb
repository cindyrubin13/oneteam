module ProjectRequestsHelper
def current_skill_score(rel_skill)
	
	
	@developer_skills.each do |dev_skill|
		language = Skill.find_by_id(dev_skill.skill_id).language
			
				if language == rel_skill
					@emp_skills.push(language)
					@emp_skills.push(dev_skill.level)
					@skill_score.push(dev_skill.level)
					break
				end
			
	end

@skill_score
@emp_skills
end
def interested_skill_score(rel_skill)
	
	
	@desired_skills.each do |dev_skill|
		language = Skill.find_by_id(dev_skill.skill_id).language
			
				if language == rel_skill
					@emp_skills.push(language)
					@emp_skills.push(dev_skill.level)
					@skill_score.push(dev_skill.level)
					break
				end
			
	end

@skill_score
@emp_skills
end


#def location(office_location)
#	location_array = []
#	 if office_location = 'Chicago'
#	 	location_array.push(41.8819° N, 87.6278° W)
#	 	elsif office_location = 'Mumbai'
#	 	location_array.push(18.9750° N, 72.8258° E)
#	 		elsif office_location = 'New York'
#	 		location_array.push(40.6700° N, 73.9400° W)
#				elsif office_location = 'Los Angeles'
#	 			location_array.push(34.0500° N, 118.2500° W)
#	 				elsif office_location = 'Atlanta'
#	 				location_array.push(33.7550° N, 84.3900° W)
#	 					elsif office_location = 'Detroit'
#	 					location_array.push(42.3314° N, 83.0458° W)
#	 						elsif office_location = 'Houston'
#	 						location_array.push(29.7628° N, 95.3831° W)
#	 							elsif office_location = 'Boston'
#	 							location_array.push(42.3581° N, 71.0636° W)
#	 							end
#	 						end
#						end
#					end
#				end
#			end
#		end
#	end
#	return location_array
#end
	 						



end
