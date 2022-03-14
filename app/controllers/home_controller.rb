class HomeController < ApplicationController
  def index
    @page_index = 0
  end

  def howitworks
    @page_index = 3
  end

  def roadmap
    @page_index = 4
  end
end
