class Relationship < ActiveRecord::Base
  belongs_to :idol, class_name: 'User'
  belongs_to :fan, class_name: 'User'
end
