

RailsAdmin.config do |c|
  c.authenticate_with {}
  c.current_user_method { User.first }
  c.authorize_with {}
  c.audit_with :history, User
  
  c.model PaymentType do
    list do
      field :name
      field :created_at
      field :updated_at
    end
    
    create do
    	fields :name
    end
    
    edit do
    	fields :name
    end

  end
  

end