class BoatsController < ApplicationController

  get "/boats" do
		@user = current_user
		@boats = Boat.all
    erb :"/boats/index.html"
  end

  get "/boats/new" do
    erb :"/boats/new.html"
  end

  post "/boats" do
    boat_num_ = params[:number].to_i
		year_ = params[:year].to_i

		if !logged_in?
			redirect "/"
		elsif boat_num_ < 1 || year_ < 1900
			@message = "The boat number must be a number greater than 0.  The year must be greater than 1899."
			erb :'/boats/new.html'
		elsif Boat.find_by(number: boat_num_)
			@message = "The boat number must be unique."
			erb :'/boats/new.html'	
		else
			Boat.create(params)
			redirect "/boats"
		end
  end

  # GET: /boats/5
  get "/boats/:id" do
    erb :"/boats/show.html"
  end

  get "/boats/:id/edit" do
		@boat = Boat.find_by_id(params[:id])

		if !logged_in?
			redirect "/"
		elsif @boat
			erb :"/boats/edit.html"
		else
			redirect "/boats"
		end
  end

  patch "/boats/:id" do
		@boat = Boat.find_by_id(params[:id])
		par_ = params[:boat]
		boat_num_ = par_[:number].to_i
		year_ = par_[:year].to_i

		if !logged_in? || !@boat
			session.clear
			redirect "/"
		elsif boat_num_ < 1 || year_ < 1900
			@message = "The boat number must be a number greater than 0.  The year must be greater than 1899."
			erb :"/boats/edit.html"
		elsif Boat.find_by(number: boat_num_) && Boat.find_by(number: boat_num_) != @boat
			@message = "The boat number must be unique."
			erb :"/boats/edit.html"	
		else
			par_[:in_service] = false if !par_[:in_service]
			@boat.update(par_)	
			redirect "/boats"
		end
  end

  # DELETE: /boats/5/delete
  delete "/boats/:id/delete" do
    redirect "/boats"
  end
end
