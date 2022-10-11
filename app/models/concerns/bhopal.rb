module Bhopal
	def hello
		puts User.pluck(:email).last(5)
	end
end