class AddSizeToCrochetPatterns < ActiveRecord::Migration
  def change
    change_table :crochet_patterns do |t|
      t.string :size
    end
  end
end
