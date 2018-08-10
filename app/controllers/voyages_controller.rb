class VoyagesController < ApplicationController

  # GET: /voyages
  get "/voyages" do
    erb :"/voyages/index.html"
  end

  # GET: /voyages/new
  get "/voyages/new" do
    erb :"/voyages/new.html"
  end

  # POST: /voyages
  post "/voyages" do
    redirect "/voyages"
  end

  # GET: /voyages/5
  get "/voyages/:id" do
    erb :"/voyages/show.html"
  end

  # GET: /voyages/5/edit
  get "/voyages/:id/edit" do
    erb :"/voyages/edit.html"
  end

  # PATCH: /voyages/5
  patch "/voyages/:id" do
    redirect "/voyages/:id"
  end

  # DELETE: /voyages/5/delete
  delete "/voyages/:id/delete" do
    redirect "/voyages"
  end
end
