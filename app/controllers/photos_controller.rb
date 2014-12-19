class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end
  def new
    @photo =Photo.new
  end
  def create
    # Find our parent decision that we should attach to
    place_id = Place.where(yelp_id: params[:photo][:yelp_id]).first.id
    @photo = current_user.photos.new(photo_params)
    @photo.place_id = place_id
    # @photo.date ||= DateTime.now
    # Attach this criterion to a decision
    if @photo.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def show
    @photo = Photo.find(params[:id])

  end

  def edit
    @place = Place.find(params[:id])
  end 

  def update
    @place = Place.find(params[:id])
    if @place.update_attributes(params.require(:place).permit(:query, :photo_id))
      redirect_to places_path
    else
      render 'edit'
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to root_path
  end

  def photo_params
    params.require(:photo).permit(:image)
  end
end

#  private
#   def question_params
#     params.require(:question).permit(:the_question, :user_id, :videos => [:id])
#   end
# end