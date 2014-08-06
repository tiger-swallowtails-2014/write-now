get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/' do
  @url = Url.create(params)
  redirect '/'
end

post '/:short_url' do
  @url = Url.find_by_short_url(params[:short_url])
  redirect to "#{@url.url}"
end
