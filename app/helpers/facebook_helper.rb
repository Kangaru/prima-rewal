require 'ostruct'

module FacebookHelper
  def facebook_like_box
    options ||= OpenStruct.new({
      href:   "http://facebook.com/primarewal", width:  840, height: 185, faces: true, stream: false, header: false, color:  '#ffffff'
    })

    render partial: 'helpers/facebook/like_box', locals: { options: options }
  end
end