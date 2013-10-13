namespace :InternRequestApp do
  namespace :db_management do

    require File.join(
    File.expand_path(File.dirname(__FILE__)),
    '../support/logging_and_reporting'
    )

=begin
require File.join(
File.expand_path(File.dirname(__FILE__)),
'../mtc_employee_updater/support/common_funcs'
)
=end

    require 'rubygems'

    desc "Create initial data values in the database."
    task :create_data => :environment do

      begin

        log_init("internReq")

        log "\n\n Starting task: create_data ....\n\n"

        agency = Agency.create(:AgencyName => 'AC Transit', :phone => 5108769876, :email => 'help@actransit.org')
        agency_2 = Agency.create(:AgencyName => 'Bay Area Transit', :phone => 9258769876, :email => 'baytrans@baytransit.org')

        mentor = Mentor.create(:FirstName => 'Yong', :LastName => 'Lee', :title => 'System Admin', :department => 'A&TS', :phone => '5108175829', :email => 'ylee@actransit.org')
        mentor_2 = Mentor.create(:FirstName => 'David', :LastName => 'Wong', :title => 'System Admin', :department => 'A&TS', :phone => '5108175829', :email => 'dwong@actransit.org')

        authorizedPerson = AuthorizedPerson.create(:FirstName => 'Pranathi', :LastName => 'Naka', :title => 'System Admin', :department => 'A&TS', :phone => '510999999', :email => 'nakaP@actransit.org')
        authorizedPerson = AuthorizedPerson.create(:FirstName => 'Ethan', :LastName => 'Michael', :title => 'System Admin', :department => 'A&TS', :phone => '585799844', :email => 'emakaP@mtc.ca.org')

        AuthorizedPerson.create(:FirstName => 'Tom', :LastName => 'Bryan', :title => 'Database Admin', :department => 'Health', :phone => '847-444-443', :email => 'tBryan@actransit.org')

        addr = Address.create(:city => 'Oakland', :state => 'CA', :StreetName => '8th Street', :StreetNumber => '101', :zip => '95607')
        addr_2 = Address.create(:city => 'San Frnacisco', :state => 'CA', :StreetName => 'Market Street', :StreetNumber => '5101', :zip => '95677')

        cnty = County.create(:CountyName => 'Alameda')
        cnty = County.create(:CountyName => 'Contra Costa')
        cnty = County.create(:CountyName => 'Sononma')
        cnty = County.create(:CountyName => 'Marine')

        deprt = Department.create(:Name => 'Accounting')
        deprt = Department.create(:Name => 'AT&S')
        deprt = Department.create(:Name => 'Finance')
        deprt = Department.create(:Name => 'BOA')

        enrichmentAct = EnrichmentAct.create(:desc => 'Reading a lot.', :name => 'Reading')
        enrichmentAct = EnrichmentAct.create(:desc => 'Singing a lot.', :name => 'Singing')
        enrichmentAct = EnrichmentAct.create(:desc => 'Take a lot of pictures.', :name => 'Photography')

        internQuestion = InternQuestion.create(:name => 'Interns have a one- to two-week vacation scheduled', :value => '1')
        internQuestion = InternQuestion.create(:name => 'Interns are seeking a part-time schedule only', :value => '0')
        internQuestion = InternQuestion.create(:name => 'Has your agency participated in MTC High School Internship Program in the past', :value => '1')


        interviewer = Interviewer.create(:email => 'Hwoint@abc.com', :FirstName => 'Harry', :LastName => 'Waong', :phone => '8760981432', :title => 'Software Developer')
        interviewer = Interviewer.create(:email => 'BSunny@bay1.com', :FirstName => 'Sunny', :LastName => 'Bee', :phone => '9386098143', :title => 'Finance Analyst')
        interviewer = Interviewer.create(:email => 'MSweet@news.com', :FirstName => 'Mary', :LastName => 'Sweet', :phone => '9830981432', :title => 'Accountant')

        job = Job.create(:Enddate => '10/31/2013', :JobDesc => 'Senior Account Manager', :Job_title => 'Account Manager', :RequiredSkills_1 => 'International accounting pratices', :RequiredSkills_2 => 'Business software', :RequiredSkills_3 => 'IBM Mainframe', :Startdate => Date.new(2012, 03, 22))
        job = Job.create(:Enddate => '12/31/2015', :JobDesc => 'Chief Architect in Software Development', :Job_title => 'Chief Architect', :RequiredSkills_1 => 'Software Analysis', :RequiredSkills_2 => 'High performance clustering', :RequiredSkills_3 => 'J2EE', :Startdate => Date.new(2011, 04, 15))
        job = Job.create(:Enddate => '11/31/2017', :JobDesc => 'Senior Accountant', :Job_title => 'Accountant III', :RequiredSkills_1 => 'International accounting pratices', :RequiredSkills_2 => 'Business software', :RequiredSkills_3 => 'IBM Mainframe', :Startdate => Date.new(2009, 12, 22))

=begin
#error
        Status = Status.create(:StatusDescription => 'Completed')
        Status = Status.create(:StatusDescription => 'Incomplete')
        Status = Status.create(:StatusDescription => 'Pending')
        Status = Status.create(:StatusDescription => 'In Progress')

        internshipLocation = InternshipLocation.create(:phone => '8376653332')
        InternshipLocation = InternshipLocation.create(:phone => '8577366653')
        InternshipLocation = InternshipLocation.create(:phone => '2148799960')
=end


        internRequest = InternRequest.create(:EndDate => Date.new(2012, 05, 12), :EndHour => '5', :EveningMeetingsPercent => '0', :InternProjectDesc => 'Working in accounting office and help file papers.', :InternProvisionEmail => '1', :InternProvisionPhone => '0', :OfficeDutiesPercent => '80', :OutFieldWorkPercent => '20', :StartDate => Date.new(2011, 12, 22), :StartHour => '8', :WeekendWorkPercent => '0')
        internRequest = InternRequest.create(:EndDate => Date.new(2012, 12, 22), :EndHour => '5', :EveningMeetingsPercent => '10', :InternProjectDesc => 'Help to write simple documentations.', :InternProvisionEmail => '1', :InternProvisionPhone => '1', :OfficeDutiesPercent => '80', :OutFieldWorkPercent => '10', :StartDate => Date.new(2012, 05, 01), :StartHour => '8', :WeekendWorkPercent => '0')
        internRequest = InternRequest.create(:EndDate => Date.new(2014, 12, 31), :EndHour => '5', :EveningMeetingsPercent => '30', :InternProjectDesc => 'Help to create test script for web applications.', :InternProvisionEmail => '1', :InternProvisionPhone => '1', :OfficeDutiesPercent => '80', :OutFieldWorkPercent => '10', :StartDate => Date.new(2011, 12, 22), :StartHour => '8', :WeekendWorkPercent => '0')

        contact = Contact.create(:Email => 'y@bvc.com', :FirstName => 'Bob', :LastName => 'Fastman', :phone => '5460982655')
        contact = Contact.create(:Email => 'boww@bvc.com', :FirstName => 'Bow', :LastName => 'Kittman', :phone => '9986098265')
        contact = Contact.create(:Email => 'poi@bvc.com', :FirstName => 'Pointman', :LastName => 'Test', :phone => '5460982098')

      end

    end

    desc "Delete all the data from the database."
    task :delete_all_data_from_database => :environment do

      begin

        puts "Are you sure to delete all the data from the database?(yes/no)"
        answer = $stdin.gets.chomp

        log_init("internReq")

        if (answer == "yes")

          puts "\n\n Deleting all the data from the database ....\n\n"
    
          InternRequest.delete_all      

          Address.delete_all
          Agency.delete_all
          AuthorizedPerson.delete_all
          Contact.delete_all
          County.delete_all
          Department.delete_all
          EnrichmentAct.delete_all
          InternQuestion.delete_all
          
          InternshipLocation.delete_all
          Interviewer.delete_all
          Job.delete_all
          LoginUser.delete_all
          Mentor.delete_all
          Status.delete_all

                
        end
      end

    end

  end
end
