class ImagesController < InheritedResources::Base
before_action :authenticate_user!, except: [:index]
before_action :load_imageable, only: [:create]

  def create

      # @image = Image.new(image_params)
      @image = @imageable.images.build(image_params)
      if @image.save
        redirect_to request.referrer, notice: 'The image successfully saved.'
      else
        redirect_to request.referrer, notice: 'The image did not save.'
      end
  end

  private

    def image_params
      params.require(:image).permit(:file)
    end

    def load_imageable
    resource, id = request.path.split('/')[1,2]
    if resource == "account"
      @imageable = User.find(id)
    else
      @imageable = resource.singularize.classify.constantize.find(id)
    end

  end

end
