class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

# Kids 
  
  get '/kids' do 
    kids = Kid.all.order(:parent_id)
    kids.to_json(include: {parent: {only: [:family_name, :phone, :service_time]}})

    
    # 

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
      # parent: (
      #   name: "Default",
      #   phone: "Default",
      #   service_time: "Default"
      # )
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

  private
  def parent_params
      params.require(:parent).permit(:family_name, :phone, :service_time, kids_attributes: [:name, :dietary_restrictions])
  end


end
