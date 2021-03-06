class PagesController < ApplicationController

  skip_before_action :verify_authenticity_token, only: :get_gift_post

  def root

  end

  def get_gift

  end

  def get_gift_post
    redirect_to public_gifts_path(params[:access_key])
  end
end