class WgCommentSerializer < ActiveModel::Serializer
  attributes :id, :author, :content
  belongs_to :wg_work
end
