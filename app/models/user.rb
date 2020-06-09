class User < ApplicationRecord
  before_create :set_api_key

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true

  has_secure_password

  private

  def set_api_key
    self.api_key = ApiKeyGenerator.generate(self.email)
  end
end
