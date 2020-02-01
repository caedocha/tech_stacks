class Api::V1::StackTechsController < ApplicationController
  def link
    if stack && tech
      stack.techs << tech
      render.json { message: 'stack and tech linked!'}
    else
      render.json {message: 'Link unsuccessful' }
    end
  end

  def unlink
    if stack && tech
      stack.techs.delete(tech)
      stack.save
      render.json { message: 'stack and tech unlinked!'}
    else
      render.json {message: 'Link unsuccessful' }
    end
  end

  private

  def stack
    @stack ||= Stack.find(params[:stack_id])
  end

  def tech
    @tech ||= Tech.find(params[:tech_id])
  end

end
