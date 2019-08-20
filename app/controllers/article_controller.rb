class ArticleController < InheritedResources::Base
before_action :authenticate_user!, except: [:index]

def index
  @articles = Article.all
  @user = User.find(current_user.id)
end

def new
  @article = Article.new
end

def create
  @article = Article.new(article_params)
  respond_to do |format|
    if @article.save
      format.html { redirect_to set_images_path, notice: 'Article was successfully created.' }
      format.json { render :set_images, status: :created, location: @article }
    else
      format.html { render :new }
      format.json { render json: @article.errors, status: :unprocessable_entity }
    end
  end
end

def set_images
  @article1 = Article.find(1)
  gon.splited_article = @article1
  # @array_of_image_blocks = Array.new
end



  private

    def article_params
      params.require(:article).permit(:title, :body, :theme)
    end

end
