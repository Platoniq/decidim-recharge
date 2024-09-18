# frozen_string_literal: true

require "rails_helper"

# We make sure that the checksum of the file overriden is the same
# as the expected. If this test fails, it means that the overriden
# file should be updated to match any change/bug fix introduced in the core
checksums = [
  {
    package: "decidim-core",
    files: {
      # layouts
      "/app/views/layouts/decidim/_head_extra.html.erb" => "1b8237357754cf519f4e418135f78440",
      "/app/views/layouts/decidim/_logo.html.erb" => "ab01dd1df9ce62cbd62f640a3b5018b2",
      "/app/views/layouts/decidim/_mini_footer.html.erb" => "5a842f3e880f24f49789ee2f72d96f60",
      "/app/views/layouts/decidim/_social_media_links.html.erb" => "497ce000e2e646fb4fba373961410252",
      "/app/cells/decidim/content_blocks/footer_sub_hero/show.erb" => "7cc7e6378786032a70e700a3273d1198",
      "/app/cells/decidim/content_blocks/sub_hero/show.erb" => "1624a0f9382010481af8c2b94bdd61fe",
      "/app/models/decidim/organization.rb" => "04eaf4467a1e0d891251c5cedf71f5e4"
    }
  },
  {
    package: "decidim-admin",
    files: {
      "/app/commands/decidim/admin/update_organization.rb" => "6f02b3ece9f7039d5179360d42704469",
      "/app/forms/decidim/admin/organization_form.rb" => "23d64335c187cbd8cd4db6524d48bfdc",
      "/app/models/decidim/organization.rb" => "04eaf4467a1e0d891251c5cedf71f5e4"
    }
  }
]

describe "Overriden files", type: :view do
  checksums.each do |item|
    spec = Gem::Specification.find_by_name(item[:package])

    item[:files].each do |file, signature|
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
