=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end

class RemoveBeeminderTokenFromUsersTable < ActiveRecord::Migration
  def change
    User.all.each do |u|
      Credential.create!(
        beeminder_user_id: u.beeminder_user_id,
        provider_name: :beeminder,
        uid: u.beeminder_user_id,
        credentials: {
          "token" => u.beeminder_token
        }
      )
    end
    remove_column :users, :beeminder_token
  end
end
