require 'hermes_tan'
require 'sinatra'
require 'sinatra/flash'

enable :sessions

get '/' do
  erb :index
end

get '/failure/' do
  erb :error
end

post '/send_message/' do
  gods = params[:recipients].split(',')

  begin
    hermes = HermesTan.new(params[:email], params[:password])
    hermes.let_gods_know_about(gods, params[:subject], params[:body])
  rescue InvalidEmailError, Net::SMTPAuthenticationError, ArgumentError => e
    flash[:error] = "An error occurred: #{e.message}"
  end

  redirect '/'
end

