get '/welcome' do

food = "hummus"

response = Unirest.get "https://nutritionix-api.p.mashape.com/v1_1/search/#{food}?fields=item_name%2Citem_id%2Cbrand_name%2Cnf_calories%2Cnf_total_fat",
  headers:{
    "X-Mashape-Key" => "7JiDoksr4LmshqUHhKR3hUTM3Ukmp1jK7M2jsnno1926BKrPYI",
    "Accept" => "application/json"
  }

  response = response.body
  @info = response

  erb :'welcome'
end
