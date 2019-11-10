class SessionsController < ApplicationController

  get '/login' do
    erb :"sessions/login"
  end

  get '/signup' do
    erb :'/sessions/signup'
  end
  
  post '/signup' do
    @user = User.new(name: params["name"], email: params["email"], password: params["password"])
    @user.save
    session[:user_id] = @user.id

    redirect "/crochet-patterns"
  end

  post '/login' do
    user = User.find_by(name: params[:name])

    if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect "/crochet-patterns"
    else
        redirect "/login"
    end
  end

  delete '/logout' do
    if logged_in?
      session.destroy
    end
    redirect "/login"
  end
end