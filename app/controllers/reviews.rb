get '/reviews' do

  @reviews = Review.all

  erb :'reviews/index'
end


get '/reviews/new' do

  erb :'reviews/new'

end


post '/reviews' do

  params[:review][:reviewer_id] = session[:user_id]
  @review = Review.new(params[:review])

  if @review.save
    redirect '/reviews'
  else
    erb :'reviews/new'
  end

end
