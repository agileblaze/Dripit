class Draft < ActiveRecord::Base
  belongs_to :user
   validates :html_body, presence: true
   validates :subject, presence: true
   validate  :text_body, presence: true
   VALID_EMAIL_REGEX = /\A[\w+\.]+@[a-z\d\.]+\.[a-z]+\z/i
   validates :to_email, presence: true, format: { with: VALID_EMAIL_REGEX }
end
