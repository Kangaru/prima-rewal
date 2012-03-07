ActiveAdmin.register User do
  menu label: I18n.t('admin.resources.user')

  actions :index, :new, :create, :destroy

  filter :email
  filter :created_at

  index do
    column :id
    column :email

    column :created_at, sortable: :created_at do |user|
      present(user) {|p| p.created_at}
    end

    default_actions
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
  #end
end
