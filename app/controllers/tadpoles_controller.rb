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
    respond_to do |format|
      if @tadpole.save(tadpole_params)
        format.html { redirect_to @tadpole, notice: 'Tadpole was successfully created.' }
        format.json { render :show, status: :ok, location: @tadpole }
      else
        format.html { render :edit }
        format.json { render json: @tadpole.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @tadpole.update(tadpole_params)
        format.html { redirect_to @tadpole, notice: 'Tadpole was successfully updated.' }
        format.json { render :show, status: :ok, location: @tadpole }
      else
        format.html { render :edit }
        format.json { render json: @tadpole.errors, status: :unprocessable_entity }
      end
    end
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
