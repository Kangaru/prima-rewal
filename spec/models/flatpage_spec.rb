require 'spec_helper'

describe Flatpage do
  it { should validate_presence_of :title }
  it { should ensure_length_of(:title).is_at_least(3) }

  it { should validate_presence_of :content }
  it { should ensure_length_of(:content).is_at_least(10) }

  it "should accept nested attributes for translations" do
    Flatpage.new.should respond_to :translations_attributes=
  end
end