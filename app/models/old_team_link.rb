class OldTeamLink
  include Mongoid::Document
  embedded_in :team

  field :name
  field :url
end
