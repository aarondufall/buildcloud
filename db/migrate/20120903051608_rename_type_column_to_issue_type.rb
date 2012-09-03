class RenameTypeColumnToIssueType < ActiveRecord::Migration
  def up
  	rename_column :issues, :type, :issue_type
  end

  def down
  end
end
