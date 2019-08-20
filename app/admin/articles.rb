ActiveAdmin.register Article do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :body, :theme, images_attributes: %i[id file _destroy]

form :html => { :enctype => "multipart/form-data" } do |f|
 f.inputs do
   f.input :title
   f.input :body
   f.input :theme
 end
 f.has_many :images, allow_destroy: true do |i|
  i.input :file
end
 f.actions
end

filter :title
filter :body
filter :theme
filter :created_at


show do
  attributes_table do
    row :title
    row :body
    row "Images" do |m|
      m.images.each do |img|
        div do
          image_tag(img.file.url(:thumb))
        end
      end
    end
  end
end


# scope :after_2019_04_29 do |article|
#  article.where('created_at > ?', '2019-04-29')
# end

scope :all do |article|
 article.all
end

end
