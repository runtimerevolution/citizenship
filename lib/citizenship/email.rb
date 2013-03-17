module Citizenship
  EMAIL_REGEXP = /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/i

  def self.valid_email!(email)
    raise EmailError, :invalid_email unless email.match(EMAIL_REGEXP)
    email
  end

  def self.valid_email?(email)
    valid_email!(email)
    true
  rescue EmailError
    false
  end
end