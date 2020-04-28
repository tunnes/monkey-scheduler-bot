class CreateMonkeys < ActiveRecord::Migration[6.0]
  def change
    create_table :monkeys do |t|

      t.timestamps
    end
  end
end
