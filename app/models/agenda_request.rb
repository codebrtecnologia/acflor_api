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
  enum agenda_request_status: {
    not_approved: 1,
    approved: 2
  }, _prefix: :agenda_request_status

  #VALIDATIONS
  validates :cellphone_number, :email, :status, :requester, presence: true

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

  scope :filter_by_city_id, -> (city_id) {
    where("city_id" => city_id)
  }

  scope :filter_by_agenda_request_status, -> (agenda_request_status) {
    where("status" => agenda_request_status)
  }

end
