class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :login_count, :last_logged_in_at
  attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      if user.login_count == nil
        user.login_count = 1
        user.last_logged_in_at = Time.now
        user.save
      else
        user.login_count = user.login_count + 1
        user.last_logged_in_at = Time.now
        user.save
      end
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  has_many :emails
  has_many :drafts
  
end
