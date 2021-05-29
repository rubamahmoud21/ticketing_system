class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :ticket_statuses do |t|
      t.string :name
    end
    
    create_table :tickets do |t|
      t.string :title
      t.text :descrition
      t.references :ticket_status
      t.references :project
      t.timestamps
    end
  end
end
