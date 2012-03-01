

RailsAdmin.config do |c|
  c.authenticate_with {}
  c.current_user_method { User.first }
  c.authorize_with {}
  c.audit_with :history, User
end