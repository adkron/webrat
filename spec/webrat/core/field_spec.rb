require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

module Webrat
  describe CheckboxField do
    it "should say it is checked if it is" do
      checkbox = CheckboxField.new(nil, (Webrat::XML.document("<input type='checkbox' checked='checked'>").search('input')).first)
      checkbox.should be_checked
    end

    it "should say it is not checked if it is not" do
      checkbox = CheckboxField.new(nil, (Webrat::XML.document("<input type='checkbox'>").search('input')).first)
      checkbox.should_not be_checked
    end
  end

  describe RadioField do
    it "should say it is checked if it is" do
      radio_button = RadioField.new(nil, (Webrat::XML.document("<input type='radio' checked='checked'>").search('input')).first)
      radio_button.should be_checked
    end

    it "should say it is not checked if it is not" do
      radio_button = RadioField.new(nil, (Webrat::XML.document("<input type='radio'>").search('input')).first)
      radio_button.should_not be_checked
    end
  end

  describe ButtonField do
    describe "matches_text?" do
      before do
        @button_field = ButtonField.new(nil, (Webrat::XML.document("<button>Some Text</button>").search('button').first))
      end

      it "should match inner html" do
        @button_field.matches_text?("Some Text").should_not be_nil
      end

      it "should be case insensitivie" do
        @button_field.matches_text?("some Text").should_not be_nil
      end
    end

    describe 'matches_value?' do
      it 'should match the content of a tag\s "value" attribute' do
        button_field = ButtonField.new(nil, (Webrat::XML.document('<button value="puppies" alt="monkeys">Some Text</button>').search('button').first))
        button_field.matches_value?('puppies').should_not be_nil # Matches the "value" attribute
        button_field.matches_value?('kittens').should be_nil # Doesn't match a value attribute, alt attribute, or the button's content
        button_field.matches_value?('Some Text').should_not be_nil # Matches the button's content
        button_field.matches_value?('monkeys').should_not be_nil # Matches the "alt" attribute
        button_field.matches_value?('monkeYs').should_not be_nil # Matches without case sensitivity
        button_field.matches_value?('Some text').should_not be_nil
        button_field.matches_value?('puPpies').should_not be_nil
      end
    end

    describe 'to_params' do
      it "should return the button's 'value' property" do
        button_field = ButtonField.new(nil, (Webrat::XML.document('<button name="manyard" value="puppies" alt="monkeys">Some Text</button>').search('button').first))
        button_field.to_param.should be_nil
      end
    end

    # to param (web parameter)
    # returns nil if no value match
    # returns value if value match
    # default_value
    # always returns nil
    # click
    # throws exception if disabled 2
    # calls set(@element['value']) unless it has a name  2
    # always submits the form
  end
end
