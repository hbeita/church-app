module Spa
  class PrayController < ApplicationController
    skip_before_action :authenticate_user!

    def new
    end
  end
end
