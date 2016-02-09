require 'spec_helper'

describe Baldr::Parser do

  Dir.glob('spec/support/edi_files/valid/**/*.EDI').each do |file|
    context file do
      it 'should match input file and rendered tree from this file' do
        input = File.read(file)
        parser = Baldr::Parser.new(input)
        parser.error.should be_nil
        parser.envelopes.each do |envelope|
          Baldr::Types.convert_before_render!(envelope, parser.grammar)
        end
        output = Baldr::Renderer::X12.draw(parser.envelopes, {separators: parser.separators})
        output.bytes.to_a.should eq input.bytes.to_a
      end
    end
  end

  Dir.glob('spec/support/edi_files/invalid/*.EDI').each do |file|
    context file do
      it 'should not be valid due to parse errors' do
        input = File.read(file)
        parser = Baldr::Parser.new(input)
        parser.error.should_not be_nil
      end

      it 'should be ok because validation is skipped' do
        input = File.read(file)
        parser = Baldr::Parser.new(input, skip_validation: true)
        parser.error.should be_nil
      end
    end
  end

  Dir.glob('spec/support/edi_files/custom_grammar/**/*.EDI').each do |file|
    context file do
      it 'should match input file and rendered tree from this file' do
        input = File.read(file)
        separators = {
          segment: '~'.bytes.to_a,
          element: '*',
          component: '<'
        }
        grammar = Baldr::Test::CustomGrammar
        parser = Baldr::Parser.new(input, separators: separators, grammar: grammar)
        parser.error.should be_nil
        if parser.root_type == :envelope
          output = Baldr::Renderer::X12.draw(parser.envelopes, {separators: parser.separators})
        else
          output = Baldr::Renderer::X12.draw(parser.transactions, {separators: parser.separators})
        end
        output.bytes.to_a.should eq input.bytes.to_a
      end
    end
  end

  Dir.glob('spec/support/edi_files/valid/856/18.EDI').each do |file|
    context file do
      it 'should include error when set856 :id => "PID" is "Pid"' do
        input = File.read(file)
        # Set PID to Pid.
        Baldr::Grammar::Version4010::Set856.structure[:level][2][:level][5][:id] = 'Pid'
        parser = Baldr::Parser.new(input)
        parser.error.should include "segment SE is required, but nothing was found"
        # Reset to prevent remaining tests from breaking. Check for no errors.
        Baldr::Grammar::Version4010::Set856.structure[:level][2][:level][5][:id] = 'PID'
        parser = Baldr::Parser.new(input)
        parser.error.should be_nil
      end
    end
  end

end