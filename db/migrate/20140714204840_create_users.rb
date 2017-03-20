=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id: false do |t|
      t.string :beeminder_token, null: false
      t.string :beeminder_user_id, null: false, primary: true, references: nil

      t.timestamps
    end
    add_index :users, :beeminder_user_id, unique: true
  end
end
