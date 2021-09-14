# == Schema Information
#
# Table name: trips
#
#  id                  :bigint           not null, primary key
#  date                :date
#  destination_address :string
#  distance            :decimal(, )
#  price_subunit       :decimal(, )
#  start_address       :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
require "test_helper"

class TripTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
