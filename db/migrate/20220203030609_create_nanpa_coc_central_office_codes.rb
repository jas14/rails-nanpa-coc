# frozen_string_literal: true

class CreateNanpaCocCentralOfficeCodes < ActiveRecord::Migration[6.1]
  def change
    create_table :nanpa_coc_central_office_codes do |t|
      t.string :npa_nxx, limit: 6, index: { unique: true }
      t.string :state, limit: 2
      t.string :rate_center
      t.integer :ocn
      t.string :company, null: false

      t.integer :initial_growth, limit: 1
      t.boolean :pooled
      t.boolean :in_service

      t.date :effective_date
      t.date :assign_date

      t.timestamps
    end
  end
end
