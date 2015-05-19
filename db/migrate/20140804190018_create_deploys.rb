class CreateDeploys < ActiveRecord::Migration
  def change
    create_table :deploys do |t|
      t.string :uid
      t.string :sha
      t.string :repository
      t.string :username
      t.string :project_uid
      t.string :environment
      t.datetime :time

      t.timestamps
    end
  end
end
