class ProjectRequest < ActiveRecord::Base
  attr_accessible :employee_id, :project_help, :start_date, :end_date, :status, :relevant_skill, :title, :group, :office, :request_status, :rstatus
  
  belongs_to :employee
  has_many :responses
  belongs_to :request_selection
  has_one :request_selection
   has_many :rewards
  has_many :evaluations
  accepts_nested_attributes_for :responses, :allow_destroy => true
  accepts_nested_attributes_for :rewards, :allow_destroy => true
  accepts_nested_attributes_for :evaluations
  #belongs_to :rewards
 

  has_and_belongs_to_many :skills
  belongs_to :skills
  
 
  validate :check_end_date
  validates_numericality_of :employee_id, :only_integer => true
  validates :employee_id, presence: true
  validate :start_date, presence: true
  validate :end_date, presence: true
  validate :start_date_before_end_date, presence: true, :message => 'Please check the dates'

  default_scope order: 'project_requests.created_at DESC'


  def start_date_before_end_date
        self.errors.add(:start_date, "must be before end date") if self.start_date >= self.end_date
  end

  def check_end_date
    if end_date < DateTime.now
      errors.add(:end_date,  "End Date can only be later than today")
    end
  end

def match_skills(employee)
  skill_score = []
  relevant_skills = relevant_skill.split(", ")
  skill_length = relevant_skills.length
  x = 0
  while x < skill_length
    skill_id = Skill.find_by_language(relevant_skills.slice(x)).id
    developer_skills = DeveloperSkill.find_all_by_employee_id(employee.id)
    developer_skills.each do |dev_id|
      if dev_id.skill_id == skill_id
        skill_score.push(dev_id.level)
        break
      end
    end
    x = x + 1
  end
  skill_score.sum
end
def match_desired_skills(employee)
  skill_score = []
  relevant_skills = relevant_skill.split(", ")
  skill_length = relevant_skills.length
  x = 0
  while x < skill_length
    skill_id = Skill.find_by_language(relevant_skills.slice(x)).id
    desired_skills = DesiredSkill.find_all_by_employee_id(employee.id)
    desired_skills.each do |des_id|
      if des_id.skill_id == skill_id
        skill_score.push(des_id.level)
        break
      end
    end
    x = x + 1
  end
  skill_score.sum
  end

def duration_in_days
   (end_date.to_date - start_date.to_date).to_i
end 


def current_count(employee)
  overlap_count(relevant_skill, employee.current_skill)
end

def interest_count(employee)
   overlap_count(relevant_skill, employee.skills_interested_in)
end

def overlap_count(skills1, skills2)
   (skills1.split(", ") & skills2.split(", ")).length
end

def update_request_status(project_request)

  if project_request.rstatus == "Cancel"   
  project_request.request_status = 2
  project_request.save
  else
 project_request.request_status = 0
  project_request.save
  end
end

 
#def haversine(lat1, long1, lat2, long2)
 # dtor = Math::PI/180
 # r = 3956.14*1000
 
 # rlat1 = lat1 * dtor 
 # rlong1 = long1 * dtor 
 # rlat2 = lat2 * dtor 
 # rlong2 = long2 * dtor 
 
 # dlon = rlong1 - rlong2
 # dlat = rlat1 - rlat2
 
 # a = (Math.sin(dlat/2))**2 + Math.cos(rlat1) * Math.cos(rlat2) * (Math.sin(dlon/2))**2
 # c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))
  #d = r * c
  
  #return d

#




 def haversine(latlong1, latlong2)
  dtor = 3.141592653589793 / 180
  r = 3956
  
  rlat1 = latlong1[0] * dtor
  rlong1 = latlong1[1] * dtor
  rlat2 = latlong2[0] * dtor
  rlong2 = latlong2[1] *dtor


 dlon = rlong1 - rlong2
  dlat = rlat1 - rlat2
 
  a = (Math.sin(dlat/2))**2 + Math.cos(rlat1) * Math.cos(rlat2) * (Math.sin(dlon/2))**2
  c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))
  d = r * c
 
  return d
end

 


end



