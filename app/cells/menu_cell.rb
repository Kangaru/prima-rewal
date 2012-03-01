class MenuCell < Cell::Rails
  helper Cells::MenuHelper

  def display
    @main_page, *@flatpages = Flatpage.for_menu
    render
  end

end
