class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :issues_users, class_name: 'IssuesUser', dependent: :nullify
  has_many :issues, class_name: 'Issue', through: :issues_users, source: :issue
  has_many :posts

  def jwt_payload
    super.merge('foo' => 'bar')
  end
end
