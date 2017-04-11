require 'spec_helper'

describe User do
  # pending "add some examples to (or delete) #{__FILE__}"

  let(:user){ User.new(name: "Example User", email: "user@example.com",password:'foobar',password_confirmation:'foobar') }
  
  context "valid" do
    it "return true with valid value" do
      expect(user.valid?).to eq true
    end
  end

  context "Name" do
    it "is invalid with blank name" do
      user.name = "      "
      expect(user.valid?).to eq false
    end

    it "is invalid with too long name" do
      user.name = "a" * 51
      expect(user.valid?).to eq false
    end
  end

  context "Email" do
    it "is invalid with blank email" do
      user.email = "         "
      expect(user.valid?).to eq false
    end

    it "is invalid with too long email" do
      user.email = "a" * 244 + "@example.com"
      expect(user.valid?).to eq false
    end

    it "is valid with valid addresses"do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]

    valid_addresses.each do |valid_address|
      user.email = valid_address
      expect(user.valid?).to eq true
      end
    end
    it "is invalid with invalid addresses"do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      user.email = invalid_address
      expect(user.valid?).to eq false
      end
    end
    
    it "should be unique" do
      duplicate_user = user.dup
      user.save
      expect(duplicate_user.valid?).to eq false
    end
  end

end
