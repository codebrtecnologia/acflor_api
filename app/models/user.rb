# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :registerable, :rememberable
  devise :database_authenticatable, :validatable, :recoverable
  include DeviseTokenAuth::Concerns::User

  #RELATIONSHIPS

  # belongs_to :person, optional: true
  belongs_to :ability_profile, optional: true
  has_many :teacher
  # has_many :agenda_requests, foreign_key: 'requesting_user_id', dependent: :restrict_with_exception
  # has_many :agenda_requests, foreign_key: 'approving_user_id', dependent: :restrict_with_exception
  # has_many :appointments, dependent: :restrict_with_exception
  # has_many :email_histories, dependent: :restrict_with_exception

  validates :name, presence: true
end
