# frozen_string_literal: true

module Decidim
  module Admin
    module OrganizationFormOverride
      extend ActiveSupport::Concern

      included do
        attribute :linkedin_handler, String
      end
    end
  end
end
