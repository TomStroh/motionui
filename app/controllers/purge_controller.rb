class PurgeController < ApplicationController

before_action :purge_params, only:[:update]

#update value purge (logic in model Purge_time)
def update
  Purge_time.update(purge_params)
  redirect_to :back
end

#show purge time (logic in model Purge_time)
def show
  $purge_time = Purge_time.show
end

private
  def purge_params
    params.require(:days_to_purge)
  end

end
