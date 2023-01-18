# frozen_string_literal: true

module Decidim
  # This concern override the create_registration file from decidim_core
  module CreateRegistrationOverride
    extend ActiveSupport::Concern

    included do
      # rubocop:disable Metrics/AbcSize
      # rubocop:disable Metrics/MethodLength
      def create_user
        @user = User.create!(
          email: form.email,
          name: form.name,
          nickname: form.nickname,
          password: form.password,
          password_confirmation: form.password_confirmation,
          organization: form.current_organization,
          tos_agreement: form.tos_agreement,
          newsletter_notifications_at: form.newsletter_at,
          email_on_notification: true,
          accepted_tos_version: form.current_organization.tos_version,
          locale: form.current_locale,
          country: form.country
        )
      end
      # rubocop:enable Metrics/AbcSize
      # rubocop:enable Metrics/MethodLength
    end
  end
end
