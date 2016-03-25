class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki

  def admin_list?
    user.admin?
  end

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def create?
    puts "wheeeeeee"
    true unless user.nil?
  end

  def update?
    user.admin? or not post.published?
    return false unless user.admin? or user.premium?
    return false if wiki.published?
    true
  end

  def destroy?
    return false unless user.admin?
    return false if wiki.published?
    true
  end

  def publish?
    true
  end
end
