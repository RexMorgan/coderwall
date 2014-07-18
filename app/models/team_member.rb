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