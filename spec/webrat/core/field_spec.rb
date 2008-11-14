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
    describe "match_text?" do
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

     # matches value
      # matches_value ? matches somthing (& insensitive) 2
      # matches value matches_text? value
      # matches_value? matches_alt? value
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
