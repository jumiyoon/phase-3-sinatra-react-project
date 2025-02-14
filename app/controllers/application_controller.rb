class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # Parents
  
  get '/parents' do
    parents = Parent.all.order(:family_name)
    parents.to_json(include: {kids: {only: [:name, :id, :dietary_restrictions, :parent_id]}})
   end
 
   get '/parents/:id' do
     parent = Parent.find(params[:id])
     parent.to_json(include: {kids: {only: [:name, :id, :dietary_restrictions, :parent_id]}})
   end
 
   post '/parents' do
     parent = Parent.create(
       family_name: params[:family_name],
       phone: params[:phone],
       service_time: params[:service_time]
     )
 
     parent.to_json(include: {kids: {only: [:name, :id, :dietary_restrictions, :parent_id]}})
   end
 
   patch '/parents/:id' do
     parent = Parent.find(params[:id])
     parent.update(
       service_time: params[:service_time]
     )
     parent.to_json(include: {kids: {only: [:name, :id, :dietary_restrictions, :parent_id]}})
 
   end
 
   delete '/parents/:id' do
     parent = Parent.find(params[:id])
     parent.destroy
     parent.to_json
   end
  

  # Kids 
  
  get '/kids' do 
    kids = Kid.all.order(:parent_id)
    kids.to_json(include: {parent: {only: [:family_name, :phone, :service_time]}})
  end

  get '/kids/:id' do
    kid = Kid.find(params[:id])
    kid.to_json(include: {parent: {only: [:family_name, :phone, :service_time]}})
  end

  post '/kids' do
    kid = Kid.create(
      name: params[:name],
      parent_id: params[:parent_id],
      dietary_restrictions: params[:dietary_restrictions]
    )
    kid.to_json
  end

  patch '/kids/:id' do
    kid = Kid.find(params[:id])
    kid.update(
      dietary_restrictions: params[:dietary_restrictions]
    )
    kid.to_json
  end

  delete '/kids/:id' do
    kid = Kid.find(params[:id])
    kid.destroy
    kid.to_json
  end

end
