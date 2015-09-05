class HomeController < ApplicationController
  def index
    @listing = Listing.open.limit(6)
  end
end
