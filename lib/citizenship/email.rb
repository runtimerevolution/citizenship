module Citizenship
  def self.valid_email!(email)
    regexp = /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/
    raise EmailError, :invalid_email unless email.match(regexp)
    email
  end

  def self.valid_email?(email)
    valid_email!(email)
    true
  rescue EmailError
    false
  end
end