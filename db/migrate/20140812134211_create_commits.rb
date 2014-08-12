class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.text :message
      t.string :sha
      t.string :author
      t.datetime :date
      t.references :deploy

      t.timestamps
    end
  end
end
