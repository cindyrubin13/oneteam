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

def local(office_location)
    latlng2 = []
    	if office_location == "Chicago"
   			latlng2 = [41.8781136, -87.62979819999998]
   		elsif  office_location == "Mumbai"
     			latlng2 = [19.0759837, 72.87765590000004]
 			elsif office_location == "New York"
      				latlng2 = [40.7143528, -74.0059731]
    			elsif office_location == "Los Angeles"
        				latlng2 = [34.0522342, -118.2436849]
  					elsif office_location == "Atlanta"
       					 	latlng2 = [33.7489954, -84.3879824]
    					elsif office_location == "Detroit"
      							latlng2 = [42.331427,  -83.0457538]
    						elsif office_location == "Houston"
        							latlng2 = [29.7601927, -95.36938959999998]
    							elsif office_location == "Boston"
        								latlng2 = [42.3584308, -71.0597732]
    								elsif office_location == "San Francisco"
     										latlng2 = [37.7749295, -122.41941550000001] 
     									elsif  office_location == "London"
     											latlng2 = [ 51.51121389999999, -0.11982439999997041] 
    	end 
    									
     return latlng2
end

def get_office_location(office_name)
	office_locations = {"Chicago" => [41.8781136, -87.62979819999998],  "London" => [ 51.51121389999999, -0.11982439999997041], "Mumbai" => [19.0759837, 72.87765590000004], "New York" => [40.7143528, -74.0059731], "Los Angeles" => [34.0522342, -118.2436849], "Atlanta" => [33.7489954, -84.3879824], "Detroit" => [42.331427,  -83.0457538], "Houston" => [29.7601927, -95.36938959999998], "Boston" => [42.3584308, -71.0597732], "San Francisco" => [37.7749295, -122.41941550000001]}
	office_locations[office_name]
end


end
