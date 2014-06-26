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
    respond_to do |format|
      if @frog.save(frog_params)
        format.html { redirect_to @frog, notice: 'Frog was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @frog.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @frog.update(frog_params)
        format.html { redirect_to @frog, notice: 'Frog was successfully updated.' }
        format.json { render :show, status: :ok, location: @frog }
      else
        format.html { render :edit }
        format.json { render json: @frog.errors, status: :unprocessable_entity }
      end
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

  def frog_params
    params.require(:frog).permit(:name, :color, :pond_id)
  end
end
