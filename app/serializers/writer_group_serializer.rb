class WriterGroupSerializer < ActiveModel::Serializer
  attributes :id, :wg_name, :wg_creator
  has_many :wg_works
end
