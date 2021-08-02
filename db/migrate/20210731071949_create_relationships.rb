class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|

      t.timestamps
      t.integer :follower_id
      t.integer :followerd_id

    end
  end
end
