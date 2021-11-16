class IssueSerializer < ActiveModel::Serializer
  attributes :id, :title, :link, :description
end
