class FlatpageSweeper < ActionController::Caching::Sweeper
  observe Flatpage, Flatpage::Translation

  def sweep(flatpage)
    clear_menu_cell_cache
  end

  alias_method :after_create, :sweep
  alias_method :after_update, :sweep
  alias_method :after_delete, :sweep


private


  # Destroy every cache created by MenuCell
  # Supported keys:
  #   - cells/menu/display
  #   - cells/menu/display/
  #   - cells/menu/display//
  #   - cells/menu/display/pl
  #   - cells/menu/display/pl/strona/10-oferta
  #   - etc. ...
  def clear_menu_cell_cache
    Rails.cache.delete_matched /cells\/menu\/display\S+/
  rescue => e
    puts e.backtrace
    raise 'test'
  end
end