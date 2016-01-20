class Applicant < ActiveRecord::Base
  belongs_to :job_vacancy
  def self.not_applied?(job_vacancy_id, current_user_id)
    Applicant.where(:job_vacancy_id => job_vacancy_id, :applicant_id => current_user_id).empty?
  end

  def applicant_name
    User.find(applicant_id).name
  end

  def applicant_resume_id
    User.find(applicant_id).resume.id
  end
end
