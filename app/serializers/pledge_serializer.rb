class PledgeSerializer < ActiveModel::Serializer
  attributes :id, :amount
  belongs_to :funding_project, serializer: FundingProjectPledgesSerializer

end
