require 'sinatra'
require_relative 'config/application'

set :bind, '0.0.0.0'  # bind to all interfaces

helpers do
  def current_user
    if @current_user.nil? && session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      session[:user_id] = nil unless @current_user
    end
    @current_user
  end
end

get '/' do
  redirect '/meetups'
end

get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/meetups' do
  @meetups = Meetup.order(:name)
  erb :'meetups/index'
end

get '/meetups/new' do
  erb :'meetups/new'
end

post '/meetups/new' do
  @current_user = User.find_by(id: session[:user_id])
  @meetup_name = params[:meetup_name]
  @meetup_location = params[:meetup_location]
  @meetup_description = params[:meetup_description]
  @meetup_creator = @current_user.id

  @new_meetup = Meetup.new
  @new_meetup.name = @meetup_name
  @new_meetup.location = @meetup_location
  @new_meetup.description = @meetup_description
  @new_meetup.user_id = @meetup_creator
  @new_meetup.save

  redirect '/meetups/'
end

get '/meetups/:id' do
  @meetup_id = params[:id]
  @meetup = Meetup.find(@meetup_id)
  erb :'meetups/show'
end
