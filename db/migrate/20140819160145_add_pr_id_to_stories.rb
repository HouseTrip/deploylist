class AddPrIdToStories < ActiveRecord::Migration
  def change
    add_column :stories, :pull_request_uid, :string
    rename_column :stories, :uid, :pivotal_uid
  end
end
