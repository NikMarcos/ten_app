class ActiveAdminAdapter < ActiveAdmin::AuthorizationAdapter

  def authorized?(action, subject = nil)
    if user.admin != true
      return false
    end
    true
  end

end
