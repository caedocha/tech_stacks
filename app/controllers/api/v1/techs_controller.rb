class Api::V1::TechsController < ApplicationController
  def index
    techs = Tech.all
    render json: techs
  end

  def show
    if tech
      render json: tech
    else
      render json: tech.errors
    end
  end

  def create
    tech = Project.create!(tech_params)
    if tech
      render json: tech
    else
      render json: tech.errors
    end
  end

  def update
    if tech
      tech.update_attributes(tech_params)
      render json: tech
    else
      render json: tech.errors
    end
    end
  end

  def destroy
    tech&.destroy
    render json: { message: 'Tech deleted'}
  end

  private

  def tech_params
    params.permit(:name, :description, :logo)
  end

  def tech
    @tech ||= Tech.find(params[:id])
  end

end
