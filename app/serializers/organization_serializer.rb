class OrganizationSerializer < ActiveModel::Serializer
  attributes :id,
  :Organization_Name,
  :Organization_Address,
  #:Organization_Phone,
  #:Organization_Email,
  :Organization_Website,
  :Organization_Description,
  #:Organization_Validation,
  :created_at,
  :updated_at,
  :profile

  def profile
    object.resources.where(Resource_Type: 'profile')
  end


end
