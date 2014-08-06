get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/' do
  @user_input = Url.create(params)
  redirect '/'
end

get '/:short_url' do
  @url = Url.find_by_short_url(params[:short_url])
  @url.counter_increment
  # @url.update(:click_count => 5)
    @url.save

  redirect to "#{@url.url}"
end

# get '/:short_url' do
#   @url = Url.find_by_short_url(params[:short_url])
# end

post '/:short_url/count' do

end
