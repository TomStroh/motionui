class BeepController < ApplicationController
  before_action :beep_params, only:[:update]
  attr_accessor :beep

  def update
    Beep_value.update(beep_params)
    redirect_to :back
  end

  def show
    $beep = Beep_value.show
  end

  private
    def beep_params
      params.require(:beep_value)
    end
end
