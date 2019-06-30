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
    include Rails.application.routes.url_helpers

    #file
    has_one_attached :file

    #validations
    validates :Resource_Type, presence: true
    validates :Resource_Link, presence: true

    #Asociations
    belongs_to :resourceable, polymorphic: true

    def path_file(file)
        # ActiveStorage::Blob.service.path_for(file.key)      
        # ActiveStorage::Service.service.url(file.key)
        return 'https://petshappy2.s3-us-west-1.amazonaws.com/'+ file.key
    end

    def featured_image_url
        if self.file.attachment
            self.file.attachment.service_url
        else
            puts "error"
        end
    end
end
