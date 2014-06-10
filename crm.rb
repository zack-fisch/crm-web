require 'sinatra'
require_relative 'contact'
require_relative 'rolodex'

@@rolodex = Rolodex.new 

#Routes start here
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

post '/contacts' do
	new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
	@@rolodex.add_contact(new_contact)
	redirect to('/contacts')
end

