class Review < ActiveRecord::Base

   belongs_to :reviewable, polymorphic: true
   has_many :votes, as: :voteable
   belongs_to :reviewer, class_name: "User", foreign_key: "reviewer_id"

end
