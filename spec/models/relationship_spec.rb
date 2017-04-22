require 'spec_helper'

describe Relationship do
  describe 'validate' do
    before{ FactoryGirl.create_list(:user,30)}
    subject { relationship.valid? }
    
    context 'given blank value to follower_id' do
      let(:relationship){FactoryGirl.build(:relationship,follower_id: '')}
      it {expect(subject).to eq false}
    end
    
    context 'given blank value to followed_id' do
      let(:relationship){FactoryGirl.build(:relationship,followed_id: '')}
      it { expect(subject).to eq false}
    end
    context 'given non_unique value' do
      let(:relationship){FactoryGirl.build(:relationship)}
      it 'is invalid' do
        relationship_dup = relationship.dup
        relationship_dup.save
        expect(subject).to eq false
      end
    end
  end
end  