require 'spec_helper'

describe Flatpage::Translation do
  it { should validate_presence_of :title }
  it { should ensure_length_of(:title).is_at_least(3) }

  it { should validate_presence_of :content }
  it { should ensure_length_of(:content).is_at_least(10) }

  it { should validate_presence_of :meta_title }
  it { should validate_presence_of :meta_description }
  it { should validate_presence_of :meta_keywords }

  it 'should inherit from Globalize::ActiveRecord::Translation' do
    Flatpage::Translation.superclass.should be(Globalize::ActiveRecord::Translation)
  end
end