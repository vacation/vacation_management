class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
     unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
     record.errors[attribute] << (options[:message]) || "Please enter an email"
    end
  end
end
class User < ActiveRecord::Base
  has_many :Profile
  #has_secure_password
   attr_accessible :password, :email, :username, :password_confirmation,:approved,:total_times,:employee_type
   attr_accessor :password#,:approved
   before_save :encrypt_password
   validates :password, :confirmation => true, :on => :create
   validates:email, :presence => true, :email => true, :uniqueness => true# :email_format => true
   validates:username, :presence => true, :length => {:minimum => 3}, :uniqueness =>      true
   validates:password, :presence => true, :length => {:minimum => 6}
  def self.authenticate(email,password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
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
end

