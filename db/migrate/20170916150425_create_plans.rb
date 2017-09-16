class CreatePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :plans do |t|
      t.string :title
      t.integer :max_number_of_repos

      t.timestamps
    end
  end
end
