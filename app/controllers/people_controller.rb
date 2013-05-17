class PeopleController < ApplicationController
  # GET /people/exist?person=
  def available
    person = Person.find_by_name params[:person]
    if person.nil?
      render text: 0
    elsif person.user.nil?
      render text: person.id
    else
      render text: (- person.id)
    end
  end
end
