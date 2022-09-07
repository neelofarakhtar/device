class WelcomesController < ApplicationController
	def index
		@welcome = Welcome.all
	end
end
