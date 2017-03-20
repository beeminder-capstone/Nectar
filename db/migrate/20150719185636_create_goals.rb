=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end
class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.references :provider, null: false
      t.string :slug, null: false
      t.float :last_value
    end
    add_index :goals, [:slug, :provider_id], unique: true
  end
end
