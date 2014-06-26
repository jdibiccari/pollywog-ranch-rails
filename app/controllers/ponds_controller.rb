class PondsController < ApplicationController
  before_action :set_pond, only: [:show, :edit, :update, :destroy]
  def index
    @ponds = Pond.all
  end

  def new
    @pond = Pond.new
  end

  def edit
  end

  def show
  end

  def create
    @pond = Pond.new(pond_params)
    if @pond.save
      redirect_to ponds_path
    else
      render "new"
    end
  end

  def update
    if @pond.update(pond_params)
      redirect_to @pond
    else
      render "edit"
    end
  end

  def destroy
    @pond.destroy
    redirect_to ponds_path
  end

  private
  def set_pond
    @pond = Pond.find(params[:id])
  end

  def pond_params
    params.require(:pond).permit(:name, :water_type)
  end

end
