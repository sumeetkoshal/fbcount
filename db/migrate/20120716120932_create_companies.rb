class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, :limit => 25, :primary=>true, :null => false
      t.string :url, :limit => 255, :null => false
      t.string :facebookid, :limit => 100, :unique=>true, :null => false
      t.string :description, :limit => 255, :null => false
      t.integer :likecount, :default=>0, :null => false
      t.timestamps
    end
  end
end
