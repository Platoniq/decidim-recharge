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
      "/app/cells/decidim/content_blocks/footer_sub_hero/show.erb" => "34475b7db4216b7d920cd72bff4771c7",
      "/app/cells/decidim/content_blocks/sub_hero/show.erb" => "d4802c6523f6e5b40af6f6e3769afba8",
      "/app/models/decidim/organization.rb" => "e0b67b906f0ad3db84226914f07a05e7"
    }
  },
  {
    package: "decidim-admin",
    files: {
      "/app/commands/decidim/admin/update_organization.rb" => "8ed4358723b204274310afbd40f151df",
      "/app/forms/decidim/admin/organization_form.rb" => "edb36b620d4d27e2e8d01ecee1dd0d2e"
    }
  }
]

describe "Overriden files", type: :view do
  # rubocop:disable Rails/DynamicFindBy
  checksums.each do |item|
    spec = ::Gem::Specification.find_by_name(item[:package])

    item[:files].each do |file, signature|
      it "#{spec.gem_dir}#{file} matches checksum" do
        expect(md5("#{spec.gem_dir}#{file}")).to eq(signature)
      end
    end
  end
  # rubocop:enable Rails/DynamicFindBy

  private

  def md5(file)
    Digest::MD5.hexdigest(File.read(file))
  end
end
