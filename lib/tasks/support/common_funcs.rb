
require File.join(File.expand_path(File.dirname(__FILE__)),
  'logging_and_reporting')


require 'rubygems'
require 'net/ldap'



# desc "Initialize instance variables used through out the functions."
def initialize_variables
  #set up global variables used through out the tasks
  ts = Time.now.strftime('%Y.%m.%d_%H.%M.%S')
  @log_file_name = File.join(File.expand_path(File.dirname(__FILE__)), '../log', "mtc_log_#{ts}.log")
  @migration_log = File.new(@log_file_name, 'w')
  #@error_log = File.new(File.join(File.expand_path(File.dirname(__FILE__)), '../log', "mtc_error_#{ts}.log"), 'w')
  @user_not_in_eDir = []
  @user_not_in_contacts_table = []
  @user_not_in_address_table = []
  @user_has_missing_attribute =[]
  @user_not_in_eDir_cnt = 0
  @user_in_eDir_cnt = 0
  @error = 0
  @error_count = 0
  @user_in_data_file_cnt = 0
  @user_not_found_in_email_hash = []

  #set up an employee data hash for look up and find employee
  @user_id_hash = {
    # for workstation look up
    "xpolin"                  => "HPoling@mtc.ca.gov",

    # for MTC's staff name in Ceridian database look up
    "Abeba Haile" => "ahaile@mtc.ca.gov",
    "Annalee Macaulay" => "AMacaulay@mtc.ca.gov",
    "Beba (Eva) Jimenez" => "BJimenez@mtc.ca.gov",
    "Brenton Santos-Smith" => "BSmith@mtc.ca.gov",
    "Carolyn Libby" => "CClevenger@mtc.ca.gov",
    "Carolyn McKenzie" => "CJacks@mtc.ca.gov",
    "Clive Endress" => "CEndress@mtc.ca.gov",
    "Cynthia Segal" => "csegal@mtc.ca.gov",
    "David Vautin" => "DVautin@mtc.ca.gov",
    "Debbie Surya-Atmaja" => "DAtmaja@mtc.ca.gov",
    "Deborah Scarborough" => "DScarborough@mtc.ca.gov",
    "Douglas Johnson" => "DJohnson@mtc.ca.gov",
    "Douglas Kimsey" => "DKimsey@mtc.ca.gov",
    "Elizabeth Cecchini" => "BCecchini@mtc.ca.gov",
    "Emily Vanwagner" => "evanwagner@mtc.ca.gov",
    "Eva Jimenez" => "BJimenez@mtc.ca.gov",
    "Felila Toleafoa" => "ltoleafoa@mtc.ca.gov",
    "James Macrae" => "JMacrae@mtc.ca.gov",
    "James Mayhew" => "BMayhew@mtc.ca.gov",
    "James Stagi" => "jstagi@mtc.ca.gov",
    "Jeffrey Gould" => "PGould@mtc.ca.gov",
    "Jeffrey Nazarino" => "JNazareno@mtc.ca.gov",
    "Joseph Curley" => "JCurley@mtc.ca.gov",
    "Kenneth Wong" => "kwong@mtc.ca.gov",
    "Leslie Lara-Enriquez" => "LLara@mtc.ca.gov",
    "Linda Vogler" => "UVogler@mtc.ca.gov",
    "Margaret Yamada" => "PYamada@mtc.ca.gov",
    "Maria Federis" => "EFederis@mtc.ca.gov",
    "Marjorie Blackwell" => "MBlackwell@mtc.ca.gov",
    "Michael Cheng" => "MCheng@mtc.ca.gov",
    "Michael Lee" => "mlee@mtc.ca.gov",
    "Pamela Grove" => "pgrove@mtc.ca.gov",
    "Prabhashni Prasad" => "SPrasad@mtc.ca.gov",
    "Ramon Ceguera" => "RCeguera@mtc.ca.gov",
    "Randall Rentschler" => "RRentschler@mtc.ca.gov",
    "Raymond Jocson" => "RJocson@mtc.ca.gov",
    "Robert Bates" => "BBates@mtc.ca.gov",
    "Rodney McMillan" => "RMcMillan@mtc.ca.gov",
    "Rosa Leyva" => "rleyva@mtc.ca.gov",
    "Ruthellen Griffin" => "EGriffin@mtc.ca.gov",
    "Srikalyani Srinivasan" => "SSrinivasan@mtc.ca.gov",
    "Susan Heinrich-Beaty" => "SHeinrich@mtc.ca.gov",
    "Teresa Lee" => "tlee@mtc.ca.gov",
    "Thomas Bryan" => "tbryan@mtc.ca.gov",
    "Van Nguyen" => "ANguyen@mtc.ca.gov",
    "Anna Young " => "AYoung@mtc.ca.gov",
    "Shanin Shiralian" => "SShiralian@mtc.ca.gov"



    
  }

  #set up a county code hash table
  @zip_to_county_hash = {
    "94501" => "Alameda",
    "94502" => "Alameda",
    "94706" => "Alameda",
    "94701" => "Alameda",
    "94702" => "Alameda",
    "94703" => "Alameda",
    "94704" => "Alameda",
    "94705" => "Alameda",
    "94707" => "Alameda",
    "94709" => "Alameda",
    "94710" => "Alameda",
    "94712" => "Alameda",
    "94720" => "Alameda",
    "94546" => "Alameda",
    "94552" => "Alameda",
    "94662" => "Alameda",
    "94568" => "Alameda",
    "94608" => "Alameda",
    "94536" => "Alameda",
    "94537" => "Alameda",
    "94538" => "Alameda",
    "94539" => "Alameda",
    "94555" => "Alameda",
    "94540" => "Alameda",
    "94541" => "Alameda",
    "94542" => "Alameda",
    "94543" => "Alameda",
    "94544" => "Alameda",
    "94545" => "Alameda",
    "94557" => "Alameda",
    "94550" => "Alameda",
    "94551" => "Alameda",
    "94560" => "Alameda",
    "94601" => "Alameda",
    "94602" => "Alameda",
    "94603" => "Alameda",
    "94604" => "Alameda",
    "94605" => "Alameda",
    "94606" => "Alameda",
    "94607" => "Alameda",
    "94609" => "Alameda",
    "94610" => "Alameda",
    "94611" => "Alameda",
    "94612" => "Alameda",
    "94613" => "Alameda",
    "94614" => "Alameda",
    "94615" => "Alameda",
    "94617" => "Alameda",
    "94618" => "Alameda",
    "94619" => "Alameda",
    "94621" => "Alameda",
    "94622" => "Alameda",
    "94623" => "Alameda",
    "94624" => "Alameda",
    "94625" => "Alameda",
    "94649" => "Alameda",
    "94659" => "Alameda",
    "94660" => "Alameda",
    "94661" => "Alameda",
    "94666" => "Alameda",
    "94620" => "Alameda",
    "94566" => "Alameda",
    "94588" => "Alameda",
    "94577" => "Alameda",
    "94578" => "Alameda",
    "94579" => "Alameda",
    "94580" => "Alameda",
    "94586" => "Alameda",
    "94587" => "Alameda",
    "94507" => "Contra Costa",
    "94509" => "Contra Costa",
    "94531" => "Contra Costa",
    "94708" => "Contra Costa",
    "94511" => "Contra Costa",
    "94513" => "Contra Costa",
    "94514" => "Contra Costa",
    "94516" => "Contra Costa",
    "94517" => "Contra Costa",
    "94518" => "Contra Costa",
    "94519" => "Contra Costa",
    "94520" => "Contra Costa",
    "94521" => "Contra Costa",
    "94522" => "Contra Costa",
    "94524" => "Contra Costa",
    "94527" => "Contra Costa",
    "94529" => "Contra Costa",
    "94525" => "Contra Costa",
    "94506" => "Contra Costa",
    "94526" => "Contra Costa",
    "94528" => "Contra Costa",
    "94505" => "Contra Costa",
    "94530" => "Contra Costa",
    "94803" => "Contra Costa",
    "94820" => "Contra Costa",
    "94547" => "Contra Costa",
    "94548" => "Contra Costa",
    "94549" => "Contra Costa",
    "94553" => "Contra Costa",
    "94556" => "Contra Costa",
    "94570" => "Contra Costa",
    "94575" => "Contra Costa",
    "94561" => "Contra Costa",
    "94563" => "Contra Costa",
    "94564" => "Contra Costa",
    "94565" => "Contra Costa",
    "94523" => "Contra Costa",
    "94569" => "Contra Costa",
    "94801" => "Contra Costa",
    "94802" => "Contra Costa",
    "94804" => "Contra Costa",
    "94805" => "Contra Costa",
    "94807" => "Contra Costa",
    "94808" => "Contra Costa",
    "94850" => "Contra Costa",
    "94572" => "Contra Costa",
    "94806" => "Contra Costa",
    "94582" => "Contra Costa",
    "94583" => "Contra Costa",
    "94595" => "Contra Costa",
    "94596" => "Contra Costa",
    "94597" => "Contra Costa",
    "94598" => "Contra Costa",
    "94920" => "Marin",
    "94924" => "Marin",
    "94925" => "Marin",
    "94976" => "Marin",
    "94929" => "Marin",
    "94930" => "Marin",
    "94978" => "Marin",
    "94933" => "Marin",
    "94904" => "Marin",
    "94937" => "Marin",
    "94914" => "Marin",
    "94938" => "Marin",
    "94939" => "Marin",
    "94977" => "Marin",
    "94940" => "Marin",
    "94941" => "Marin",
    "94942" => "Marin",
    "94946" => "Marin",
    "94945" => "Marin",
    "94947" => "Marin",
    "94948" => "Marin",
    "94949" => "Marin",
    "94950" => "Marin",
    "94952" => "Marin",
    "94956" => "Marin",
    "94957" => "Marin",
    "94960" => "Marin",
    "94979" => "Marin",
    "94963" => "Marin",
    "94964" => "Marin",
    "94974" => "Marin",
    "94901" => "Marin",
    "94903" => "Marin",
    "94912" => "Marin",
    "94913" => "Marin",
    "94915" => "Marin",
    "94965" => "Marin",
    "94966" => "Marin",
    "94970" => "Marin",
    "94971" => "Marin",
    "94973" => "Marin",
    "94503" => "Napa",
    "94508" => "Napa",
    "94515" => "Napa",
    "94576" => "Napa",
    "94558" => "Napa",
    "94559" => "Napa",
    "94581" => "Napa",
    "94562" => "Napa",
    "94567" => "Napa",
    "94573" => "Napa",
    "94574" => "Napa",
    "94599" => "Napa",
    "94101" => "San Francisco",
    "94102" => "San Francisco",
    "94103" => "San Francisco",
    "94104" => "San Francisco",
    "94105" => "San Francisco",
    "94106" => "San Francisco",
    "94107" => "San Francisco",
    "94108" => "San Francisco",
    "94109" => "San Francisco",
    "94110" => "San Francisco",
    "94111" => "San Francisco",
    "94112" => "San Francisco",
    "94114" => "San Francisco",
    "94115" => "San Francisco",
    "94116" => "San Francisco",
    "94117" => "San Francisco",
    "94118" => "San Francisco",
    "94119" => "San Francisco",
    "94120" => "San Francisco",
    "94121" => "San Francisco",
    "94122" => "San Francisco",
    "94123" => "San Francisco",
    "94124" => "San Francisco",
    "94125" => "San Francisco",
    "94126" => "San Francisco",
    "94127" => "San Francisco",
    "94129" => "San Francisco",
    "94130" => "San Francisco",
    "94131" => "San Francisco",
    "94132" => "San Francisco",
    "94133" => "San Francisco",
    "94134" => "San Francisco",
    "94135" => "San Francisco",
    "94136" => "San Francisco",
    "94137" => "San Francisco",
    "94138" => "San Francisco",
    "94139" => "San Francisco",
    "94140" => "San Francisco",
    "94141" => "San Francisco",
    "94142" => "San Francisco",
    "94143" => "San Francisco",
    "94144" => "San Francisco",
    "94145" => "San Francisco",
    "94146" => "San Francisco",
    "94147" => "San Francisco",
    "94150" => "San Francisco",
    "94151" => "San Francisco",
    "94152" => "San Francisco",
    "94155" => "San Francisco",
    "94156" => "San Francisco",
    "94158" => "San Francisco",
    "94159" => "San Francisco",
    "94160" => "San Francisco",
    "94161" => "San Francisco",
    "94162" => "San Francisco",
    "94163" => "San Francisco",
    "94164" => "San Francisco",
    "94172" => "San Francisco",
    "94175" => "San Francisco",
    "94177" => "San Francisco",
    "94188" => "San Francisco",
    "94199" => "San Francisco",
    "94027" => "San Mateo",
    "94002" => "San Mateo",
    "94005" => "San Mateo",
    "94010" => "San Mateo",
    "94011" => "San Mateo",
    "94013" => "San Mateo",
    "94014" => "San Mateo",
    "94015" => "San Mateo",
    "94016" => "San Mateo",
    "94017" => "San Mateo",
    "94018" => "San Mateo",
    "94019" => "San Mateo",
    "94020" => "San Mateo",
    "94021" => "San Mateo",
    "94025" => "San Mateo",
    "94026" => "San Mateo",
    "94030" => "San Mateo",
    "94037" => "San Mateo",
    "94038" => "San Mateo",
    "94044" => "San Mateo",
    "94060" => "San Mateo",
    "94028" => "San Mateo",
    "94061" => "San Mateo",
    "94062" => "San Mateo",
    "94063" => "San Mateo",
    "94064" => "San Mateo",
    "94065" => "San Mateo",
    "94066" => "San Mateo",
    "94070" => "San Mateo",
    "94128" => "San Mateo",
    "94074" => "San Mateo",
    "94401" => "San Mateo",
    "94402" => "San Mateo",
    "94403" => "San Mateo",
    "94404" => "San Mateo",
    "94497" => "San Mateo",
    "94080" => "San Mateo",
    "94083" => "San Mateo",
    "95002" => "Santa Clara",
    "95008" => "Santa Clara",
    "95009" => "Santa Clara",
    "95011" => "Santa Clara",
    "95013" => "Santa Clara",
    "95014" => "Santa Clara",
    "95015" => "Santa Clara",
    "95020" => "Santa Clara",
    "95021" => "Santa Clara",
    "95026" => "Santa Clara",
    "95630" => "Sacramento",
    "94022" => "Santa Clara",
    "94023" => "Santa Clara",
    "94024" => "Santa Clara",
    "95030" => "Santa Clara",
    "95031" => "Santa Clara",
    "95032" => "Santa Clara",
    "95035" => "Santa Clara",
    "95036" => "Santa Clara",
    "95037" => "Santa Clara",
    "95038" => "Santa Clara",
    "95140" => "Santa Clara",
    "94035" => "Santa Clara",
    "94039" => "Santa Clara",
    "94040" => "Santa Clara",
    "94041" => "Santa Clara",
    "94042" => "Santa Clara",
    "94043" => "Santa Clara",
    "95042" => "Santa Clara",
    "94301" => "Santa Clara",
    "94302" => "Santa Clara",
    "94303" => "Santa Clara",
    "94304" => "Santa Clara",
    "94306" => "Santa Clara",
    "94309" => "Santa Clara",
    "95044" => "Santa Clara",
    "95101" => "Santa Clara",
    "95103" => "Santa Clara",
    "95106" => "Santa Clara",
    "95108" => "Santa Clara",
    "95109" => "Santa Clara",
    "95110" => "Santa Clara",
    "95111" => "Santa Clara",
    "95112" => "Santa Clara",
    "95113" => "Santa Clara",
    "95115" => "Santa Clara",
    "95116" => "Santa Clara",
    "95117" => "Santa Clara",
    "95118" => "Santa Clara",
    "95119" => "Santa Clara",
    "95120" => "Santa Clara",
    "95121" => "Santa Clara",
    "95122" => "Santa Clara",
    "95123" => "Santa Clara",
    "95124" => "Santa Clara",
    "95125" => "Santa Clara",
    "95126" => "Santa Clara",
    "95127" => "Santa Clara",
    "95128" => "Santa Clara",
    "95129" => "Santa Clara",
    "95130" => "Santa Clara",
    "95131" => "Santa Clara",
    "95132" => "Santa Clara",
    "95133" => "Santa Clara",
    "95134" => "Santa Clara",
    "95135" => "Santa Clara",
    "95136" => "Santa Clara",
    "95138" => "Santa Clara",
    "95139" => "Santa Clara",
    "95141" => "Santa Clara",
    "95148" => "Santa Clara",
    "95150" => "Santa Clara",
    "95151" => "Santa Clara",
    "95152" => "Santa Clara",
    "95153" => "Santa Clara",
    "95154" => "Santa Clara",
    "95155" => "Santa Clara",
    "95156" => "Santa Clara",
    "95157" => "Santa Clara",
    "95158" => "Santa Clara",
    "95159" => "Santa Clara",
    "95160" => "Santa Clara",
    "95161" => "Santa Clara",
    "95164" => "Santa Clara",
    "95170" => "Santa Clara",
    "95172" => "Santa Clara",
    "95173" => "Santa Clara",
    "95190" => "Santa Clara",
    "95191" => "Santa Clara",
    "95192" => "Santa Clara",
    "95193" => "Santa Clara",
    "95194" => "Santa Clara",
    "95196" => "Santa Clara",
    "95046" => "Santa Clara",
    "95050" => "Santa Clara",
    "95051" => "Santa Clara",
    "95052" => "Santa Clara",
    "95053" => "Santa Clara",
    "95054" => "Santa Clara",
    "95055" => "Santa Clara",
    "95056" => "Santa Clara",
    "95070" => "Santa Clara",
    "95071" => "Santa Clara",
    "94305" => "Santa Clara",
    "94085" => "Santa Clara",
    "94086" => "Santa Clara",
    "94087" => "Santa Clara",
    "94088" => "Santa Clara",
    "94089" => "Santa Clara",
    "94510" => "Solano",
    "94512" => "Solano",
    "95620" => "Solano",
    "95625" => "Solano",
    "94533" => "Solano",
    "94534" => "Solano",
    "94571" => "Solano",
    "94585" => "Solano",
    "94535" => "Solano",
    "95687" => "Solano",
    "95688" => "Solano",
    "95696" => "Solano",
    "94589" => "Solano",
    "94590" => "Solano",
    "94591" => "Solano",
    "94592" => "Solano",
    "95412" => "Sonoma",
    "94922" => "Sonoma",
    "94923" => "Sonoma",
    "95416" => "Sonoma",
    "95419" => "Sonoma",
    "95421" => "Sonoma",
    "95425" => "Sonoma",
    "94926" => "Sonoma",
    "94931" => "Sonoma",
    "95430" => "Sonoma",
    "95433" => "Sonoma",
    "95431" => "Sonoma",
    "95436" => "Sonoma",
    "95439" => "Sonoma",
    "95441" => "Sonoma",
    "95442" => "Sonoma",
    "95444" => "Sonoma",
    "95446" => "Sonoma",
    "95448" => "Sonoma",
    "95450" => "Sonoma",
    "95452" => "Sonoma",
    "95462" => "Sonoma",
    "95465" => "Sonoma",
    "94951" => "Sonoma",
    "94953" => "Sonoma",
    "94954" => "Sonoma",
    "94955" => "Sonoma",
    "94975" => "Sonoma",
    "94999" => "Sonoma",
    "95471" => "Sonoma",
    "94927" => "Sonoma",
    "94928" => "Sonoma",
    "95401" => "Sonoma",
    "95402" => "Sonoma",
    "95403" => "Sonoma",
    "95404" => "Sonoma",
    "95405" => "Sonoma",
    "95406" => "Sonoma",
    "95407" => "Sonoma",
    "95409" => "Sonoma",
    "95472" => "Sonoma",
    "95473" => "Sonoma",
    "95476" => "Sonoma",
    "95480" => "Sonoma",
    "95497" => "Sonoma",
    "94972" => "Sonoma",
    "95486" => "Sonoma",
    "95487" => "Sonoma",
    "95492" => "Sonoma",
    "96145" => "Other"

  }

end




#Authenticate a user through LDAP
def authenticate_user_in_ldap (user_name, pwd)

  log "\n\n Entering task :authenticate_user_in_ldap.\n\n"

  initialize_variables

  #username = "xldapProxy"
  #password = ""
  username = user_name
  password = pwd

  ldap = Net::LDAP.new
  ldap.host = "10.1.1.2"
  ldap.port = "389"

  ldap.authenticate "uid=#{username},ou=Users,o=MTC", password

  is_authenticated = ldap.bind

  unless is_authenticated == true
    log "Error: Authentication fails with username '#{username}'."
    exit
  end

  log "\n\n Exiting task :authenticate_user_in_ldap.\n\n"

  return ldap
end

#Given a key, return a value. If key is nonexistent, then return empty string.
def lookup_user_email_from_key(key)
  email = @user_id_hash.fetch(key,"")
  return email
end


#Given a key, return a value. If key is nonexistent, then return "unknown" string.
def lookup_county_name_from_key(key)
  county = @zip_to_county_hash.fetch(key, "unknown")
  return county
end


def add_mtc_contact(f_name, l_name, emp_status, dprt_id)

  contact = Contact.new

  #add the information in contacts table
  contact.active = 1

  contact.first_name = f_name
  contact.last_name = l_name
  contact.mtc_employment_status = emp_status
  contact.mtc_department_id = dprt_id

  fullname = f_name + ' ' + l_name

  begin
    log "Adding user #{fullname} in database."
    contact.save!
    @user_add_to_contacts_table << fullname

  rescue
    log "Error ! User #{fullname} can not be added in database."
    contact = nil

  end

  return contact
end


#Given a string, extract the 3 parts of a phone number. Return an array of string object
def extract_phone_number (phone_string)

  nums = phone_string.scan(/[0-9]+/)

  if nums.size > 0
    all_nums = nums.join
    all_nums = all_nums[0..0] == "1" ? all_nums[1..-1] : all_nums
    if all_nums.size >= 10
      ten_nums = all_nums[0..9]

      phone_areaCode = ten_nums[0..2]
      phone_prefix = ten_nums[3..5]
      phone_line_number = ten_nums[6..9]
    else
      phone_areaCode = ""
      phone_prefix = ""
      phone_line_number = ""
    end

  else
    phone_areaCode = ""
    phone_prefix = ""
    phone_line_number = ""
  end

  return [phone_areaCode, phone_prefix, phone_line_number]

end


# Return the floor number from a location name
def get_floor_number(location_name)

  #log "In get_floor_number: Location is #{location_name}."


  if location_name.length() < 3
    floor_number = 'Ground'
  else
    floor_number = case location_name[0].chr
    when '0' then 'Ground Floor'
    when '1' then 'First Floor'
    when '2' then 'Second Floor'
    when '3' then 'Third Floor'
    when '4' then 'Fourth Floor'
    when '5' then 'Fifth Floor'
    when '6' then 'Sixth Floor'
    when '7' then 'Seventh Floor'
    when '8' then 'Eighth Floor'
    when '9' then 'Nineth Floor'
    else 'unknown'
    end

  end

  return floor_number
end

def find_department_name(department_id)

  dep_id = case department_id
    
    when '1' then 'Executive Office'
    when '2' then 'Office of General Counsel'
    when '3' then 'unknown'
    when '4' then 'Legislation and Public Affairs'
    when '5' then 'Office of Chief Financial Office'
    when '6' then 'Traveler Coordination and Information'
    when '7' then 'Highway and Arterial Operations'
    when '8' then 'Planning'
    when '9' then 'unknown'
    when '10' then 'unknown'
    when '11' then 'Bridge Oversight and Operations'
    when '12' then 'Programming and Allocations'
    when '13' then 'Administrative and Technology Services'
    else 'unknown'
    end

  return dep_id
end


