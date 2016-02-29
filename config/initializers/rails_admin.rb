RailsAdmin.config do |config|
  config.main_app_name = ["Demo rails_admin"]
  config.model Post do
     edit do
       field :title
       field :content, :ck_editor
     end

     list do
       field :id
       field :title
       field :content do
         pretty_value do
           value = "..."
         end
       end
       field :post_type
       field :view
       field :created_at
       field :updated_at
     end

     show do
       field :id
       field :title
       field :content do
        formatted_value do
           value.html_safe
         end
       end
       field :post_type
       field :view
       field :created_at
       field :updated_at
     end
  end

  config.model User do
    list do
      field :id
      field :email
      field :name
      field :role
      field :sign_in_count
      field :last_sign_in_at
      field :last_sign_in_ip
      field :created_at
      field :updated_at
    end

    show do
      field :id
      field :email
      field :name
      field :role
      field :sign_in_count
      field :current_sign_in_at
      field :current_sign_in_ip
      field :last_sign_in_at
      field :last_sign_in_ip
      field :created_at
      field :updated_at
    end
  end

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
