require 'spec_helper'

describe User do
  describe 'validation' do
    let(:user) do
      User.new(
        name: 'Example User',
        email: 'user@example.com',
        password: 'foobar',
        password_confirmation: 'foobar'
      )
    end

    context 'given valid attributes' do
      it 'is valid' do
        expect(user.valid?).to eq true
      end
    end

    describe 'name validation' do
      context 'when name is blank' do
        it 'is invalid' do
          user.name = '      '
          expect(user.valid?).to eq false
        end
      end

      context 'when name is too long' do
        it 'is invalid' do
          user.name = 'a' * 51
          expect(user.valid?).to eq false
        end
      end
    end

    describe 'email validation' do
      context 'when email is blank' do
        it 'is invalid' do
          user.email = '         '
          expect(user.valid?).to eq false
        end
      end

      context 'when email is too long' do
        it 'is invalid' do
          user.email = 'a' * 244 + "@example.com"
          expect(user.valid?).to eq false
        end
      end

      context 'given valid email addresses' do
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
        it 'is invalid' do
          duplicate_user = user.dup
          user.save
          expect(duplicate_user.valid?).to eq false
        end
      end
    end

    describe 'password validation' do
      context 'when password is blank' do
        it 'is invalid' do
           user.password = user.password_confirmation = " " * 6
           expect(user.valid?).to eq false
        end
      end

      context 'when password is too short' do
        it 'is invalid' do
          user.password = user.password_confirmation = 'a' * 5
          expect(user.valid?).to eq false
        end
      end
    end
  end
end
