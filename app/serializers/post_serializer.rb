class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :gu

  attribute :user_id do
    object.user.id
  end

  attribute :user_name do
    object.user.username
  end

  attribute :created_at do
    I18n.l(object.created_at)
  end
end
