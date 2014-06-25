class PondsController < ApplicationController
  def index
    @ponds = Pond.all

    respond_to do |format|
      format.html
      format.json { render json: @ponds }
    end
  end
end
