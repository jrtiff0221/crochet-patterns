class SessionsController < ApplicationController

  get '/login' do
    erb :"sessions/login"
  end

  post '/login' do
    user = User.find_by(name: params[:name])
    puts 'params'
    puts params
    # puts '\n\n\n\nuser.authenticate(params[:password])'
    # puts user.authenticate(params[:password])
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect "/crochet-patterns"
    else
        redirect "/login"
    end
  end
end