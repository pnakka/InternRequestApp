namespace :InternRequestApp do
  namespace :db_management do

    require File.join(
      File.expand_path(File.dirname(__FILE__)),
      '../support/logging_and_reporting'
    )



    require 'rubygems'
    require "csv"
    
    
    
    
    
    
    desc "Import Agency name from a csv file and create it in database."
    task :import_agency_name => [:environment] do
    
      begin
    
        # Note: initialize_variables function has to be the first statement to create the log instance for logging
        #initialize_variables
    
        puts "\n\n Starting task: import_agency_name ....\n\n"
    
            
    
        data_file_path = File.join(File.expand_path(File.dirname(__FILE__)),
          '/data_file/Agencies.csv')
    
          
    
        # read in the data file
        CSV.foreach(data_file_path) do |row|
    
    
          #order of column in the csv file is as followed:
          #Agency Name
            
    
          Agency_name = row[0]
            
          if Agency_name == nil
    
            Agency_name = ""
                
          end
              
              
              
          county_name = row[1]
	                  
          if county_name == nil

            county_name = ""
          end
    

              
          #find the county
          county = County.find(:first,
            :conditions => ["CountyName = ?", county_name])
                
          #find the agency
          agency = Agency.where("AgencyName = :search", {:search => Agency_name}).first
              
              
                  
                 
          unless agency != nil
              
            #create an object
            agency = Agency.new
	          
          end
    
 

          if agency != nil
    
            agency.AgencyName = Agency_name ;
           
            begin
              puts "Updating agency #{Agency_name} name in database."
              agency.save!
    
    
            rescue
              puts "Error ! User #{Agency_name} can not be updated in database."
            end
               
          end
    
                
                
          #update County agency
               
          if county != nil
               
            county.agencies << agency
                 
                 
            begin
              puts "Updating county #{county_name}'s name in database."
              county.save!


            rescue
              puts "Error ! County #{county_name} can not be updated in database."
            end
                 
          end
                 
                 
               
    
          # csv block
        end
    
    
    
            
        #begin
      rescue Exception => e
	  
	          
        # log the error
        puts e.message
          
      end
    
      #task
    end
    
    
     
    
    
    
        
    desc "Import County name from a csv file and create it in database."
    task :import_county_name => [:environment] do
    
      begin
    
        # Note: initialize_variables function has to be the first statement to create the log instance for logging
        #initialize_variables
    
        puts "\n\n Starting task: import_county_name ....\n\n"
    
    
    
        data_file_path = File.join(File.expand_path(File.dirname(__FILE__)),
          '/data_file/county_names.csv')

        puts "\nFile path: #{data_file_path}"
    
    
        # read in the data file
        CSV.foreach(data_file_path) do |row|
    
    
          #order of column in the csv file is as followed:
          #Agency Name
    
    
          county_name = row[0]
    
          if county_name == nil
    
            county_name = ""
          end
    
    
    
          #find the county
          county = County.find(:first,
    	      :conditions => ["CountyName = ?",  county_name])
    	      
    	      
    	      
          unless county != nil
            #create an object
            county = County.new
    
          end
    
    
          #update County
    
          if county != nil
    
            county.CountyName = county_name
    
    
            begin
              puts "Updating county #{county_name} name in database."
              county.save!


            rescue
              puts "Error ! County #{county_name} can not be updated in database."
            end
	     
          end
    
    
    
    
          # csv block
        end
    
    
    
    
        #begin
      rescue Exception => e
	  	  
	  	          
        # puts the error
        puts e.message
	            
      end
          
    
      #task
    end
 
  





     
    desc "Import Status name from a csv file and create it in database."
    task :import_status_name => [:environment] do
    
      begin
    
        # Note: initialize_variables function has to be the first statement to create the log instance for logging
        #initialize_variables
    
        puts "\n\n Starting task: import_status_name ....\n\n"
    
    
    
        data_file_path = File.join(File.expand_path(File.dirname(__FILE__)),
          '/data_file/Status_names.csv')

        puts "\nFile path: #{data_file_path}"
    
    
        # read in the data file
        CSV.foreach(data_file_path) do |row|
    
    
          #order of column in the csv file is as followed:
          #Agency Name
    
    
          status_name = row[0]
    
          if status_name == nil
    
            status_name = ""
          end
    
    
    
          #find the status
          status= Status.find(:first,
    	      :conditions => ["StatusDescription = ?",  status_name])
    	      
    	      
    	      
          unless status != nil
            #create an object
            status = Status.new
    
          end
    
    
          #update Status
    
          if status != nil
    
            status.StatusDescription = status_name
    
    
            begin
              puts "Updating status #{status_name} name in database."
              status.save!


            rescue
              puts "Error ! Status #{status_name} can not be updated in database."
            end
	     
          end
    
    
    
    
          # csv block
        end
    
    
    
    
        #begin
      rescue Exception => e
	  	  
	  	          
        # puts the error
        puts e.message
	            
      end
          
    
      #task
    end
 
  

  end
end
