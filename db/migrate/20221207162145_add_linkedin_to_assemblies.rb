class AddLinkedinToAssemblies < ActiveRecord::Migration[6.0]
  def change
    add_column :decidim_assemblies, :linkedin_handler, :string
  end
end
