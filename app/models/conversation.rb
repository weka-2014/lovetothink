class Conversation < ActiveRecord::Base
	has_many :messages, dependent: :destroy

	def formatted_messages
		messages.order(id: :asc).map do |message|
			{ sender: User.find(message.sender_id), content: message.content }
		end
	end

	def formatted_users(current_user_id)
		if current_user_id == user_1_id
			{ user: User.find(user_1_id), match: User.find(user_2_id) }
		else
			{ user: User.find(user_2_id), match: User.find(user_1_id) }
		end
	end

	def self.formatted_conversations(current_user_id)
		conversations = self.where(user_1_id: current_user_id) + self.where(user_2_id: current_user_id)
		conversations.map do |conversation|
			if current_user_id == conversation.user_1_id
				{ id: conversation.id, user: User.find(conversation.user_1_id), match: User.find(conversation.user_2_id) }
			else 
				{ id: conversation.id, user: User.find(conversation.user_2_id), match: User.find(conversation.user_1_id) }
			end
		end
	end
	
end
