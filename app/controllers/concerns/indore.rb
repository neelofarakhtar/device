module Indore
	def hello
		# debugger
		User.last.firstname
	end

	def read_user
		User.last(5)
	end
end
