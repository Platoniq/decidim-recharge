# frozen_string_literal: true

require "rails_helper"

describe "post with iframe", type: :system do
  include_context "with a component"
  let(:manifest_name) { "blogs" }
  let(:body) { { en: "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p><iframe class=\"ql-video\" frameborder=\"0\" allowfullscreen=\"true\" src=\"https://youtu.be/dQw4w9WgXcQ\" data-accessibility-violation=\"true\"></iframe>" } }
  let(:title) { { en: "Blog post title" } }
  let(:post) { create :post, component: component, body: body, title: title }

  before do
    visit_component
    page.execute_script("$('#dc-modal-accept').click()")
    visit Decidim::ResourceLocatorPresenter.new(post).path
  end

  it "shows the iframe" do
    expect(page).to have_selector('iframe[src="https://youtu.be/dQw4w9WgXcQ"]')
  end
end
