ActiveAdmin.register User do

permit_params :name, :email, :admin

filter :name
filter :email
filter :created_at


scope :all
scope :admin do |users|
  users.where('admin = ?', true)
end

index do
  column :name
  column :email
  column :created_at
  column :admin
  actions
end

show do
  attributes_table do
    row :name
    row :email
    row "Images" do |m|
      m.images.each do |img|
        div do
          image_tag(img.file.url(:thumb))
        end
      end
    end
  end
end

action_item :newAdmin, only: :show do
  link_to 'Change to Admin', newAdmin_admin_user_path(user), method: :put if user.admin == "false"
end

member_action :newAdmin, method: :put do
    user = User.find(params[:id])
    user.update(admin: 'true')
    redirect_to admin_user_path(user)
  end

  action_item :newUser, only: :show do
    link_to 'Change to User', newUser_admin_user_path(user), method: :put if user.admin == "true"
  end

  member_action :newUser, method: :put do
      user = User.find(params[:id])
      user.update(admin: 'false')
      redirect_to admin_user_path(user)
  end

end
