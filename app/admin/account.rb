ActiveAdmin.register User, as: 'Account' do
  menu label: I18n.t('admin.resources.account'), parent: I18n.t('admin.resources.user')

  actions :edit, :update


  controller do
    def redirect_to_edit
      redirect_to edit_admin_account_path current_user
    end

    alias_method :index, :redirect_to_edit
    alias_method :show,  :redirect_to_edit
  end

  form partial: 'form'

  #form do |f|
  #  f.inputs do
  #    f.input :email
  #    f.input :password
  #    f.input :password_confirmation
  #  end
  #
  #  f.buttons
  #  #
  #  #f.actions do
  #  #  f.action :submit
  #  #end
  #  #f.buttons
  #end
end
