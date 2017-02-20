require 'rails_helper'

RSpec.describe User, type: :model do

  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should validate_length_of(:password).is_at_least(6) }
    it { should allow_value(nil).for(:password) }
  end

  describe "password=" do

    it "sets a password" do
      user = User.new
      expect(user.password="123456").not_to raise_error
      end

    it "doesn't save the password to the database" do
      expect{User.find_by_password("password")}.to raise_error(NoMethodError)
    end

  end

  describe "::find_by_credentials" do
    # before_each { user = User.new(username: "punkrockkid97")
    #   user.password_digest = SecureRandom}
    it "checks that the password is correct using BCrypt" do
      expect(BCrypt::Password).to receive(:new)
    end

    it "returns nil if not success" do
      user = User.create!(username: "punkrockkid97", password: "good_password")
      expect(User.find_by_credentials(
        username: "punkrockkid97",
        password: "bad_password")).to be_nil
    end

  end

  describe "#ensure_session_token" do
    it "generates a token before create" do
      user = User.new(username: "punkrockkid97", password_digest:"0")
      expect(user.session_token).to be_nil
      user.save
      expect(user.session_token).not_to be_nil
    end
  end

end
