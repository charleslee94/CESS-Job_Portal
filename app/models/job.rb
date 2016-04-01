class Job < ActiveRecord::Base
    has_many :resumes
    validate :job_not_expired
end

def job_not_expired
   if exipiration and exipiration.past?
       errors.add(:base, "this job has expired")
       #self.delete!
   end
end