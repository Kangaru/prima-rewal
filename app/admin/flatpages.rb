ActiveAdmin.register Flatpage do
  menu label: I18n.t('admin.resources.flatpage')

  actions :index, :new, :create, :edit, :update, :destroy

  config.sort_order = 'position_asc'
  config.paginate = false
  config.clear_sidebar_sections!


  index do
    column :title, sortable: false do |flatpage|
      present(flatpage) {|p| p.sortable_titles }
    end

    default_actions
  end

  form partial: 'form'


  controller do
    helper :locale
    cache_sweeper :flatpage_sweeper

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


  #== Reset gallery cache
  action_item only: :index do
    link_to t('admin.flatpages.action_item.expire_gallery'), expire_gallery_admin_flatpages_path, method: :post
  end

  collection_action :expire_gallery, method: :post do
    FacebookSweeper.expire_gallery_cache!
    redirect_to :back, notice: t('admin.flatpages.expire_gallery.expired')
  end
  #== Reset gallery cache


  #== Reset carousel cache
  action_item only: :index do
    link_to t('admin.flatpages.action_item.expire_carousel'), expire_carousel_admin_flatpages_path, method: :post
  end

  collection_action :expire_carousel, as: :expire_carousel, method: :post do
    FacebookSweeper.expire_carousel_cache!
    redirect_to :back, notice: t('admin.flatpages.expire_carousel.expired')
  end
  #== Reset carousel cache
end
