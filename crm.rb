require 'sinatra'
require_relative 'contact'
require_relative 'rolodex'

get '/' do
	@crm_app_name = "My CRM"
	@time = Time.now
	erb :index
end

get '/contacts' do
	@contacts = []
	@contacts << Contact.new("Julie", "Hache", "julie@bitmakerlabs.com", "Instructor")
	@contacts << Contact.new("Will", "Richman", "will@bitmakerlabs.com", "Co-Founder")
	@contacts << Contact.new("Chris", "Johnston", "chris@bitmakerlabs.com", "Instructor")

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



