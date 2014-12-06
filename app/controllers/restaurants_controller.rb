require 'yelp'

class RestaurantsController < ApplicationController

  def index
    @restaurants =  Restaurant.all

  end


  def search
    # parameters = { term: params[:term], limit: 16 }
    params = { term: 'food',
           limit: 3
         }

    # render json: Yelp.client.search('Santa Monica', parameters)
    @search = Yelp.client.search('Santa Monica', params)
    # raise @search
    # render json: Yelp.client.inspect

    

  end

end
