class UserPolicy < ApplicationPolicy
  
  def new?
     user.full_access?
  end
  
  def index?

    user.full_access?

  end
  

  
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
