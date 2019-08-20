class NewsController < InheritedResources::Base
before_action :authenticate_user!

def index
  @news = NewsItem.all
end

  private

    def news_item_params
      params.require(:news_item).permit(:title, :cover, :news_category, :body)
    end

end
