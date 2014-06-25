class FrogsController < ApplicationController
  before_action :set_frog, only: [:show, :edit, :update, :destroy]
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

  private
  def set_frog
    @frog = Frog.find(params[:id])
  end
end
