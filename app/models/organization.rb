class Organization < ApplicationRecord
  has_many :trailers
  has_many :parts
  has_many :products
end
