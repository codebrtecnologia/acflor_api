class Event < ApplicationRecord
  include Filterable
  acts_as_paranoid

  #RELATIONSHIPS
  has_many :attendances
  has_many :people, through: :attendances
  accepts_nested_attributes_for :attendances, allow_destroy: true

  has_many :event_bodies
  has_many :public_bodies, through: :event_bodies
  accepts_nested_attributes_for :event_bodies, allow_destroy: true

  has_many :event_dates
  accepts_nested_attributes_for :event_dates, allow_destroy: true

  belongs_to :city, optional: true
  belongs_to :agenda_request, optional: true
  belongs_to :user

  #VALIDATIONS
  validates :name, presence: true
  validates :active, inclusion: { in: [true, false] }
  validate :must_have_at_least_one_event_date

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
    joins(:event_dates).where("event_dates.date >= ?", initial_date)
  }

  scope :filter_by_final_date, -> (final_date) {
    joins(:event_dates).where("event_dates.date <= ?", final_date)
  }

  scope :filter_by_initial_and_final_date, -> (initial_date, final_date) {
    if initial_date && final_date
      joins(:event_dates).where("event_dates.date >= ? AND event_dates.date <= ?", initial_date, final_date)
    end
  }

  scope :filter_by_start_time, -> (start_time) {
    joins(:event_dates).where("event_dates.start_time >= ?", start_time)
  }

  scope :filter_by_end_time, -> (end_time) {
    joins(:event_dates).where("event_dates.date <= ?", end_time)
  }

  scope :filter_by_start_and_end_time, -> (start_time, end_time) {
    if start_time && end_time
      joins(:event_dates).where("event_dates.start_time >= ? AND event_dates.end_time <= ?", start_time, end_time)
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

  def must_have_at_least_one_event_date
    if event_dates.empty? || event_dates.all? { |event_date| event_date.marked_for_destruction? }
      errors.add(:event_date, "Ao menos uma data com horário inicial e horário final deve ser informada")
    end
  end

end
