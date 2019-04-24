class HomeController < ApplicationController
  def top
    @contractors = Contractor.all
  end
  
end
