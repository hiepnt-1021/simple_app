class User < ApplicationRecord
  before_save :downcase_email
  validates :name, presence: true,
                   length: {maximum: Settings.users.user_name.maximum}
  VALID_EMAIL_REGEX = Settings.regex_valid_email
  validates :email, presence: true,
                    length: {maximum: Settings.users.user.email.maximum},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false} #vi vo ham downcase r
   validates :password, presence: true,
                        length: {minimum: Settings.users.password.minimum},
                        allow_nil: true
  has_secure_password

  private

  def downcase_email
    email.downcase!
  end
end
