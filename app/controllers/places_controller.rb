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

  # def index
  # # set a variable equal to an instance of my query object  
  #     @places = Place.all

  # end

  def index
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
     # raise query.inspect
     parameters = { term: term, limit: 10, sort: 0 }
     response = Yelp.client.search(query, parameters)
     yelp_ids = Place.find_by_sql("select yelp_id from places").map(&:yelp_id)
     puts response.businesses.inspect
     response.businesses.each do |r|
      Place.create(
        name: r.name,          
        display_phone: r.display_phone,  
        rating: r.rating,        
        display_address:  r.location.display_address.join("||"),     
        yelp_url: r.url,          
        yelp_id:  r.id   
        ) if !yelp_ids.include? r.id 

      end

     @results = response.businesses

   end

  def new

    @place = Place.new

  end

  def create

     query = params[:query]
     term = params[:term]
     # raise query.inspect
     parameters = { term: term, limit: 10, sort: 0 }
     response = Yelp.client.search(query, parameters)
     @results = response.businesses
    @place = Place.new(place_params)
    if @place.save
      redirect_to root_path
    else
      render "new"

    end
  end


  private 

  def place_params
    params.require(:place).permit(:query, :photo_id)
  end

 end

  # def create
  #   @places = Place.new(place_params)
  #   if @place.save
  #     redirect_to places_path
  #   else
  #     render "new"
  #   end
  # end
     
# +
# +    # render json: @result.to_json 
#      # render json: @result
 
#      # render json: Yelp.client.search(query, parameters)
#    end

 


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