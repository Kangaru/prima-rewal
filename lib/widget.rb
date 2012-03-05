class Widget
  @widgets = { carousel: :cell, google_maps: :cell, facebook_gallery: :cell }

  def initialize(content, context)
    @content, @context = content, context
    @widgets = self.class.widgets
  end

  attr_accessor :content, :context, :widgets
  class << self
    attr_accessor :widgets
  end


  def widgetize
    matching do |type, name|
      context.send(type, name, :display)
    end
  end


private

  def matching
    content.gsub /#{widgets.keys * '|'}(?=\ \]\])/ do |widget|
      name = widget.to_sym
      type = "render_#{widgets[name]}".to_sym
      yield(type, name) if block_given?
    end.gsub(/\[{2} | \]{2}/, '')
  end
end