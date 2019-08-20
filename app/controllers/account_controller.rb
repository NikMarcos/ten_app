class AccountController < InheritedResources::Base

def index
  @users = User.all
end

def show
  @user = User.find(params[:id])
  @images = @user.images
  @my_test_var = 'Iam'
end

private

def account_params
  params.require(:pages).permit(:id)
end

end
