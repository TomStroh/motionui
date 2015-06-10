class BeepController < ApplicationController
  before_action :beep_params, only:[:update]
  attr_accessor :beep

#function to update beep_value
  def update
    Beep_value.update(beep_params)
    redirect_to :back
  end

#function to show beep_value 
  def show
    $beep = Beep_value.show
  end

  private
    def beep_params
      params.require(:beep_value)
    end
end
