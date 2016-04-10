class WikiPolicy < ApplicationPolicy
  attr_reader :user, :scope, :wiki

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

  def resolve
       wikis = []
       if user.role == 'admin'
         wikis = scope.all # if the user is an admin, show them all the wikis
       elsif user.role == 'premium'
         all_wikis = scope.all
         all_wikis.each do |wiki|
           if wiki.public? || wiki.owner == user || wiki.collaborators.include?(user)
             wikis << wiki # if the user is premium, only show them public wikis, or that private wikis they created, or private wikis they are a collaborator on
           end
         end
       else # this is the lowly standard user
         all_wikis = scope.all
         wikis = []
         all_wikis.each do |wiki|
           if wiki.public? || wiki.collaborators.include?(user)
             wikis << wiki # only show standard users public wikis and private wikis they are a collaborator on
           end
         end
       end
       wikis # return the wikis array we've built up
     end
end
