class HomeController < ApplicationController
  def top
    @contractors = Contractor.all
    if current_user != nil
      redirect_to("/contractors")
    end
  end
end
