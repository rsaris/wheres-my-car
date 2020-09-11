# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      ## Rememberable
      t.datetime :remember_created_at

      ## Omniauthable
      t.string :provider, null: false
      t.string :uid, null: false
    end
  end
end
