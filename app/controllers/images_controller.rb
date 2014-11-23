class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.generate_slug!

    if @image.save
      redirect_to images_path
    else
      render :new
    end
  end

  def show
    @image = Image.find_by!(slug: params[:slug])

    respond_to do |format|
      format.html { render }
      format.png { redirect_to @image.resource.url }
    end
  end

  private

  def image_params
    params.require(:image).permit(:title, :resource)
  end
end
