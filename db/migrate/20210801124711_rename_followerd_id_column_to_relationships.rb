class RenameFollowerdIdColumnToRelationships < ActiveRecord::Migration[5.2]
  def change
        rename_column :relationships, :followerd_id, :followed_id
  end
end
