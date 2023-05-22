# frozen_string_literal: true

body = { en: "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p><iframe class=\"ql-video\" frameborder=\"0\" allowfullscreen=\"true\" src=\"https://youtu.be/dQw4w9WgXcQ\" data-accessibility-violation=\"true\"></iframe>", it: "" }

require "rails_helper"

describe "Post with Iframe", type: :system do
  let(:post) { create :post, body: body }
  let(:component) { Decidim::Component.find(post.decidim_component_id) }
  let(:organization) { component.participatory_space.organization }
  let(:slug) { component.participatory_space.slug }

  before do
    switch_to_host(organization.host)
    visit decidim.root_path
    page.execute_script("$('#dc-modal-accept').click()")
    visit "/processes/#{slug}/f/#{component.id}/posts/#{post.id}"
  end

  it "shows the iframe" do
    expect(page).to have_selector('iframe[src="https://youtu.be/dQw4w9WgXcQ"]')
  end
end
