class ArticleController < InheritedResources::Base
before_action :authenticate_user!, except: [:index]

def index
  @articles = Article.all
  @user = User.find(current_user.id)
end

  private

    def news_item_params
      params.require(:news_item).permit(:title, :body)
    end

end
