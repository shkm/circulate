class CreateEmailTemplates < ActiveRecord::Migration[6.1]
  def change
    create_table :email_templates do |t|
      t.string :type, null: false
      t.string :subject
      t.string :title
      t.timestamps
    end
  end
end
