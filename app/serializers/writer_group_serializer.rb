class WriterGroupSerializer < ActiveModel::Serializer
  attributes :id, :wg_name, :wg_creator, :wg_description
end
