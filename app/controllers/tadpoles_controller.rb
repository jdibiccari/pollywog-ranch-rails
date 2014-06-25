class TadpolesController < ApplicationController
  def index
    @tadpoles = Tadpole.all

    respond_to do |format|
      format.html
      format.json { render json: @tadpoles }
    end
  end
end
