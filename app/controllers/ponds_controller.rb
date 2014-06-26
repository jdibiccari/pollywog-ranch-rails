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
    respond_to do |format|
      if @pond.save(pond_params)
        format.html { redirect_to @pond, notice: 'Pond was successfully created.' }
        format.json { render :show, status: :ok, location: @pond }
      else
        format.html { render :edit }
        format.json { render json: @pond.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @pond.update(pond_params)
        format.html { redirect_to @pond, notice: 'Pond was successfully updated.' }
        format.json { render :show, status: :ok, location: @pond }
      else
        format.html { render :edit }
        format.json { render json: @pond.errors, status: :unprocessable_entity }
      end
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
