require 'yelp'

class RestaurantsController < ApplicationController

  def index
    @restaurants =  Restaurant.all

  end


  # def search
  #   # parameters = { term: params[:term], limit: 16 }
  #   params = { term: 'food',
  #          limit: 3
  #        }

  #   # render json: Yelp.client.search('Santa Monica', parameters)
  #   @search = Yelp.client.search('Santa Monica', params)
  #   # raise @search
  #   # render json: Yelp.client.inspect

  # end

# end

  def search
    query = params[:query]
    parameters = { term: params[:term], limit: 1, sort: 0 }
    response = Yelp.client.search(query, parameters)
    business = response.businesses[0].id
    @result = Yelp.client.business(business)
    # render json: @result

    # render json: Yelp.client.search(query, parameters)
  end
end