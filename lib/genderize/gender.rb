module Genderize
  class Gender
  
    include I18n
    
    attr_reader :abbr
    
    def initialize(abbr)
      unless abbr.blank? or abbr.to_s =~ /\A(male|female)\Z/i
        @abbr = "invalid"
      else
        @abbr = abbr.to_s.downcase
      end
    end
    
    def name
      @name ||= translation_for("name")
    end
  
    def subject
      @subject ||= translation_for("subject")
    end
    
    def object
      @object ||= translation_for("object")
    end
    
    def possessive
      @possessive ||= translation_for("possessive")
    end
    
    def casual
      @casual ||= translation_for("casual")
    end
    
    def capital_abbr
      abbr.capitalize
    end
  
    def male?
      abbr == 'male'
    end
  
    def female?
      abbr == 'female'
    end

    def unknown?
      abbr.blank?
    end
  
    def invalid?
      abbr == "invalid"
    end

    def valid?
      not invalid?
    end

    def to_s
      abbr
    end
  
    def ==(val)
      abbr.to_s == val.to_s
    end
  
    private
    
    def translation_for(key)
      case
      when male? then I18n.t("genderize.#{key}.masculine")
      when female? then I18n.t("genderize.#{key}.feminine")
      when unknown?, invalid? then I18n.t("genderize.#{key}.unknown")
      else
        nil
      end
    end
    
  end
end