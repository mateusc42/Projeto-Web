class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new(role: 3)
    if user.superadmin?
      can :manage, :all
    elsif user.admin?
      can :create, Post
      can :create, Comment
      can [:update, :destroy], Post, {user_id: user.id}
      can [:update, :destroy], Comment, {user_id: user.id}
      can [:read, :myposts], :all
    elsif user.user?
      can :create, Comment
      can [:update, :destroy], Comment, {user_id: user.id}
      can :read, :all
    else
      can :read, :all
    end
  end
end
