class CreateSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :subjects do |t|
      t.column :name, :string
      t.timestamps
    end
    Subject.create name: 'Physics'
    Subject.create name: 'Mathematics'
    Subject.create name: 'Chemistry'
    Subject.create name: 'Psychology'
    Subject.create name: 'Geography'
  end
  def self.down
    drop_table :subjects
  end
end
