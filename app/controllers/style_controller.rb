class StyleController < ApplicationController

  def index
		@preference = Preference.new
  end

  def create
		@preference = Preference.new(preference_params)

		respond_to do |format|
      if @preference.save
        format.html { redirect_to @preference, notice: 'Preference is set.' }
        format.json { render :show, status: :ok, location: @preference }
      else
        format.html { render :create }
        format.json { render json: @preference.errors, status: :unprocessable_entity }
      end
		end
	end

	def show
		
  end

	private

  	# Never trust parameters from the scary internet, only allow the white list through.
  	def preference_params
  		params.require(:preference).permit(:primaryStyle, :secondaryStyle, :size, :height, :shoeSize)
  	end
end
