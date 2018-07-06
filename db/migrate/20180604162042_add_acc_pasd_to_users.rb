class AddAccPasdToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column(:users,:account,:string)
  	add_column(:users,:password,:string)
  end
end
