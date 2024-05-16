class AgendaRequest < ApplicationRecord
  include Filterable
  acts_as_paranoid

  #RELATIONSHIPS
  belongs_to :city, optional: true
  belongs_to :requester, class_name: 'Person'
  belongs_to :requested, class_name: 'Person'
  belongs_to :requesting_user, optional: true, class_name: 'User'
  belongs_to :approving_user, optional: true, class_name: 'User'

  #ENUMS
  enum status: {
    not_approved: 1,
    approved: 2
  }, _prefix: :status

  #VALIDATIONS
  validates :city_id, numericality: { only_integer: true }, allow_nil: true
  validate_id :city_id

  validates :requester_id, numericality: { only_integer: true }
  validate_id :requester_id

  validates :requested_id, numericality: { only_integer: true }
  validate_id :requested_id

  validates :requesting_user_id, numericality: { only_integer: true }, allow_nil: true
  validate_id :requesting_user_id

  validates :approving_user_id, numericality: { only_integer: true }, allow_nil: true
  validate_id :approving_user_id

  validates :cellphone_number, :email, :status, presence: true

  #SCOPES
  scope :filter_by_local, -> (local) {
    where("local ILIKE ?", "%#{local}%")
  }

  scope :filter_by_requester_id, -> (requester_id) {
    where("requester_id" => requester_id)
  }

  scope :filter_by_requested_id, -> (requested_id) {
    where("requested_id" => requested_id)
  }

  scope :filter_by_requesting_user_id, -> (requesting_user_id) {
    where("requesting_user_id" => requesting_user_id)
  }

  scope :filter_by_approving_user_id, -> (approving_user_id) {
    where("approving_user_id" => approving_user_id)
  }

  scope :filter_by_city_id, -> (city_id) {
    where("city_id" => city_id)
  }

  scope :filter_by_status, -> (status) {
    where("status" => status)
  }

  #CUSTOM METHODS
  def approve(user)
    if status != "approved"
      update(status: 2)
      set_approving_user(user)
      set_approval_date(Date.today)
    else
      errors.add(:base, "Solicitação de agenda já foi aprovada")
      false
    end
  end

  private

  def set_approval_date(date)
    if date
      update(approval_date: date)
    end
  end

  def set_approving_user(user)
    if user
      update(approving_user: user)
    end
  end

end
