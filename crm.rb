require_relative 'contact'
require_relative 'rolodex'

require 'sinatra'

@@rolodex = Rolodex.new


@@crm_app_name = "Rollo"

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
	# search contact = an integer that is id input in the URL
	search_contact = params[:id].to_i 
	@display_contact = @@rolodex.contacts.find {|contact| contact.id == search_contact }
	if @display_contact
		erb :contact
	else 
		raise Sinatra::NotFound
	end
end


get '/contacts/:id/edit' do
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

put '/contacts/:id' do
	search_contact = params[:id].to_i 
	@display_contact = @@rolodex.contacts.find {|contact| contact.id == search_contact }
	if @display_contact
		@display_contact.first_name = params[:first_name]
		@display_contact.last_name = params[:last_name]
		@display_contact.email = params[:email]
		@display_contact.note = params[:note]
	  redirect to('/contacts')
	else
		raise Sinatra::NotFound
	end
end

delete "/contacts/:id" do
	search_contact = params[:id].to_i 
	@display_contact = @@rolodex.contacts.find {|contact| contact.id == search_contact }
	if @display_contact
		@@rolodex.remove_contact(@display_contact)
		redirect to("/contacts")
	else
		raise Sinatra::NotFound
	end
end
