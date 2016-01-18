class Resume < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  has_many :emails
  has_many :phones
  has_many :sites
  has_many :experiences
  has_many :educations
  accepts_nested_attributes_for :photos, reject_if: lambda {|attributes| attributes['photo'].blank?}
  accepts_nested_attributes_for :emails, reject_if: lambda {|attributes| attributes['email'].blank?}
  accepts_nested_attributes_for :phones, reject_if: lambda {|attributes| attributes['number'].blank?}
  accepts_nested_attributes_for :sites, reject_if: lambda {|attributes| attributes['name'].blank?}
  accepts_nested_attributes_for :experiences, reject_if: :all_blank
  accepts_nested_attributes_for :educations, reject_if: :all_blank
end

