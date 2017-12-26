class MessagesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_chat_room

	def create
		message = @chatroom.messages.new(message_params)
		message.user = current_user

		message.save
		redirect_to @chatroom
	end

	private

	def set_chat_room
		@chatroom = ChatRoom.find(params[:chat_room_id])
	end

	def message_params
		params.require(:message).permit(:body)
	end
end
