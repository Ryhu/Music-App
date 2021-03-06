class User < ActiveRecord::Base
  after_initialize do
    ensure_session_token
    generate_activation_token
  end
  has_many :notes
  validates :email, :password_digest, :session_token, :activation_token, presence: true
  validates :session_token, :email, uniqueness: true

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

  def generate_activation_token
    self.activation_token ||= SecureRandom::urlsafe_base64
  end

  def activated?
    self.activated
  end


  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

end
