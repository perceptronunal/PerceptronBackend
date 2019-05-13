class InterestedIn < ApplicationRecord
    #validations
    validates :Interest_Type, presence: true

    #associations
    belongs_to :user
    belongs_to :pet

end