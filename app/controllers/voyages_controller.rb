class VoyagesController < ApplicationController

  get "/voyages" do
		if logged_in? 
			@sailor = current_user
			@voyages = Voyage.all
			erb :"/voyages/index.html"
		else
			redirect "/"
		end
  end

  get "/voyages/new" do
		if logged_in?
			@sailor = current_user
			@boats = Boat.all
			erb :"/voyages/new.html"
		else
			redirect "/"
		end
  end

  post "/voyages" do
	
    if !logged_in?
      redirect "/"
    else
      voy_ = Voyage.new(params)
			voy_.skipper = current_user
			voy_.save
      redirect "/voyages"
    end
  end

  get "/voyages/:id" do
		@voyage = Voyage.find_by_id(params[:id])
		if logged_in? && @voyage
			erb :"/voyages/show.html"
		else
			redirect "/"
		end
  end

  get "/voyages/:id/edit" do
		@voyage = Voyage.find_by_id(params[:id])
		@boats = Boat.all

		if logged_in? && @voyage && @boats && current_user == @voyage.skipper
			erb :"/voyages/edit.html"
		elsif !(logged_in? && current_user == @voyage.skipper)
			@message = "The logged in user must be the voyage skipper to modify a voyage."
			@voyages = Voyage.all
			erb :'/voyages/index.html'
		else
			redirect "/"
		end
  end

  patch "/voyages/:id" do
    par_ = params[:voyage]
		skipper_id_ = current_user.id if logged_in? #the logged in user must be the voyage skipper
		@voyage =  Voyage.find_by_id(params[:id]) 
		skipper = @voyage.skipper if @voyage

		if logged_in? && @voyage && skipper && skipper.id == skipper_id_
			@voyage.update(par_)
			redirect "/voyages/#{@voyage.id}"
		elsif skipper.id != skipper_id_
			@message = "The logged in user must be the voyage skipper." 
			erb :'/voyages/index.html'
		else
			redirect "/voyages"
		end
  end

  delete "/voyages/:id/delete" do
		skipper_id_ = current_user.id if logged_in? #the logged in user must be the voyage skipper
		@voyage =  Voyage.find_by_id(params[:id]) 
		skipper = @voyage.skipper if @voyage
		
		if logged_in? && @voyage && skipper && skipper.id == skipper_id_
			@voyage.delete
			redirect "/voyages"
		elsif skipper.id != skipper_id_
			@message = "The logged in user must be the voyage skipper." 
			erb :'/voyages/index.html'
		else
			redirect "/voyages"
		end
  end
end
