class WgWorkSerializer < ActiveModel::Serializer
  attributes :id, :author, :bio, :title, :version, :content
  has_many :wg_comments
end
