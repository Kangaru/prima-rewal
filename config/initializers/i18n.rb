I18n.locale = :pl
I18n.default_locale = :pl
I18n.available_locales = [:pl, :en, :de]
I18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]


I18n.reload!