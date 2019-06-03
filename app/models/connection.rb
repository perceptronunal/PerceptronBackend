# == Schema Information
#
# Table name: connections
#
#  id              :bigint           not null, primary key
#  Connection_Type :string
#  pet_id          :bigint
#  user_id         :bigint
#  organization_id :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Connection < ApplicationRecord
    #validations
    validates :Connection_Type, presence: true

    #associations
    belongs_to :pet
    belongs_to :user
    belongs_to :organization


end
