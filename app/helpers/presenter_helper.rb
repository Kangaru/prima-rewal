module PresenterHelper
  def present(object, klass = nil)
    klass ||= recognize_presenter_klass(object)
    yield klass.new(object, self) if block_given?
  end


private

  def recognize_presenter_klass(object)
    "#{object.class}Presenter".constantize
  end
end