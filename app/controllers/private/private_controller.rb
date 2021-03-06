class Private::PrivateController < ApplicationController
  before_action :authenticate_user!
end