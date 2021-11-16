class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at

  attribute :user_id do
    object.user.id
  end

  attribute :user_id do
    object.user.username
  end
end
