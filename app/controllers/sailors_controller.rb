class SailorsController < ApplicationController

  get "/sailors" do
    erb :"/sailors/index.html"
  end
	
	get '/sailors/login' do
		if logged_in?
			session.clear
		end
			
		erb :'/sailors/login.html'
	end
  
  get '/sailors/logout' do
		session.clear
		redirect "/"	
	end

  get "/sailors/new" do
		if logged_in?
			session.clear
		end
		
		erb :"/sailors/new.html"
  end

	post '/sailors/login' do
		sailor = Sailor.find_by(:username => params[:username])

    if sailor && sailor.authenticate(params[:password])
        session[:user_id] = sailor.id
        redirect "/sailors"
    else
				@message = "Log In Failed - Please Try Again"
        erb :'/sailors/login.html'
    end
	end
 
  post "/sailors" do
		if params[:username].empty? || params[:email].empty? || params[:password].empty?
			redirect to '/sailors/new'
		elsif Sailor.find_by(username: params[:username])
			@message = "Please choose a different username."
			erb :"/sailors/new.html"
		else
			@sailor = Sailor.new(params)
			@sailor.skipper = true
			@sailor.save
			session[:user_id] = @sailor.id
			redirect to '/sailors'
		end
  end

  post "/sailors/init" do
		if params[:choice] == "login"
			redirect "/sailors/login"
		else
			redirect "/sailors/new"
		end
  end


  # GET: /sailors/5
  get "/sailors/:id" do
    erb :"/sailors/show.html"
  end

  # GET: /sailors/5/edit
  get "/sailors/:id/edit" do
    erb :"/sailors/edit.html"
  end

  # PATCH: /sailors/5
  patch "/sailors/:id" do
    redirect "/sailors/:id"
  end

  # DELETE: /sailors/5/delete
  delete "/sailors/:id/delete" do
    redirect "/sailors"
  end
end
