# This migration comes from alchemy_kono_mailup (originally 20171127105007)
class CreateAlchemyKonoMailupAlchemyEssenceMailupLists < ActiveRecord::Migration[5.1]
  def change

    create_table :alchemy_essence_mailup_lists do |t|
      t.integer  "list_id"

      t.integer  "creator_id"
      t.integer  "updater_id"

      t.timestamps
    end
  end
end
