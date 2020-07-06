class User < ApplicationRecord
    has_secure_password

    validates_presence_of :email
    validates_uniqueness_of :email, :username
    
    has_many :room_messages
    has_many :rooms, through: :room_messages

    has_many :senders, foreign_key: :sender_id, class_name: 'PrivateMessage'
    has_many :recipients, foreign_key: :recipient_id, class_name: 'PrivateMessage'
    has_many :senders, through: :recipients 
    has_many :recipients, through: :senders

end
