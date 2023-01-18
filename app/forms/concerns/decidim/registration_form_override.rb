# frozen_string_literal: true

module Decidim
  # This concern override the registration_form from decidim_core
  module RegistrationFormOverride
    extend ActiveSupport::Concern

    included do
      attribute :country, String
      validates :country, presence: true
    end
  end
end
