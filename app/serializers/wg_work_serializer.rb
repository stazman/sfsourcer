class WgWorkSerializer < ActiveModel::Serializer
  attributes :id, :author, :bio, :title, :version, :content
  belongs_to :writer_group
end
