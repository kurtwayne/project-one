class Charge < ActiveRecord::Base
  belongs_to :user

# Upgrading and Downgrading Accounts

  def upgrade
    current_user.set_as_premium
    current_user.save

    privatewikis = current_user.wikis.where(private: false)
    privatewikis.each do |privatewiki|
      privatewiki.update_attributes(:private, true)
    end
  end

  def downgrade
    current_user.set_as_standard
    current_user.save

    privatewikis = current_user.wikis.where(private: true)
    privatewikis.each do |privatewiki|
      privatewiki.update_attributes(:private, false)
    end
  end
end
