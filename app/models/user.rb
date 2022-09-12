class User < ApplicationRecord
  has_many :sended_messages, class_name: "Message", foreign_key: 'sender_id'
  has_many :user_chats
  has_many :chats, through: :user_chats

  validates :phone_number, presence: true, uniqueness: true
  validates :name, presence: true
  validates :last_name, presence: true
end
