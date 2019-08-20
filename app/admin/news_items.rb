ActiveAdmin.register NewsItem do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
permit_params :title, :cover, :body, images_attributes: %i[id file _destroy]


form :html => { :enctype => "multipart/form-data" } do |f|
 f.inputs do
   f.input :title
   f.input :cover
   f.input :body
 end
 f.has_many :images, allow_destroy: true do |i|
  i.input :file
end
 f.actions
end

index do
  column :title
  column :body
  column :created_at
  actions
end


show do
  attributes_table do
    row :title
    row :body
    row :cover do |ad|
        image_tag ad.cover.url(:thumb)
    end
    row "Images" do |m|
      m.images.each do |img|
        div do
          image_tag(img.file.url(:thumb))
        end
      end
    end
  end
end

end
