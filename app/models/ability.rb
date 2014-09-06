class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new #guest

    if user.role? :member
        can :manage, Post, :user_id => user.id
        can :manage, Favorite, user_id: user.id
        can :create, Vote
    end

    #Moderators can manage churches
    if user.role? :moderator
        can :manage, Church
    end

    #Admins can do anything
    if user.role? :admin
        can :manage, :all
    end

    can :read, :all

  end

end
