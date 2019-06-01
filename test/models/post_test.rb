# == Schema Information
#
# Table name: posts
#
#  id              :bigint           not null, primary key
#  Post_Title      :string
#  Post_Content    :text
#  Post_Tag        :string
#  organization_id :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
