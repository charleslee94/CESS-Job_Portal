class Job < ActiveRecord::Base
    has_many :resumes
    belongs_to :user
    validate :job_not_expired
    validates :expiration, presence: true

    def job_not_expired
       if expiration and expiration.past?
           errors.add(:base, "This job has expired.")
           #self.delete!
       end
    end
    
end
