class PurgeController < ApplicationController

before_action :purge_params, only:[:update]

def update
  Purge_time.update(purge_params)
end

def show
  @purge_time = Purge_time.show
end

private
  def purge_params
    params.require(:days_to_purge)
  end

end
