class Api::V1::TechsController < ApplicationController
  def index
    techs = Tech.all
    render json: techs
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end
end
