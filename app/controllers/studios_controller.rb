# app/controllers/studio_controller.rb

class StudiosController < ApplicationController

  def create
    Studio.create(studio_params)
    redirect_to '/studios'
  end

  def destroy
    studio = Studio.find(params[:id])
    studio.destroy
    redirect_to '/studios'
  end

  def edit
    @studio = Studio.find(params[:id])
  end

  def index
    @studios = Studio.all
  end

  def new
  end

  def show
  @studio = Studio.find(params[:id])
  end

  def update
    studio = Studio.find(params[:id])
    studio.update(studio)
    studio.save

    redirect_to action: 'show', id: params[:id]
  end

  private

  def studio_params
    params.permit()#add params here in :name, :age format)
  end
end