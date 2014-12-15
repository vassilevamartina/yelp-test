require 'yelp'

class RestaurantsController < ApplicationController

  # skip_before_filter :authorize

  def index
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
    name = params[:name]
    # parameters = { term: params[:term], limit: 1, sort: 0 }
    query = 'Santa Monica'
    parameters = {term: 'food ' + name } 
    response = Yelp.client.search(query, parameters)
    @business_id = response.businesses
    # business_id = response.businesses[0].id
    # @result = Yelp.client.business(business_id)

    render json: @business_id.to_json 
    # render json: @result

    # render json: Yelp.client.search(query, parameters)
  end

  # def search
  #   result = Yelp.client.business('nekter-juice-bar-santa-monica')
  #   render json: result, status:200
  # end

end 