class Alchemy::EssenceMailupList < ActiveRecord::Base
  acts_as_essence ingredient_column: 'list_id',
                  preview_text_method: 'name'
end
