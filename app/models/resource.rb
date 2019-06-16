# == Schema Information
#
# Table name: resources
#
#  id                :bigint           not null, primary key
#  Resource_Type     :string
#  Resource_Link     :string
#  resourceable_type :string
#  resourceable_id   :bigint
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Resource < ApplicationRecord
    #validations
    validates :Resource_Type, presence: true
    validates :Resource_Link, presence: true

    #Asociations
    belongs_to :resourceable, polymorphic: true

    #avatar
    mount_base64_uploader :avatar, AvatarUploader
    
end
