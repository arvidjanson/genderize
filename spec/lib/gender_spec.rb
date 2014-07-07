require "spec_helper"

describe Genderize::Gender do
  
  let(:female) { Gender.new("female") }
  let(:male) { Gender.new("male") }
  let(:unknown) { Gender.new('') }
  
  context "when full gender name is used" do
    
    it "should find the correct abbreviation" do
      Gender.new("female").abbr.should eql('female')
      Gender.new("male").abbr.should eql('male')
    end
    
  end
  
  
  describe :name do
    
    context "when male" do
      
      it "should be 'male'" do
        male.name.should eql("male")
      end
      
    end

    context "when female" do
      
      it "should be 'female'" do
        female.name.should eql("female")
      end
      
    end
    
    context "when unknown" do
      
      it "should be unknown" do
        unknown.name.should eql("unknown")
      end
      
    end
    
    
  end
  
  describe :abbr do 
  
    context "when male" do
      
      it "should be 'male'" do
        male.abbr.should eql("male")
      end
      
    end

    context "when female" do
      
      it "should be 'female'" do
        female.abbr.should eql("female")
      end
      
    end
    
    context "when unknown" do
      
      it "should be empty string" do
        unknown.abbr.should eql("")
      end
      
    end
    
  
  end
  
  describe :subject do
  
    context "when male" do
      
      it "should be 'he'" do
        male.subject.should eql("he")
      end
      
    end

    context "when female" do
      
      it "should be 'she'" do
        female.subject.should eql("she")
      end
      
    end
    
    context "when unknown" do
      
      it "should be nil" do
        unknown.subject.should eql("they")
      end
      
    end
    
  end
  
  describe  :object do

    context "when male" do
      
      it "should be 'him'" do
        male.object.should eql("him")
      end
      
    end

    context "when female" do
      
      it "should be 'her'" do
        female.object.should eql("her")
      end
      
    end

    context "when unknown" do
      
      it "should be nil" do
        unknown.object.should eql("them")
      end
      
    end

  
  end
  
  describe  :possessive do
    
    context "when male" do
      
      it "should be 'his'" do
        male.possessive.should eql("his")
      end
      
    end

    context "when female" do
      
      it "should be 'her'" do
        female.possessive.should eql("her")
      end
      
    end
    
    context "when unknown" do
      
      it "should be nil" do
        unknown.possessive.should eql("their")
      end
      
    end
    
    
  
  end
  
  describe :casual do
    
    context "when male" do
      
      it "should be 'guy'" do
        male.casual.should eql("guy")
      end
      
    end

    context "when female" do
      
      it "should be 'girl'" do
        female.casual.should eql("girl")
      end
      
    end
    
    context "when unknown" do
      
      it "should be nil" do
        unknown.casual.should eql("person")
      end
      
    end
    
    
  end
  
  describe :to_s do
    
    it "should equal the abbr value" do
      male.to_s.should eql(male.abbr)
      female.to_s.should eql(female.abbr)
      unknown.to_s.should eql(unknown.abbr)
    end
    
    it "returns a string" do
      male.to_s.should be_an_instance_of(String)
      female.to_s.should be_an_instance_of(String)            
      unknown.to_s.should be_an_instance_of(String)            
    end
    
  end
  
  describe :capital_abbr do
    
    it "should equal the abbr value capitalized" do
      male.capital_abbr.should eql(male.abbr.capitalize)
      female.capital_abbr.should eql(female.abbr.capitalize)
    end
    
  end
  
  describe :== do
    
    it "should return true if passed abbr value" do
      (male == "male").should be_truthy
      (female == "female").should be_truthy 
      (unknown == nil).should be_truthy    
    end

    it "should return false if not passed abbr value" do
      (male == "f").should be_falsey
      (female == 1).should be_falsey
      (unknown == "$").should be_falsey           
    end
    
  end
  
end