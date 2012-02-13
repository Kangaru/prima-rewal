ActiveAdmin.register Flatpage do
  config.clear_sidebar_sections!

  controller do
    helper :locale
  end


  index do
    column :title, sortable: false do |flatpage|
      flatpage.translations.map(&:title) * '/'
    end

    column :locales do |flatpage|
      flatpage.translations.map(&:locale).map {|locale| Language.translate_locale locale } * '/'
    end

    column :created_at do |flatpage|
      l flatpage.created_at
    end

    default_actions
  end

  form partial: 'form'

  show do |flatpage|
    attributes_table do
      row :title do
        flatpage.translations.map(&:title) * '/'
      end

      for_locales do |locale, _|
        row :"content_#{locale}"
      end

      row :created_at
      row :updated_at
    end
  end
end
