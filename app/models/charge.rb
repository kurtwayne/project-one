class Charge < ActiveRecord::Base
  belongs_to :user

# Upgrading and Downgrading Accounts

  def upgrade
    current_user.update_attributes(role: "premium")
  end

  def downgrade
  subscription = current_user.subscription

    if subscription.delete
      downgrade_user_to_standard
      current_user_downgrade_wikis
      flash[:success] = "Successfully cancelled premium subscription"
      redirect_to root_path
    else
      flash[:error] = "Can't cancel at this moment."
      redirect_to root_path
    end
  end

  def downgrade_user_to_standard
    current_user.update_attributes(role: "standard")
  end

  def current_user_downgrade_wikis
    privatewikis = current_user.wikis.where(private: true)
    privatewikis.each do |privatewikis|
      privatewikis.update_attributes(:private, false)
    end
  end
end
