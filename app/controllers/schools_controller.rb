class SchoolsController < ApplicationController
  def index
    @schools = School.list
    respond_to do |format|
      format.html
      format.json { render json: @schools }
    end
  end
end
