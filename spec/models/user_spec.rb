require 'rails_helper'

RSpec.describe User, type: :model do

  describe "validations" do
    subject(:user) { User.new(username: "cooluser", password: "secretsecrets")}

    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }

    it { should validate_uniqueness_of(:username) }
    it { should validate_length_of(:password).is_at_least(6) }
    it { should allow_value(nil).for(:password) }
  end

  describe "password=" do

    it "sets a password" do
      user = User.new
      expect{user.password="123456"}.not_to raise_error
      end

    it "doesn't save the password to the database" do
      expect{User.find_by_password("password")}.to raise_error(NoMethodError)
    end

  end

  describe "::find_by_credentials" do
    it "returns nil if not success" do
      user = User.create!(username: "punkrockkid97", password: "good_password")
      expect(User.find_by_credentials("punkrockkid97", "bad_password")).to be_nil
    end

    ### find_by_credentials takes in just two strings!!!

    it "returns user if success" do
      user = User.create!(username: "punkrockkid97", password: "good_password")
      expect(User.find_by_credentials("punkrockkid97", "good_password")).to eq(user)
    end

  end

  describe "#ensure_session_token" do
    it "generates a token before create" do
      user2 = User.new(username: "punkrockkid97", password:"123456")
      expect(user2.session_token).not_to be_nil
    end
  end

end
