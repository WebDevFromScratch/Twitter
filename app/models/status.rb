class Status < ActiveRecord::Base
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'

  validates :creator, presence: :true
end