require 'spec_helper'

describe Flatpage do
  Language.all.each do |locale, _|
    it { should validate_presence_of :"title_#{locale}" }
    it { should ensure_length_of(:"title_#{locale}").is_at_least(3) }

    it { should validate_presence_of :"content_#{locale}" }
    it { should ensure_length_of(:"content_#{locale}").is_at_least(10) }
  end
end