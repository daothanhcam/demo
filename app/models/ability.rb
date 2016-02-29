class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new

    case user.role
    when "super admin"
      can :access, :rails_admin   # grant access to rails_admin
      can :dashboard              # grant access to the dashboard
      can :manage, :all
    when "publisher"
      can :access, :rails_admin   # grant access to rails_admin
      can :dashboard              # grant access to the dashboard
      can :read, :post
      can :update, :post, :user_id => user.id
    when "member"
    end
  end
end
