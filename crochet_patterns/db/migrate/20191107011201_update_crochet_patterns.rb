class UpdateCrochetPatterns < ActiveRecord::Migration
  def change
    change_table :crochet_patterns do |t|
      t.string :link
    end
  end
end
