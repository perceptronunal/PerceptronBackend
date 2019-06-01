# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  User_Name  :string
#  User_Email :string
#  User_Phone :string
#  User_City  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
        #validations
        validates :User_Name, presence: true
        validates :User_Email, presence: true, uniqueness: true

        #associations
        has_many :connections, dependent: :destroy
        has_many :resources, as: :resourceable, dependent: :destroy
end
