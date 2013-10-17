class ChangeSocialContributionToUnlimitiedTextInCauses < ActiveRecord::Migration
  def change
    change_column :causes, :social_contribution, :text, :limit => nil
  end
end
