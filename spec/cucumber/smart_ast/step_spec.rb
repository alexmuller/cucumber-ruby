require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require 'cucumber/smart_ast/step'
require 'cucumber/smart_ast/step_template'
require 'cucumber/smart_ast/py_string'
require 'cucumber/smart_ast/table'

module Cucumber
  module SmartAst
    describe Step do
      context "formatting for execution" do
        before do
          @step = Step.new("Given", "a step", 1, nil)
        end
        
        it "should include nil when there is no multiline argument" do
          @step.to_execution_format.should == ["a step", nil]
        end
        
        it "should return a string for a py_string" do
          @step.argument = PyString.new("Oh hai", 1)
          @step.to_execution_format.should == ["a step", "Oh hai"]
        end
        
        it "should return the table object for a table" do
          table = Table.new([%w{ 1 2 3 }], 1)
          @step.argument = table
          @step.to_execution_format.should == ["a step", table]
        end
      end
    end
  end
end
