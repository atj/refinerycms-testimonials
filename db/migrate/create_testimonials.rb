class CreateTestimonials < ActiveRecord::Migration

  def self.up
    create_table :testimonials do |t|
      t.text :quote
      t.string :name
      t.string :company
      t.string :job_title
      t.string :website
      t.date :quoted_on
      t.integer :position
      t.integer :position

      t.timestamps
    end

    add_index :testimonials, :id

    load(Rails.root.join('db', 'seeds', 'testimonials.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "testimonials"})

    Page.delete_all({:link_url => "/testimonials"})

    drop_table :testimonials
  end

end
