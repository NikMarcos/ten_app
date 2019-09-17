class ArticleController < InheritedResources::Base
before_action :authenticate_user!, except: [:index]

def index
  @articles = Article.all
  print @articles 
  @user = User.find(current_user.id)
end

def show
  @article = Article.find(params[:id])
end

private

  def news_item_params
    params.require(:news_item).permit(:id, :title, :body, :theme)
  end

end
