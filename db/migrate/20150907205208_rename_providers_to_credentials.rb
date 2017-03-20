=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end

class RenameProvidersToCredentials < ActiveRecord::Migration
  def change
    rename_table :providers, :credentials
    rename_column :goals, :provider_id, :credential_id
    rename_column :credentials, :name, :provider_name
  end
end
