# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :registerable, :rememberable
  devise :database_authenticatable, :validatable, :recoverable
  include DeviseTokenAuth::Concerns::User

  belongs_to :person, optional: true
  belongs_to :ability_profile, optional: true

  validates :name, presence: true
end
