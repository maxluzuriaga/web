# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  password_digest :text
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  def to_param
    name
  end
  
  has_secure_password
  
  has_many :authentications
  
  has_and_belongs_to_many :sparks
  has_many :ideas
  has_many :comments
  
  validates :email, :presence => true, :format => { :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/, :message => "must be a valid email address" }, :uniqueness => { :case_sensitive => false }
  validates :name, :presence => true
end
