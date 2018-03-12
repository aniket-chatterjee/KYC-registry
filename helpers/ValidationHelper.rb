
require "date"
module ValidationHelper
  def self.isFilled(params,field)
     ret=false
     ret=true if params[field.to_sym] && params[field]!=""
     ret
  end
  def self.isEmail(value)
      ret=false
      ret=true if /\A[a-z0-9\+\-_\.]+@[a-z\d\-.]+\.[a-z]+\z/i.match(value)
      ret
  end
  def self.isNumbersOnly(value)
    ret=false
    ret= true if /^[0-9]+$/.match(value)
    ret
  end
  def self.isContactNumber(value,type="mobile")
    ret=false
    ret= true if isNumbersOnly(value) && value.length>=10 && value.length<13
    ret
  end
  def self.isCharatersOnly(params,field)
    ret=false
    ret=true if /^[a-zA-Z]+$/.match(params[field.to_sym])
    ret
  end

  def self.isDate(params,field)
    ret=false
    valid_date=Date.strptime(params[field.to_sym], '%d/%m/%Y')  rescue nil
    ret=true if valid_date
    ret
  end
  def self.isAFutureDate(date)
    ret=false
    ret=true if Date.today<date
    ret
  end
  def self.isDateWithinRange(date,range_start,range_end)
    ret=false
    ret=true if date>range_start && date<range_end
    ret
  end
  def self.isValidGender(value)
    genders=["Male","Female","Transgender"]
    ret=false
    ret=true if (genders.include? value)
    ret
  end
  def self.isValidMaritalStatus(value)
    marital_status_list=["Married","Unmarried","Others"]
    ret=false
    ret=true if (marital_status_list.include? value)
    ret
  end
  def self.isValidCitizenship(value)
    #todo check Against Table
  end
  def self.isValidResidentialStatus(value)
    residential_status_list=["Resident Individual","Non Resident Indian","Foreign National","Person of Indian Origin"]
    ret=false
    ret=true if (residential_status_list.include? value)
    ret
  end

  def self.isValidOccupationType(occupation_type,sector)
    occupation_types={
      "Service"=>["Private Sector","Public Sector","Government Sector"],
      "Others"=>["Professional","Self Employed","Retired","Housewife","Student"],
      "Business"=>[""],
      "Not Categorised"=>[""]
    }
    ret=false
    ret=true if (occupation_types[occupation_type].include? value) rescue nil
    ret
  end
  def self.isValidImage(params,field,aspect_ratio,size)
      #Todo
  end
  def self.isValidPanNumber(params,field,aspect_ratio,size)
      #Todo
  end
  def self.isValidFile(params,field)
      #Todo
  end
end
