class Profilepicture < ApplicationRecord
    include Rails.application.routes.url_helpers

    #avatar
    has_one_attached :avatar

    #Asociations
    belongs_to :profilepicturesable, polymorphic: true

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
