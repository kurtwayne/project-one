class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki

  def admin_list?
    user.admin?
  end

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def update?
    user.admin? or not post.published?
  end
end
