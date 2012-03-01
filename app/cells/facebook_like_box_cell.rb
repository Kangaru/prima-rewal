require 'ostruct'

class FacebookLikeBoxCell < Cell::Rails

  def display(*args)
    @options = OpenStruct.new({
      href:   "http://facebook.com/primarewal", width:  250, height: 80, faces: false, stream: false, header: false, color:  '#ffffff'
    }.merge args.extract_options!)

    render
  end

end
