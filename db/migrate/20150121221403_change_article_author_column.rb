class ChangeArticleAuthorColumn < ActiveRecord::Migration
  def change
    change_column :articles, :author,  :string
  end
end
