ActiveAdmin.register Product do
  permit_params :name, :description, :price, :status_id, photos:[]

  form do |f|
      f.inputs do
        f.input :name
        f.input :description
        f.file_field :photos, multiple: true
        f.input :price
      #  f.input :status_id, :as => :select, :collection => Status.all.map{|u| ["#{u.name}", u.id]}
      end
     f.actions
  end
end
