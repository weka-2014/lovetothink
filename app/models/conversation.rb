class Conversation < ActiveRecord::Base
	has_many :messages, dependent: :destroy

	def formatted_messages
		messages.order(id: :asc).map do |message|
			{ sender: User.find(message.sender_id), content: message.content }
		end
	end

	def formatted_users(current_user_id)
		if current_user_id == user_1_id
			{ sender: User.find(user_1_id), recipient: User.find(user_2_id) }
		else
			{ sender: User.find(user_2_id), recipient: User.find(user_1_id) }
		end
	end
	
end
