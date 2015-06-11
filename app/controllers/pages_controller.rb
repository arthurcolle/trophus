class PagesController < ApplicationController
  def home
  end

  def about
  end

  def contact
  end

  def primary
  end

  def map
    @map_route = true
  end

  # def temp_location
  #   puts "testing location"
  #   @location = params["location"]
  #   $location = @location
  #   @ip = params["ip"]
  #   $ip = @ip
  #   render 'pages/map2'
  # end

  def map2
  end

  def how_it_works
    @show_logo = true
  end
  
end
