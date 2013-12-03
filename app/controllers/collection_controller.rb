class CollectionController < ApplicationController

	def show
		debugger
		@collection = CollectionList.where(:user_id=>current_user.id)
	end
end
