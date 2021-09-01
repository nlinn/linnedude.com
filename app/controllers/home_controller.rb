class HomeController < ApplicationController

  def index
    @labels = Label.is_public.sorted
    @featured_labels = Label.is_public.with_description
  end

end
