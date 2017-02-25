class AddVerifyToCredential < ActiveRecord::Migration[5.0]
  def change
    add_column :credentials, :verification_code, :string, null: false, default: ""
  end
end
