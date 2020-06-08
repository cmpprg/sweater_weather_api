class ApiKeyGenerator
  def self.generate(user_email)
    Digest::SHA1.hexdigest unique_data(user_email)
  end

  private

  def self.unix_now
    Time.now.to_i.to_s
  end

  def self.unique_data(email)
    unix_now + email
  end
end
