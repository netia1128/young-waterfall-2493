# app/controllers/actor_controller.rb

class ActorsController < ApplicationController

  def create
    Actor.create(actor_params)
    redirect_to '/actors'
  end

  def destroy
    actor = Actor.find(params[:id])
    actor.destroy
    redirect_to '/actors'
  end

  def edit
    @actor = Actor.find(params[:id])
  end

  def index
    @actors = Actor.all
  end

  def new
  end

  def show
  @actor = Actor.find(params[:id])
  end

  def update
    actor = Actor.find(params[:id])
    actor.update(actor)
    actor.save

    redirect_to action: 'show', id: params[:id]
  end

  private

  def actor_params
    params.permit()#add params here in :name, :age format)
  end
end