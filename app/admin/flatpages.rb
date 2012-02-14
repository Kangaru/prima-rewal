ActiveAdmin.register Flatpage do
  config.clear_sidebar_sections!

  controller do
    helper :locale, :presenter

    protected
    def paginate(chain)
      super(chain).includes(:translations)
    end
  end


  index do
    column :title, sortable: false do |flatpage|
      present(flatpage) {|p| p.titles}
    end

    column :locales, sortable: false do |flatpage|
      present(flatpage) {|p| p.translated_to }
    end

    column :created_at do |flatpage|
      present(flatpage) {|p| p.created_at }
    end

    default_actions
  end

  form partial: 'form'

  show do |flatpage|
    attributes_table do
      row :title do
        present(flatpage) {|p| p.titles }
      end

      for_locales do |locale, _|
        row :"content_#{locale}"
      end

      row :created_at
      row :updated_at
    end
  end
end
