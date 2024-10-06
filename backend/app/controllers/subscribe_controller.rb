# frozen_string_literal: true

class SubscribeController < ApplicationController
  def create
    # nickname = params[:nickname]
    # email = params[:email]

    # Process the subscription (e.g., save to the database or send a confirmation email)

    redirect_to root_path, notice: I18n.t('notice.subscribed')
  end
end
