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

  def update?
    if user.present?
      #return true if current.ip == comment.user_ip
      user.editor?
    end
  end

  def destroy?
    if user.present?
      return true if user.editor?
    end
  end

  def approved?
    if user.present?
      user.editor?
    end
  end

  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.present? && user.editor?
        scope.all
      elsif user.present? && user.author?
        scope.where(:author_id => user.id) | scope.approved
      else
        scope.where(:approved => true)
      end
    end
  end
end
