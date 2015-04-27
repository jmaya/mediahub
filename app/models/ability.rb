class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      if user.enabled?
        can :read, :all
      else
        cannot :read, :all
      end
    end


  end
end
