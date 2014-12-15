class ConversationsController < ApplicationController

	def index
		@conversations = Conversation.formatted_conversations(current_user.id)
	end

	def show
		conversation = Conversation.find(params[:id])
		user_1_id = conversation.user_1_id
		user_2_id = conversation.user_2_id
		if current_user.id == user_1_id || current_user.id == user_2_id
			@users = conversation.formatted_users(current_user.id)
			@messages = conversation.formatted_messages
			@new_message = conversation.messages.new
		else
			redirect_to "/personal"
		end
	end

	def create
		user_1_id = params[:user_1_id]
		user_2_id = params[:user_2_id]
		if conversation = Conversation.find_by(user_1_id: user_1_id, user_2_id: user_2_id)
			redirect_to "/conversations/#{conversation.id}"
		else 
			conversation = Conversation.create(user_1_id: user_1_id, user_2_id: user_2_id)
			redirect_to "/conversations/#{conversation.id}"
		end
	end

	def add_message
		conversation = Conversation.find(params[:id])
		sender_id = current_user.id
		recipient_id = params[:match_id]
		content = params[:message][:content]
		conversation.messages.create(sender_id: sender_id, recipient_id: recipient_id, content: content)
		redirect_to "/conversations/#{conversation.id}"
	end

end