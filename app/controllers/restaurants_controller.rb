require 'yelp'

class RestaurantsController < ApplicationController

  # skip_before_filter :authorize

  def index
    @restaurants =  Restaurant.all
    render json: {restaurants:'shit', status: 200}
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

  def query
    query = params[:query]
    parameters = { term: params[:term], limit: 1, sort: 0 }
    response = Yelp.client.search(query, parameters)
    business = response.businesses[0].id
    @result = Yelp.client.business(business)

    # render json: @result.to_json 
    # render json: @result

    # render json: Yelp.client.search(query, parameters)
  end

  def search
    
  end
end