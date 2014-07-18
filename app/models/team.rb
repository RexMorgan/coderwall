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