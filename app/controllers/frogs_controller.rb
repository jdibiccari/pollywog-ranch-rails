class FrogsController < ApplicationController
 before_action :set_frog, only: [:show, :edit, :update, :destroy]
 before_action :set_ponds, only: [:edit, :create, :update, :new]
  def index
    @frogs = Frog.all
  end

  def new
    @frog = Frog.new
  end

  def edit
  end

  def show
  end

  def create
    @frog = Frog.new(frog_params)
    if @frog.save
      redirect_to frogs_path
    else
      render "new"
    end
  end

  def update
    if @frog.update(frog_params)
      redirect_to @frog
    else
      render "edit"
    end
  end

  def destroy
    @frog.destroy
    redirect_to frogs_path
  end

  private
  def set_frog
    @frog = Frog.find(params[:id])
  end

  def set_ponds
    @ponds = Pond.all
  end

  def frog_params
    params.require(:frog).permit(:name, :color, :pond_id)
  end
end
