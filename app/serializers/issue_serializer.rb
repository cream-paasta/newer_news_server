class IssueSerializer < ActiveModel::Serializer
  attributes :id, :title, :link, :description, :view_count, :pubed_at

  attribute :is_scrap do
    object.issues_users.scrap.where(user_id: @instance_options[:current_user]).present?
  end

  attribute :is_black_list do
    object.issues_users.black_list.where(user_id: @instance_options[:current_user]).present?
  end

  attribute :scrap_count do
    object.issues_users.scrap.count
  end

  attribute :pubed_at do
    I18n.l(object.pubed_at) if object.pubed_at.present?
  end
end
