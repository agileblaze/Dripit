class Email < ActiveRecord::Base
  attr_accessible :from_email, :from_name, :html_body, :subject, :text_body, :to_email, :user_id
  belongs_to :user
end
