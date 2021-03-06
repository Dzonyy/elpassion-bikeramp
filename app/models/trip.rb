# == Schema Information
#
# Table name: trips
#
#  id                  :bigint           not null, primary key
#  date                :date
#  destination_address :string
#  distance            :decimal(, )
#  price_subunit       :integer
#  start_address       :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class Trip < ApplicationRecord
  validates :date, :price, :destination_address, :start_address, presence: true
  validates :price, :distance, numericality: { greater_than: 0 }

  monetize :price_subunit
end
