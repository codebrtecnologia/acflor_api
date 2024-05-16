class Attendance < ApplicationRecord
  include Filterable
  acts_as_paranoid

  before_create :generate_confirmation_token

  #RELATIONSHIPS
  belongs_to :event
  belongs_to :person

  has_many :email_histories

  #VALIDATIONS
  validates :confirmed_presence, inclusion: { in: [true, false] }

  # validates :event_id, presence: true, numericality: { only_integer: true }
  # validate_id :event_id
  #
  # validates :person_id, presence: true, numericality: { only_integer: true }
  # validate_id :person_id

  #SCOPES
  scope :confirmed, -> { where(confirmed_presence: true) }

  #CUSTOM METHODS
  def self.find_by_confirmation_token(token)
    find_by(confirmation_token: token)
  end

  def generate_confirmation_token
    self.confirmation_token = SecureRandom.urlsafe_base64(20)
    self.confirmation_token_expires_at = 2.days.from_now
  end

end
