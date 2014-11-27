class RegisterController < ApplicationController
  cattr_accessor :id
  @@id = 0

  before_action :set_Customer, only: [:show]
  before_action :set_Preference, only: [:index]
	
  def index
    #@preference = Preference.new
    #@@id=0
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
    #@customer = Customer.new
		
  end

  def registerCustomer

      if Preference.exists?(:id => @@id)

         @customer = Customer.new(params.require(:customer).permit(:email, :password))
         @customer.preference_id = @@id

         if @customer.save
            preference = Preference.find(@@id)
            preference.customer_id = @customer.id
            preference.save
            @@id=0
         else 
        #if(Preference.where(@@id).empty? == true) <-- this doesn't work from here for some reason (most likely because of the delay in 			linking)
      	#if(@@id !=-1)
	#      Preference.find(@@id).destroy      
	 #     @@id = -1		  
              # render json: @customer.errors, status: :unprocessable_entity  
        #end
        #@preference = Preference.new
        #@@id=0
           render :show 
           
         end	
      else
  	  set_Preference
	    render :index
      end
    	
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def preference_params
      params.require(:preference).permit(:primaryStyle, :secondaryStyle, :size, :height, :shoeSize)
    end
    

    def set_Preference
       @preference = Preference.new
       @@id=0
    end

    def set_Customer
       @customer = Customer.new
    end

end	
