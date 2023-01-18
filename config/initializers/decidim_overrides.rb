# frozen_string_literal: true

Rails.application.config.to_prepare do
  Decidim::RegistrationForm.include(Decidim::RegistrationFormOverride)
  Decidim::CreateRegistration.include(Decidim::CreateRegistrationOverride)
  Decidim::AccountForm.include(Decidim::AccountFormOverride)
  Decidim::UpdateAccount.include(Decidim::UpdateAccountOverride)
end
