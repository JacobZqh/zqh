class RolifyCreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table(:roles) do |t|
      t.string :name
      t.string :display_name
      t.string :comment
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:workers_roles, :id => false) do |t|
      t.references :worker
      t.references :role
    end

    add_index(:roles, :name)
    add_index(:roles, [ :name, :resource_type, :resource_id ])
    add_index(:workers_roles, [ :worker_id, :role_id ])
  end
end
