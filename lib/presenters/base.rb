class Presenters::Base
  def initialize(object, template)
    @object, @template = object, template
  end



private
  named_reader :template, as: :h

  def self.presents(name)
    named_reader :object, as: name
  end

  def method_missing(*args, &block)
    @template.send(*args, &block)
  end
end