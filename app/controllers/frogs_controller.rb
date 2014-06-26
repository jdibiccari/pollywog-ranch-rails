class FrogsController < ApplicationController
 before_action :set_frog, only: [:show, :edit, :update, :destroy]
  def index
    @frogs = Frog.all
  end

  def new
    @ponds = Pond.all
    @frog = Frog.new
  end

  def edit
    @ponds = Pond.all
  end

  def show
  end

  def create
    @frog = Frog.new(frog_params)
    if @frog.save
      redirect_to frogs_path
    else
      redirect_to new_frog_path
    end
  end

  def update
    @frog.update(frog_params)
    redirect_to @frog
  end

  def destroy
    @frog.destroy
    redirect_to frogs_path
  end

  private
  def set_frog
    @frog = Frog.find(params[:id])
  end

  def frog_params
    params.require(:frog).permit(:name, :color, :pond_id)
  end
end
