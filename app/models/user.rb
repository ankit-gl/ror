class User < ApplicationRecord
  before_save :downcase_email

  has_secure_password

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true

  def downcase_email
    self.email = email.downcase
  end
end
