class Preference < ActiveRecord::Base
    validates_presence_of :main_style
	belongs_to :customer

	def main_style=(value)

	   if "Suits".eql? value
	       write_attribute(:main_style, value)
       elsif "Sports".eql? value
       	  write_attribute(:main_style, value)
       elsif "Casual".eql? value
 		  write_attribute(:main_style, value)
	   end
       
    
    end
      
end
