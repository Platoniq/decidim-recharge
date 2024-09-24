# frozen_string_literal: true

require "rails_helper"

describe "Alternative landing" do
  let(:organization) { create(:organization) }
  let!(:user) { create(:user, :admin, :confirmed, organization:) }

  before do
    switch_to_host(organization.host)
    login_as user, scope: :user
    visit decidim_admin.edit_organization_homepage_path
  end

  it "renders all alternative landing content blocks" do
      click_on "Add content block"
      expect(page).to have_content("Upcoming meetings (Alternative)")
  end
end
