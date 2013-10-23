class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def create?
    if user.present?
      user.author? || user.editor?
    end
  end
  alias_method :update?, :create?
  alias_method :approved?, :create?
  alias_method :destroy?, :create?

  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.present? && (user.author? || user.editor?)
        scope.all
      else
        scope.where(:approved => true)
      end
    end
  end
end
