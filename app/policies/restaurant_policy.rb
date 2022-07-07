class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
    def resolve
      scope.all
      # Ex:- scope :active, -> {where(:active => true)}
    end
  end

  def show?
    true
  end

  def update?
    # Only restaurant owner can update it

    record.user == user
  end

  def create?
    # Any logged in user can create a restaurant
    !user.nil?
  end

  def destroy?
    update?
  end

end
