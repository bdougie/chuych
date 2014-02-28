class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new #guest

    if user.role? :member
        can :manage, Post, :user_id => user.id
    end

    #Moderators can manage churches
    If user.role ? :moderator
        can :manage, Comment
    end

    #Admins can do anything
    if user.role? :admin
        can :manage, :all
    end

    can :read, :all
    
  end
end
