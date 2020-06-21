class User < ApplicationRecord
  before_save :downcase_email
  validates :name,  presence: true,
                    length: {maximum: Settings.user_name.max_length}
  VALID_EMAIL_REGEX = Settings.valid_email_regex
  validates :email, presence: true,
                    length: {maximum: Settings.user.email.max_length},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
  validates :password, presence: true,
                       length: {minimum: Settings.user.password.min_length},
                       allow_nil: true
  has_secure_password

  private

  def downcase_email
    email.downcase!
  end
end
