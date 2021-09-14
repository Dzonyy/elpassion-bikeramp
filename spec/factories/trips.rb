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
FactoryBot.define do
  factory :trip do
    start_address { 'Dietla  52, Kraków, Polska' }
    destination_address { 'Jana Kantego Federowicza 57, Kraków, Polska' }
    date { '1999-02-02' }
    price { '5' }
    distance { '3.85' }
  end
end
