class SchoolsController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render json: School.all_brief }
      format.csv { render text: to_csv(School.all) }
    end
  end
end
