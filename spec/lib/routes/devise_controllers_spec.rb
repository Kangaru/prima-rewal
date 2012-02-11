require 'spec_helper'


describe 'Routes::DeviseControllers' do
  let(:klass) { Routes::DeviseControllers }

  it 'should return proper controllers' do
    klass.controllers.should == [:confirmations, :passwords, :registrations, :sessions, :unlocks]
  end

  it 'should return proper prefix' do
    klass.prefix.should == 'auth/devise'
  end

  it 'should return proper hash' do
    klass.should_receive(:controllers).and_return([:confirmations, :registrations])
    klass.should_receive(:prefix).exactly(2).and_return('auth')

    expected = { confirmations: 'auth/confirmations', registrations: 'auth/registrations' }
    klass.to_hash.should == expected
  end
end