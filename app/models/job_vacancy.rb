class JobVacancy < ActiveRecord::Base
  belongs_to :user
  has_many :applicants
end
