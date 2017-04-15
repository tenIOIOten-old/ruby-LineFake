require 'spec_helper'

describe SessionsController do
  describe 'login' do
    subject { get :new }

    before { FactoryGirl.create(:user) }

    context 'given valid information' do
      it 'renders sessions/new' do
        subject
        expect(response).to render_template('sessions/new')
      end
    end
  end
end
