class RegisterController < ApplicationController
  @@id = 0
	
  def index
    @preference = Preference.new
    @@id=0
  end

  def create
    @preference = Preference.new(preference_params)
   
      respond_to do |format|
        if @preference.save
	  @@id = @preference.id
          format.html { redirect_to @preference, notice: 'Preference was successfully created.' }
          format.json { render :show, status: :created, location: @preference }
        
        else
          format.html { render :index }
          format.json { render json: @preference.errors, status: :unprocessable_entity }
        end
      end
     
   end

  def show
    @customer = Customer.new

		
  end

  def registerCustomer
    
      @customer = Customer.new(params.require(:customer).permit(:email, :password))
      @customer.preference_id = @@id

      if @customer.save
      else 
           if((Preference.where(@@id).empty?) != true)
	      Preference.find(@@id).destroy
	      render :show
              # render json: @customer.errors, status: :unprocessable_entity  
           end
      end	
    
    	
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def preference_params
      params.require(:preference).permit(:primaryStyle, :secondaryStyle, :size, :height, :shoeSize)
    end

end
