require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  subject(:user) do
    FactoryBot.build(:user,
      email: "jonathan@fakesite.com",
      password: "good_password")
  end
  # validations
  it { should validate_length_of(:password).is_at_least(6) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  
  describe "session_token" do
    it "assigns a session_token if none given" do
      expect(user.session_token).not_to be_nil
    end
  end
  # SPIRE
  describe ".find_by_credentials" do
  end
  describe "password encryption"  do # password setter (password=())
    it "does not save passwords to the database" do
      email = Faker::Internet.email
      FactoryBot.create(:user, email: email)
      user = User.find_by(email: email) # querying the DB here
      # sesion, pd, etc. email
      expect(user.password).to be(nil) # password shouldn't be a column
    end
    
    it "encrypts password using BCrypt" do
      expect(BCrypt::Password).to receive(:create).with("abcdef")
      FactoryBot.build(:user, password: "abcdef")
    end
  end
  describe "#is_password?" do
  end
  describe "#reset_session_token!" do
  end
  describe "#ensure_session_token" do
  end

  # Associations
 
end
