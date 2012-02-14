module PresenterHelper
  def present(object, klass = "#{object.class}Presenter".constantize)
    yield klass.new(object, self) if block_given?
  end
end