require_relative 'contact'
require_relative 'rolodex'

require 'sinatra'

@@rolodex = Rolodex.new
@@rolodex.add_contact(Contact.new('Holly', 'Bear', 'Holly@bear.com', 'note'))
@@rolodex.add_contact(Contact.new('Holly', 'Bear', 'Holly@bear.com', 'note'))
@@rolodex.add_contact(Contact.new('Holly', 'Bear', 'Holly@bear.com', 'note'))
@@rolodex.add_contact(Contact.new('Holly', 'Bear', 'Holly@bear.com', 'note'))

@@crm_app_name = "Rolo"

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

# this is not search; this is to list a specific contact (with contact :id)
# /contacts/1000  -> show the page for contact 1000.
# params[:id] == 1000

get '/contacts/:id' do
	search_contact = params[:id].to_i 
	@display_contact = @@rolodex.contacts.find {|contact| contact.id == search_contact }
	if @display_contact
		erb :contact
	else 
		raise Sinatra::NotFound
	end
end


get '/contacts/:id/edit' do
	puts params
	search_contact = params[:id].to_i 
	@display_contact = @@rolodex.contacts.find {|contact| contact.id == search_contact }
	if @display_contact
		erb :edit_specific_contact
	else 
		raise Sinatra::NotFound
	end
end 

post '/contacts' do
	new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
	@@rolodex.add_contact(new_contact)
	redirect to('/contacts')
end

# post '/contacts/:id' do
# 	search_contact = params[:ID]
# 	puts search_contact.to_s
# 	redirect to('/contacts/:id')
# end

