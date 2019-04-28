class HomeController < ApplicationController
  skip_before_action :registration_user ,only:[:top]
  def top
    @contractors = Contractor.all
    if current_user
      redirect_to("/contractors")
    end
  end
end
