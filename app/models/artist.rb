class Artist < ActiveRecord::Base

  has_many :votes, as: :voteable
  has_many :reviews, as: :reviewable
  has_many :records

end
