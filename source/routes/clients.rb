namespace "/clients" do
  get do
    @clients = Client.all
    erb :clients
  end

  namespace "/new" do
    get do
      @client = Client.new
      erb :client_form
    end

    post do
      client = Client.create params[:client]
      redirect "/clients/#{client.id}"
    end
  end

  namespace "/edit/:id" do
    get do
      @client = Client.find params[:id]
      erb :client_form
    end

    post do
      Client.update params[:id], params[:client]
      redirect "/clients/#{params[:id]}"
    end
  end

  get "/:id" do
    client = Client.find params[:id]
    @header = client.name
    @facts = client.facts
    erb :detail
  end

  get "/delete/:id" do
    Client.destroy params[:id]
    redirect "/clients"
  end
end