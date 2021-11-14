class Issue < ApplicationRecord
  has_many :issues_users, class_name: 'IssuesUser', dependent: :nullify
  has_many :users, class_name: 'User', through: :issues_users, source: :user

end
