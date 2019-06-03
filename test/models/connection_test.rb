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

require 'test_helper'

class ConnectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
