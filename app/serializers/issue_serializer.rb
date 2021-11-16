class IssueSerializer < ActiveModel::Serializer
  attributes :id, :title, :link, :description, :view_count

  attribute :is_scrap do
    object.issues_users.scrap.where(user_id: @instance_options[:current_user]).present?
  end

  attribute :scrap_count do
    object.issues_users.scrap.count
  end
end
