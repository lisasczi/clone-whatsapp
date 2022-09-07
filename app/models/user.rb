class User < ApplicationRecord
  validates :phone_number, presence: true
  validates :name, presence: true
  validates :last_name, presence: true
end
