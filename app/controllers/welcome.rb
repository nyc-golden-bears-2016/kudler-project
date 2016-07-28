get '/welcome/:id' do

  @user = User.find(params[:id])

if @user.lifestyle_type = "Brad"
 @food = ["salmon", "bread", "pasta", "meat", "pig"].sample
 @actor = ["Angelina+Jolie", "Brad+Pitt", "Sam+Blackman"].sample
elsif @user.lifestyle_type = "Gwenyth"
  @food = ["expensive wall paper", "bagels", "onions", "sushi"].sample
 @actor = ["Gwyneth+Paltrow", "Donnie+Wahlberg", "Mark+Wahlberg"].sample
else
  @food = ["quesadilla", "graham cracker", "ruby", "joe"]
  @actor = ["Gwyneth+Paltrow", "Donnie+Wahlberg", "Mark+Wahlberg"].sample
end

response = Unirest.get "https://nutritionix-api.p.mashape.com/v1_1/search/#{@food}?fields=item_name%2Citem_id%2Cbrand_name%2Cnf_calories%2Cnf_total_fat",
  headers:{
    "X-Mashape-Key" => "7JiDoksr4LmshqUHhKR3hUTM3Ukmp1jK7M2jsnno1926BKrPYI",
    "Accept" => "application/json"
  }

  @info = response.body

  if @user.lifestyle_type = "Pan"
    @exercise = "No need to work out..."
  else
    @exercise = "Ten Hours Of Yoga"
  end


response_1 = Unirest.get "https://community-netflix-roulette.p.mashape.com/api.php?actor=#{@actor}",
  headers:{
    "X-Mashape-Key" => "7JiDoksr4LmshqUHhKR3hUTM3Ukmp1jK7M2jsnno1926BKrPYI",
    "Accept" => "application/json"
  }

  @entertainment = response_1.body
  @number = [0,1,2,3,4].sample


  erb :'welcome'

end

