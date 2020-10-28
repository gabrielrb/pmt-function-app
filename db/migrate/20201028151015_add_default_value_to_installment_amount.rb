class AddDefaultValueToInstallmentAmount < ActiveRecord::Migration[6.0]
  def change
    change_column :solicitations, :installment_amount, :float, default: nil
  end
end
