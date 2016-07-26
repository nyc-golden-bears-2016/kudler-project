helpers do

  def vote_count(voted)
    voted.reduce(0) {|total, vote| total += vote.value}
  end


end
