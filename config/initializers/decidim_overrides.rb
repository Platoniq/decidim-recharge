# frozen_string_literal: true

Rails.application.config.to_prepare do
  # Include linkedin in the list of social handlers
  original_social_handlers = Decidim::Organization::SOCIAL_HANDLERS
  Decidim::Organization.send(:remove_const, :SOCIAL_HANDLERS) if Decidim::Organization.const_defined?(:SOCIAL_HANDLERS)
  Decidim::Organization.const_set(:SOCIAL_HANDLERS, (original_social_handlers + [:linkedin]).freeze)

  # Other overrides
  Decidim::Admin::UpdateOrganization.include(Decidim::Admin::UpdateOrganizationOverride)
  Decidim::Admin::OrganizationForm.include(Decidim::Admin::OrganizationFormOverride)
end
