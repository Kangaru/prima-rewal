module Presenters::Let
  extend ActiveSupport::Concern

  module ClassMethods
    def let(name, &block)
      define_method name, block
    end
  end
end