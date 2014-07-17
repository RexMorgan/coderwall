class Team < ActiveRecord::Base
  include Tire::Model::Search
  include ResqueSupport::Basic
  include LeaderboardRedisRank
  include SearchModule

  mount_uploader :avatar, AvatarUploader

  has_many :featured_links, :dependent => :destroy
  has_many :pending_team_members, :dependent => :destroy
  has_many :team_locations, :dependent => :destroy
end

class TeamMember < ActiveRecord::Base
  def user
    @user ||= User.where(id: self[:user_id]).first
  end

  def score
    badges.all.sum(&:weight)
  end

  def display_name
    name || username
  end

  [:badges, :title, :endorsements].each do |m|
    define_method(m) { user.try(m) }
  end
end

class TeamLink < ActiveRecord::Base

end

class TeamLocation < ActiveRecord::Base

end