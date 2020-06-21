class Organization < ApplicationRecord
  has_many :trailers
  has_many :parts
end
