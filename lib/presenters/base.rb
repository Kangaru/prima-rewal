class Presenters::Base
  def initialize(object, template)
    @object, @template = object, template
  end



private

  def self.presents(name)
    define_method name do
      @object
    end
  end

  def h
    @template
  end

  def method_missing(*args, &block)
    @template.send(*args, &block)
  end
end