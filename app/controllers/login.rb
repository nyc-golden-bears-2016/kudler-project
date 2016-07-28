get '/register' do

  erb :'users/register'

end

post '/register' do


  user = User.new(params[:user])

  if user.save
    if user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      @user = user
      erb :'sign_up'
    end
  else
    @errors = user.errors.full_messages
    erb :'users/register'
  end

end


put '/sign_up/:id' do

  user = User.find(params[:id])

  if params[:user][:lifestyle_type] == "parents"
    user.lifestyle_type = "Brad"
  elsif params[:user][:lifestyle_type] == "sublime"
    user.lifestyle_type = "Gwenyth"
  else
    user.lifestyle_type = "Pan"
    redirect "/welcome/#{user.id}"
  end


end

get '/login' do


  erb :'users/login'

end


post '/login' do


 user = User.find_by(username: params[:user][:username])

  if user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = user.error.full_messsages
    redirect '/login'
  end

end

get "/logout" do
  session.clear
  redirect "/"
end

get '/users/:id/entries' do

  @reviews = User.find(params[:id]).reviews

  if @reviews
    erb :'reviews/users'
  else
    @errors = ["No User Like That, Chief"]
    redirect "/"
  end

end
