class User < ApplicationRecord
    # implements db relations
    has_many :articles, dependent: :destroy
    # before_save do something before saving
    before_save { self.email = email.downcase }
    # case_sensitive: false ignores cases
    validates :username, presence: true, 
                         uniqueness: { case_sensitive: false }, 
                         length: { minimum: 3, maximum: 25 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
                      length: { maximum: 105 },
                      uniqueness: { case_sensitive: false },
                      format: { with: VALID_EMAIL_REGEX }
    has_secure_password
end