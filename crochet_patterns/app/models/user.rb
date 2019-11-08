class User < ActiveRecord::Base
  has_many :crochet_patterns
  has_secure_password

    validates :name, presence: true
end