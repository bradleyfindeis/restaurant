class Ideas < Sinatra::Base
  get "/" do
    erb :home
  end

  get "/apps/new" do
    erb :new
  end

  get "/apps/:id/edit" do
    @app = App.find(params[:id])
    erb :edit
  end
  
  post "/apps2" do
    App2.create(title: params[:title], description: params[:description])
    redirect "/"
  end
  get "/apps2" do
    @apps2 = App2.all
    erb :apps2
  end

  delete "/apps/:id" do
    App.find(params[:id]).destroy
    redirect "/apps"
  end

  get "/apps/:id" do
   @app = App.find(params[:id])
   erb :app
  end

  put "/apps/:id" do
    app = App.find(params[:id])
    app.update(
      title: params[:title], 
      description: params[:description]
    )
    redirect "/apps"
  end

  get "/apps" do
    @apps = App.all
    erb :apps
  end

  post "/apps" do
    App.create(
      title: params[:title], 
      description: params[:description]
    )
    redirect "/apps"
  end

  delete "/apps/:id" do
  end
end
