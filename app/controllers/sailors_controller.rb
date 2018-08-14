class SailorsController < ApplicationController

  get "/sailors" do
    if logged_in?
			@sailor = current_user
			erb :"/sailors/index.html"
		else
			redirect "/"
		end
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
		@sailor = Sailor.find_by(:username => params[:username])

    if @sailor && @sailor.authenticate(params[:password])
        session[:user_id] = @sailor.id
				redirect to "/sailors"
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
			redirect to "/sailors"
		end
  end

  post "/sailors/init" do
		if params[:choice] == "login"
			redirect "/sailors/login"
		else
			redirect "/sailors/new"
		end
  end

	post "/sailors/:id/menu" do
		@sailor = Sailor.find_by_id(params[:id])
		if logged_in? && @sailor && @sailor.id = current_user.id
			choice_ = params[:sailors_selection]
			case choice_
				when	"create_voyage"
					
					redirect "/voyages/new"
				when	"change_voyage"
					
					redirect "/voyages"
				when	"create_boat"
					
					redirect "/boats/new"
				when	"change_boat"
					
					redirect "/boats"
				else
					
					redirect "/"
			end
		else
			redirect "/"	
		end
	end

=begin
  get "/sailors/:id" do
		@sailor = Sailor.find_by_id(params[:id])
		
		if logged_in? && @sailor
			erb :"/sailors/show.html"
		elsif logged_in?
			redirect "/sailors"
		else
			redirect "/"
		end
  end
=end

=begin
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
=end

end
