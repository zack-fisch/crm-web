class Rolodex

	attr_reader :contacts, :id, :counter

	def initialize
		@contacts = []
		@id = 1000
		@counter = 0
	end

	def add_contact(contact)
		contact.id = @id
		@contacts << contact
		@id += 1
		@counter += 1
	end

	def remove_contact(contact)
		@contacts.delete(contact)
		@counter -= 1
	end

end

