require 'yelp'

class PlacesController < ApplicationController

  # skip_before_filter :authorize

  # def index
  #   name = params[:name]
  #   # parameters = { term: params[:term], limit: 1, sort: 0 }
  #   query = 'Santa Monica'

  #   parameters = {term: 'food ' + name } 
  #   response = Yelp.client.search(query, parameters)
  #   @business_id = response.businesses
  #   # business_id = response.businesses[0].id
  #   # @result = Yelp.client.business(business_id)

  #   render json: @business_id.to_json 
    # render json: @result

    # render json: Yelp.client.search(query, parameters)
  # end

  #   def index
  #   query = params[:query]
  #   # query = 'Los Angeles'
  #   parameters = { term: 'food', limit: 1, sort: 0 }
  #   response = Yelp.client.search(query, parameters)
  #   business = response.businesses[0].id
  #   @result = Yelp.client.business(business)
  #   # render json: @result

  #   # render json: Yelp.client.search(query, parameters)

  # end

  def index
  # set a variable equal to an instance of my query object  
    
      query = 'Santa Monica'
      parameters = { term: 'food', limit: 10, sort: 0 }
      response = Yelp.client.search(query, parameters)
      @results = response.businesses
    
    # business_id = response.businesses[0].id
    # @results = Yelp.client.business(business_id)

  end

   def query
     query = params[:query]
     term = params[:term]
     raise query.inspect
     parameters = { term: term, limit: 10, sort: 0 }
     response = Yelp.client.search(query, parameters)
     @results = response.businesses

     
   end
     
# +
# +    # render json: @result.to_json 
#      # render json: @result
 
#      # render json: Yelp.client.search(query, parameters)
#    end

  


  
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

  # def query
    # name = params[:name]
    # parameters = { term: params[:term], limit: 1, sort: 0 }
    # query = 'Santa Monica'
    # parameters = {term: 'food ' + name } 
    # response = Yelp.client.search(query, parameters)
    # @business_id = response.businesses
    # business_id = response.businesses[0].id
    # @result = Yelp.client.business(business_id)

    # render json: @business_id.to_json 
    # render json: @result

    # render json: Yelp.client.search(query, parameters)
  # end

  # def search
  #   result = Yelp.client.business('nekter-juice-bar-santa-monica')
  #   render json: result, status:200
  # end

# end 