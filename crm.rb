require 'sinatra'

get '/' do
	@crm_app_name = "My CRM"
	@time = Time.now
	erb :index
end

get '/contacts' do
	"This is where the contacts should be."
end