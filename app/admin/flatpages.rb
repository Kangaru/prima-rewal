ActiveAdmin.register Flatpage do
  config.clear_sidebar_sections!
  config.paginate = false
  config.sort_order = 'position_asc'

  controller do
    helper :locale

    def scoped_collection
      end_of_association_chain.tap do |chain|
        return chain.includes(:translations) if chain.present?
      end
    end
  end

  collection_action :sort, method: :put do
    Flatpage.update_positions params[:ids]
    head 200
  end


  index do
    column :title, sortable: false do |flatpage|
      present(flatpage) {|p| p.sortable_titles }
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
