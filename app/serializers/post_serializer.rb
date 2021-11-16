class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at, :gu

  attribute :user_id do
    object.user.id
  end

  attribute :user_name do
    object.user.username
  end
end
