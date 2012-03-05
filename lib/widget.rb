class Widget
  @widgets = [:carousel, :google_maps, :facebook_gallery]

  def initialize(content, context)
    @content, @context = content, context
    @widgets = self.class.widgets
  end

  attr_accessor :content, :context, :widgets
  class << self
    attr_accessor :widgets
  end


  def widgetize
    matching do |name|
      context.render_cell name, :display
    end
  end


private

  def matching
    content.gsub /#{widgets * '|'}(?=\ \]\])/ do |widget|
      yield(widget.to_sym) if block_given?
    end.gsub(/\[{2} | \]{2}/, '')
  end
end