require 'spec_helper'

describe User do
  describe 'validation' do
    context 'given valid attributes' do
      let(:user) { FactoryGirl.build(:user) }

      it 'is valid' do
        expect(user.valid?).to eq true
      end
    end

    describe 'name validation' do
      context 'when name is blank' do
        let(:invalid_name) { '   ' }
        let(:user) { FactoryGirl.build(:user, name: invalid_name) }

        it 'is invalid' do
          expect(user.valid?).to eq false
        end
      end

      context 'when name is too long' do
        let(:invalid_name) { 'a' * 51 }
        let(:user) { FactoryGirl.build(:user, name: invalid_name) }

        it 'is invalid' do
          expect(user.valid?).to eq false
        end
      end
    end

    describe 'email validation' do
      context 'when email is blank' do
        let(:invalid_email) { '   ' }
        let(:user) { FactoryGirl.build(:user, email: invalid_email) }

        it 'is invalid' do
          expect(user.valid?).to eq false
        end
      end

      context 'when email is too long' do
        let(:invalid_email) { "#{'a' * 244}@example.com" }
        let(:user) { FactoryGirl.build(:user, email: invalid_email) }

        it 'is invalid' do
          expect(user.valid?).to eq false
        end
      end

      context 'given valid email addresses' do
        let(:user) { FactoryGirl.build(:user) }
        let(:valid_addresses) do
          %w[
            user@example.com
            USER@foo.COM
            A_US-ER@foo.bar.org
            first.last@foo.jp
            alice+bob@baz.cn
          ]
        end

        it 'is valid' do
          valid_addresses.each do |valid_address|
            user.email = valid_address
            expect(user.valid?).to eq true
          end
        end
      end

      context 'given invalid addresses' do
        let(:user) { FactoryGirl.build(:user) }
        let(:invalid_addresses) do
          %w[
            user@example,com
            user_at_foo.org
            user.name@example.
            foo@bar_baz.com
            foo@bar+baz.com
          ]
        end

        it 'is invalid' do
          invalid_addresses.each do |invalid_address|
            user.email = invalid_address
            expect(user.valid?).to eq false
          end
        end
      end

      context 'given non-unique email' do
        let(:same_email) { 'sample@sample.com' }
        let(:user) { FactoryGirl.build(:user, email: same_email) }

        it 'is invalid' do
          FactoryGirl.create(:user, email: same_email)
          expect(user.valid?).to eq false
        end
      end
    end

    describe 'password validation' do
      context 'when password is blank' do
        let(:invalid_password) { ' ' * 6 }
        let(:user) do
          FactoryGirl.build(
            :user,
            password: invalid_password,
            password_confirmation: invalid_password
          )
        end

        it 'is invalid' do
           expect(user.valid?).to eq false
        end
      end

      context 'when password is too short' do
        let(:invalid_password) { 'a' * 5 }
        let(:user) do
          FactoryGirl.build(
            :user,
            password: invalid_password,
            password_confirmation: invalid_password
          )
        end

        it 'is invalid' do
          expect(user.valid?).to eq false
        end
      end
    end
  end
end
