class Connection < ApplicationRecord
    #validations
    validates :Connection_Type, presence: true

    #associations
    belongs_to :pet
    belongs_to :user
    belongs_to :organization

end