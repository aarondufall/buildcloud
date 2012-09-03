class RenameCreatedByColumnToCreatedById < ActiveRecord::Migration
  def up
  	rename_column :issues, :created_by, :created_by_id
  end

  def down
  end
end
