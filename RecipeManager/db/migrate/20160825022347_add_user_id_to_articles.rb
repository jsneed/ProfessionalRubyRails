class AddUserIdToArticles < ActiveRecord::Migration[5.0]
  def change
      #since we created association in model layer infers this is a foreign key relationship
      add_column :articles, :user_id, :integer
  end
end
