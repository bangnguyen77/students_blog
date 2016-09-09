class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.column :text, :string
      t.column :user, :string
      t.column :article_id, :integer

      t.timestamps
    end
  end
end
