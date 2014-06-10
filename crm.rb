require 'sinatra'

get '/' do
	@crm_app_name = "My CRM"
	@time = Time.now
	erb :index
end

get '/contacts' do
	erb :contacts
end

get '/contacts/new' do
	erb :add_contact
end

get '/contacts/:id' do
	erb :specific_contact
end

get '/contacts/:id/edit' do
	erb :edit_specific_contact
end 


