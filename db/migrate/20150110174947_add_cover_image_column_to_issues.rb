class AddCoverImageColumnToIssues < ActiveRecord::Migration
  def change
      add_attachment :issues, :cover_image
  end
end
