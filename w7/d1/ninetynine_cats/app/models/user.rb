# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  user_name       :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    # SPIRE
    # s: self.find_by_credentials /
    # p: password= /
    # i: is_password? /
    # r: reset_session_token! /
    # e: ensure_session_token /

    attr_reader :password

    validates :user_name, presence: true
    validates :password_digest, presence: { message: 'Password can''t be blank'}
    validates :password, length: { minimum: 6, allow_nil: true}
    # session_token
    validates :session_token, presence: true
    after_initialize :ensure_session_token

    def password=(password)
        self.password_digest = BCrypt::Password.create(password) #digest ends up being 950823405978132758dljgkjlkdgafs;lgk31245702943
        @password = password
    end
    
    def is_password?(password) #actual pword is 'password'.. somebody types 'PASSWORD'
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end
    
    def self.generate_session_token
        SecureRandom::urlsafe_base64(16) # my understanding: creates session "key"
    end
    
    def reset_session_token!
        self.session_token = self.class.generate_session_token # we don't care if session_token existed before, create new
        self.save! # fail loudly when saving, store session_token in DB
        self.session_token
    end

    def self.find_by_credentials(user_name,password)
        user = User.find_by(username: user_name)
        return nil if user.nil?
        user.is_password?(password) ? user : nil # password = 'password'
    end
    
    private
    def ensure_session_token
        # we must be sure to use the ||= operator instead of = or ||, otherwise
        # we will end up with a new session token every time we create
        # a new instance of the User class. This includes finding it in the DB!
        self.session_token ||= self.class.generate_session_token
    end
end
