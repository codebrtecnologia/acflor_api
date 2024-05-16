class PeopleController < ApplicationController
  before_action :set_person, only: %i[ show update destroy ]

  def index
    load_people

    @people_before_paginate = @people.size
    @people = @people.then(&paginate)
    @page_no = page_no
    render(template: "people/index", formats: :json)
  end

  def show
    @people = Person.find(params[:id])
    render(template: "people/show", formats: :json)
  end

  def create
    begin
      @person = Person.new(person_params)

      if @person.save!
        render json: { status: "success", data: @person }, status: 201
      end
    end
  end

  def update
    begin
      if @person.update!(person_params)
        render json: { status: "success", data: @person }
      end
    end
  end
  def destroy
    person = Person.find_by(id: params[:id])

    if person
      begin
        if person.destroy!
          render json: { message: I18n.t("person.successful_destroyed") }, status: 204
        end
      end
    end
  end

  private
    FILTER_PARAMS = [:name, :position, :email, :public_body_id, :category_id, :active]

    def load_people
      @people = Person.filter(params.slice(*FILTER_PARAMS)).order("LOWER(name)")
    end

    def set_person
      begin
        @person = Person.find(params[:id])
      rescue => e
        handle_exception(e, I18n.t("activerecord.models.person"), params[:id])
      end
    end

    def person_params
      params.require(:person)
            .permit(
              :name,
              :position,
              :telephone,
              :cellphone_number,
              :email,
              :alternative_email,
              :category_id,
              :public_body_id,
              :active
            )
    end
end
