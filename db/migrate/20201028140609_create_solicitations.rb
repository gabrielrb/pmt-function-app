class CreateSolicitations < ActiveRecord::Migration[6.0]
  def change
    create_table :solicitations do |t|
      t.integer :loan_amount
      t.integer :number_of_installments
      t.integer :installment_amount
      t.boolean :pending, default: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
