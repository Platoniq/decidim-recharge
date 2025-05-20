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
      "/app/views/layouts/decidim/_head_extra.html.erb" => "1b8237357754cf519f4e418135f78440",
      "/app/views/layouts/decidim/_logo.html.erb" => "9714a2447e07f302c499ff588253a2f2",
      "/app/views/layouts/decidim/footer/_main_social_media_links.html.erb" => "55465bee8d94bfef06d1e57202dae6b6",
      "/app/views/layouts/decidim/footer/_mini.html.erb" => "ccead2f5f20557ea4db1501de943f82b",
      "/app/cells/decidim/content_blocks/footer_sub_hero/show.erb" => "7cc7e6378786032a70e700a3273d1198",
      "/app/cells/decidim/content_blocks/sub_hero/show.erb" => "1624a0f9382010481af8c2b94bdd61fe",
      "/app/models/decidim/organization.rb" => "04eaf4467a1e0d891251c5cedf71f5e4" # add linkedin to social handlers
    }
  },
  {
    package: "decidim-admin",
    files: {
      "/app/commands/decidim/admin/update_organization.rb" => "6f02b3ece9f7039d5179360d42704469", # add linkedin to social handlers
      "/app/forms/decidim/admin/organization_form.rb" => "c6e3ae788446753454c45d8e1950517c" # add linkedin to social handlers
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
