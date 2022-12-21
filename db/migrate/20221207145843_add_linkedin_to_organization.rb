class AddLinkedinToOrganization < ActiveRecord::Migration[6.0]
  def change
    add_column :decidim_organizations, :linkedin_handler, :string
  end
end
