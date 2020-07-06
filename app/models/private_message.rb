class PrivateMessage < ApplicationRecord
    belongs_to :sender_id, class_name: 'User'
    belongs_to :recipient_id, class_name: 'User'
end
