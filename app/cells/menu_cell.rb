class MenuCell < Cell::Rails
  helper Cells::MenuHelper, ApplicationHelper

  cache :display, :expire_menu

  def display
    @main_page, *@flatpages = Flatpage.for_menu
    render
  end


private

  def expire_menu
    Flatpage.expiration_code request.fullpath
  end
end
