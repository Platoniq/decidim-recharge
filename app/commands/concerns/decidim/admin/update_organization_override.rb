# frozen_string_literal: true

module Decidim
  module Admin
    module UpdateOrganizationOverride
      extend ActiveSupport::Concern

      included do
        def attributes
          {
            name: form.name,
            default_locale: form.default_locale,
            reference_prefix: form.reference_prefix,
            time_zone: form.time_zone,
            twitter_handler: form.twitter_handler,
            facebook_handler: form.facebook_handler,
            instagram_handler: form.instagram_handler,
            youtube_handler: form.youtube_handler,
            linkedin_handler: form.linkedin_handler,
            github_handler: form.github_handler,
            badges_enabled: form.badges_enabled,
            user_groups_enabled: form.user_groups_enabled,
            comments_max_length: form.comments_max_length,
            enable_machine_translations: form.enable_machine_translations,
            admin_terms_of_service_body: form.admin_terms_of_service_body,
            rich_text_editor_in_public_views: form.rich_text_editor_in_public_views,
            enable_participatory_space_filters: form.enable_participatory_space_filters
          }.merge(welcome_notification_attributes)
            .merge(machine_translation_attributes || {})
        end
      end
    end
  end
end
