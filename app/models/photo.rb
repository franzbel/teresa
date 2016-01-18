class Photo < ActiveRecord::Base
  belongs_to :resume
  has_attached_file :photo,
                    styles: { resume: "300x300>" },
                    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end
