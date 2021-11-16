class IssueSerializer < ActiveModel::Serializer
  attributes :id, :title, :link, :description, :view_count
end
