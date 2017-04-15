require 'spec_helper'

describe Micropost do
  describe 'validation' do
    subject { micropost.valid?}

    describe 'user_id validation' do
      context 'when user_id is blank'do
          let(:invalid_user_id){ " " }
          let(:micropost){ FactoryGirl.build(:micropost, user_id: invalid_user_id)}
          it { should eq false }
      end
    end

    describe 'content validation' do
      context 'when content is blank'do
        let(:invalid_content){" "}
        let(:micropost){ FactoryGirl.build(:micropost, content:invalid_content)}
        it { should eq false}
      end
      context 'when content is too long' do
        let(:invalid_content){ "a"*141}
        let(:micropost){ FactoryGirl.build(:micropost, content:invalid_content)}
        it { should eq false}
      end
    end
  end
end
