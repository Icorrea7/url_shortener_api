# == Schema Information
#
# Table name: urls
#
#  id             :integer          not null, primary key
#  long_url       :string
#  short          :string
#  complete_short :string
#  click_count    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  base_url       :string
#
require 'test_helper'

class UrlTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
