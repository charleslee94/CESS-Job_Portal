class Job < ActiveRecord::Base
    has_many :resumes
    validates :job_not_expired
    validates :expiration, presence: true
    validates :school, presence: true
end

def job_not_expired
   if expiration and expiration.past?
       errors.add(:base, "This job has expired.")
       #self.delete!
   end
end
