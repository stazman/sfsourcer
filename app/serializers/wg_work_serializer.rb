class WgWorkSerializer < ActiveModel::Serializer
  attributes :id, :author, :bio, :title, :version, :content
end
