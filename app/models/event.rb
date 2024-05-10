class Event < ApplicationRecord
  include Filterable
  acts_as_paranoid

  #RELATIONSHIPS
  has_many :attendances, dependent: :destroy
  has_many :people, through: :attendances
  accepts_nested_attributes_for :attendances

  has_many :event_bodies, dependent: :destroy
  has_many :public_bodies, through: :event_bodies
  accepts_nested_attributes_for :event_bodies

  belongs_to :city, optional: true
  belongs_to :agenda_request, optional: true
  belongs_to :user

  #VALIDATIONS
  validates :name, :initial_date, :final_date, presence: true
  validates :active, inclusion: { in: [true, false] }

  #SCOPES
  scope :filter_by_name, -> (name) {
    where("name ILIKE ?", "%#{name}%")
  }

  scope :filter_by_local, -> (local) {
    where("local ILIKE ?", "%#{local}%")
  }

  scope :filter_by_city_id, -> (city_id) {
    where("city_id" => city_id)
  }

  scope :filter_by_agenda_request_id, -> (agenda_request_id) {
    where("agenda_request_id" => agenda_request_id)
  }

  scope :filter_by_user_id, -> (user_id) {
    where("user_id" => user_id)
  }

  scope :filter_by_active, -> (active) {
    where("active" => active)
  }

  scope :filter_by_initial_date, -> (initial_date) {
    where("date >= ?", initial_date)
  }

  scope :filter_by_final_date, -> (final_date) {
    where("date <= ?", final_date)
  }

  scope :filter_by_initial_and_final_date, -> (initial_date, final_date) {
    if initial_date && final_date
      where("date >= ? AND date <= ?", initial_date, final_date)
    end
  }

  #CUSTOM METHODS
  def activate
    if active == false
      update(active: true)
    else
      errors.add(:base, "Evento já está ativo")
      false
    end
  end

  def disable
    if active == true
      update(active: false)
    else
      errors.add(:base, "Evento já está inativo")
      false
    end
  end

end
