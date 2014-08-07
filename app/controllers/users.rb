get '/signup' do

end

post '/signup' do
  user = User.create(params)
end

get '/login' do

end

# post '/login' page do

# end

# use post of url shorterner to associate with user_id if user logged in


