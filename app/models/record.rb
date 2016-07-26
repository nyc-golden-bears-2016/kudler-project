class Record < ActiveRecord::Base

  has_many :votes, as: :voteable
  has_many :reviews, as: :reviewable
  belongs_to :artist



end
