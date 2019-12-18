class HomeController < ApplicationController

  def index
    @labels = Label.is_public.sorted
  end

end
