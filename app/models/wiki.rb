class Wiki < ActiveRecord::Base
  belongs_to :user

  def published?
  end
end
