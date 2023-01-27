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
      "/app/cells/decidim/content_blocks/footer_sub_hero/show.erb" => "63cf57bc81b6e08523f3c31e7db7b1f4",
      "/app/cells/decidim/content_blocks/sub_hero/show.erb" => "528852634af98609d2069d0f126d04a2",
    },
  },
  {
    package: "decidim-extra_user_fields",
    files: {
      "/app/views/decidim/extra_user_fields/_profile_form.html.erb" => "d840e39f3d667b2dedddd165bfeec96e",
      "/app/views/decidim/extra_user_fields/_registration_form.html.erb" => "b36114438b39aeee66f945cb0fcd9cc1",
      "/app/views/decidim/extra_user_fields/admin/extra_user_fields/_form.html.erb" => "68aa08217eecd1117fad6942ab0a3703",
      "/app/forms/concerns/decidim/extra_user_fields/forms_definitions.rb" => "67532a39998eb0cac7f313eec915a2b1",
      "/app/forms/decidim/extra_user_fields/admin/extra_user_fields_form.rb" => "308415ba86b7753260418a533ffdd3df",
      "/app/commands/concerns/decidim/extra_user_fields/commands_overrides.rb" => "a849a1cf505801d57ca39df9c11ccbad",
      "/app/commands/decidim/extra_user_fields/admin/update_extra_user_fields.rb" => "bc6cd4528e845bcb029e5f811fcbc6ec",
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
