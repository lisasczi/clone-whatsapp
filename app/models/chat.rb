class Chat < ApplicationRecord
  has_many :messages
  has_many :user_chats

end
