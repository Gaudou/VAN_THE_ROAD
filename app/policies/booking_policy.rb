class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

    def destroy?
      record.user == user
    end

    # def new?
    #   return true
    # end

    def create?
      return true
    end

    def accept?
      record.van.user == user
    end

    def decline?
      record.van.user == user
    end
end
