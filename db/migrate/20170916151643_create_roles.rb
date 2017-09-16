class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.string :type
      t.belongs_to :user, foreign_key: true
      t.belongs_to :account, foreign_key: true

      t.timestamps
    end
  end
end
