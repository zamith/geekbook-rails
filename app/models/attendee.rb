class Attendee < ActiveRecord::Base
  attr_accessible :name, :avatar_filename, :geek_votes, :profile_url

  def add_geek_vote
    self.geek_votes += 1
    self.save
  end
end
