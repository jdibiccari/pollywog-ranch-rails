class TadpolesController < ApplicationController
  before_action :set_tadpole, only: [:show, :edit, :update, :destroy, :evolve]
  def index
    @tadpoles = Tadpole.all
  end

  def new
    @frog = Frog.find(params[:frog_id])
    @tadpole = Tadpole.new
  end

  def edit
    @frog = @tadpole.frog
  end

  def create
    @tadpole = Tadpole.new(tadpole_params)
    @frog = @tadpole.frog
    if @tadpole.save
      redirect_to tadpoles_path
    else
      redirect_to new_frog_tadpole_path(@frog)
    end
  end

  def update
    @tadpole.update(tadpole_params)
  end

  def evolve
    frog = Frog.new(pond: @tadpole.frog.pond, color: @tadpole.color, name: @tadpole.name)
    frog.save
    @tadpole.destroy
    redirect_to tadpoles_path
  end

   def destroy
    @tadpole.destroy
    redirect_to tadpoles_path
  end

  private
  def set_tadpole
    @tadpole = Tadpole.find(params[:id])
  end

  def tadpole_params
    params.require(:tadpole).permit(:name, :color, :frog_id)
  end
end
