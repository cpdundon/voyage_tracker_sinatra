class BoatsController < ApplicationController

  # GET: /boats
  get "/boats" do
    erb :"/boats/index.html"
  end

  # GET: /boats/new
  get "/boats/new" do
    erb :"/boats/new.html"
  end

  # POST: /boats
  post "/boats" do
    redirect "/boats"
  end

  # GET: /boats/5
  get "/boats/:id" do
    erb :"/boats/show.html"
  end

  # GET: /boats/5/edit
  get "/boats/:id/edit" do
    erb :"/boats/edit.html"
  end

  # PATCH: /boats/5
  patch "/boats/:id" do
    redirect "/boats/:id"
  end

  # DELETE: /boats/5/delete
  delete "/boats/:id/delete" do
    redirect "/boats"
  end
end
