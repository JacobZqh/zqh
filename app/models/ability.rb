class Ability
  include CanCan::Ability

  def initialize(worker)
    worker ||= Worker.new 
    #if worker.has_role?(:admin)
      can :manage, Worker
      can :manage, Role
    #end
  end
end
