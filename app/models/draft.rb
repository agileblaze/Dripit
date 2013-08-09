class Draft < ActiveRecord::Base
  belongs_to :user
  attr_accessible :from_email, :from_name, :html_body, :subject, :text_body, :to_email
end
