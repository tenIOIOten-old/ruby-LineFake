require 'spec_helper'

describe Micropost do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'validation' do
    subject { micropost.valid?}

    describe 'user_id validation' do
      context 'when user_id is blank'do
          let(:invalid_user_id){ " " }
          let(:micropost){ FacrotyGirl.build(:micropost, user_id: invalid_user_id)}
          it do
            is_expected eq false
          end 
        end
      end
    end

    describe 'content validation' do
      context 'when content is blank'do
        let(:invalid_content){" "}
        let(:micropost){ FacrotyGirl.build(:micropost, content:invalid_content)}
        it { is_expected eq false}
      end
      context 'when content is too long' do
        let(:invalid_content){ "a"*141}
        let(:micropost){ FacrotyGirl.build(:micropost, content:invalid_content)}
        it { is_expected eq false}
      end
    end
  end
end
