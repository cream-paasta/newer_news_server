class IssuesUser < ApplicationRecord
  belongs_to :issue, class_name: 'Issue'
  belongs_to :user, class_name: 'User'

  enum type: {
    scrap: 0,
    black_list: 1
  }

end
