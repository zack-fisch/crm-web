require_relative 'contact'
require_relative 'rolodex'

require 'sinatra'

@@rolodex = Rolodex.new 

@@crm_app_name = "Zack's CRM" #haha

#Routes start here
get '/' do
	erb :add_contact
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
	# When submit button is hit, lets see if we can make a popup with the user ID, and a an okay button -> THIS redirects to /contacts
	redirect to('/contacts')
end

