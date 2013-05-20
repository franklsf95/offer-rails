class SchoolsController < ApplicationController
  def index
    @schools = School.all
    respond_to do |format|
      format.html
      format.json { render json: School.all_brief }
      format.csv { render csv: @schools }
    end
  end
end
