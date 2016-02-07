class User < ActiveRecord::Base
	attr_accessor :login

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :twitter]

  validates :username, presence: true, uniqueness: true

	def self.find_for_database_authentication(warden_conditions)
		conditions = warden_conditions.dup
		if login = conditions.delete(:login)
			where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
		elsif conditions.has_key?(:username) || conditions.has_key?(:email)
			where(conditions.to_hash).first
		end
	end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      if auth.provider == "facebook"
        user.username = auth.info.name
      elsif auth.provider == "twitter"
        user.username = auth.info.nickname
      end
      user.email = auth.info.email
      user.password = Devise.friendly_token[8, 20]
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if session["devise.facebook_data"]
        if data = session["devise.facebook_data"]
          user.email = data["email"] if user.email.blank?
          user.username = data["name"]
        end
      elsif session["devise.twitter_data"]
        if data = session["devise.twitter_data"]
          user.email = data["email"] if user.email.blank?
          user.username = data["nickname"]
        end
      end
    end
  end
end
