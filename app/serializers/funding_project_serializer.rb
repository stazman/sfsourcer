class FundingProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :funding_goal
  has_many :pledges
end
