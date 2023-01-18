# frozen_string_literal: true

module Decidim
  # This concern override the update_account file from decidim_core
  module UpdateAccountOverride
    extend ActiveSupport::Concern
    included do
      def update_personal_data
        @user.locale = @form.locale
        @user.name = @form.name
        @user.nickname = @form.nickname
        @user.email = @form.email
        @user.personal_url = @form.personal_url
        @user.about = @form.about
        @user.country = @form.country
      end
    end
  end
end
