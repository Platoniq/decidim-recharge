# frozen_string_literal: true

require "rails_helper"

describe "Alternative landing", type: :system do
  let(:organization) { create :organization }
  let!(:user) { create(:user, :admin, :confirmed, organization: organization) }

  before do
    switch_to_host(organization.host)
    login_as user, scope: :user
    visit decidim_admin.edit_organization_homepage_path
  end

  it "shows content blocks from alternative landing" do
    within ".js-list-availables" do
      expect(page).to have_text("Upcoming meetings (Alternative)")
    end
  end
end
