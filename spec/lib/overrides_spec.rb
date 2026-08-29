# frozen_string_literal: true

require "rails_helper"

# We make sure that the checksum of the file overridden is the same
# as the expected. If this test fails, it means that the overridden
# file should be updated to match any change/bug fix introduced in the core
checksums = [
  {
    package: "decidim-core",
    files: {
      # layouts
      "/app/views/layouts/decidim/_head_extra.html.erb" => "25642b423f3b3a1ac9c69bf558a6b791",
      "/app/views/layouts/decidim/_logo.html.erb" => "fbacc5a8c45d45be0bd4e42fbec40d8f",
      "/app/views/layouts/decidim/footer/_main_social_media_links.html.erb" => "5b57ccb9eefce8bf5a3d9ea44c3d67cd",
      "/app/views/layouts/decidim/footer/_mini.html.erb" => "ccead2f5f20557ea4db1501de943f82b",
      "/app/cells/decidim/content_blocks/footer_sub_hero/show.erb" => "035de9ede46f4aed34fb11352dde98c1",
      "/app/cells/decidim/content_blocks/sub_hero/show.erb" => "1624a0f9382010481af8c2b94bdd61fe",
      "/app/models/decidim/organization.rb" => "a72b9d9ef10aa06dbe5aef27c68d5c7a" # add linkedin to social handlers
    }
  },
  {
    package: "decidim-admin",
    files: {
      "/app/commands/decidim/admin/update_organization.rb" => "da5f7b5a8827d6fe0c29e9a62f6168dc", # add linkedin to social handlers
      "/app/forms/decidim/admin/organization_form.rb" => "ba762aec5192d9c363c724d4c5af945b" # add linkedin to social handlers
    }
  }
]

describe "Overridden files", type: :view do
  checksums.each do |item|
    spec = Gem::Specification.find_by_name(item[:package])

    item[:files].each do |file, signature|
      next unless spec

      it "#{spec.gem_dir}#{file} matches checksum" do
        expect(md5("#{spec.gem_dir}#{file}")).to eq(signature)
      end
    end
  end

  private

  def md5(file)
    Digest::MD5.hexdigest(File.read(file))
  end
end
