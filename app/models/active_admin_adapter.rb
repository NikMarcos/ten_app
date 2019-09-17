class ActiveAdminAdapter < ActiveAdmin::AuthorizationAdapter

  def authorized?(action, subject = nil)
    if user.admin != true
      return true
    end
    true
  end

end
