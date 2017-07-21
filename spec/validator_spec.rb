require 'spec_helper'

describe Baldr::Validator do
  # Baldr::Validator.validate!(e, @grammar)
  let(:separators) {{
    segment: [10],
    element: '*',
    component: '<'
  }}
  let(:grammar) {Baldr::Grammar::Envelope}

  context 'Truncating Loops' do
  	[
  		['spec/support/edi_files/invalid/204/1.EDI', true, 'on'],
  	 ['spec/support/edi_files/valid/204/1.EDI', false, 'off']
  	].each do |scenario|
		  Dir.glob(scenario[0]).each do |file|
		    context file do
				  it "work with truncating option #{scenario[2]}" do
				    @input = File.read(file)
				    expect(@input.scan(/NTE/).size > 10).to eq scenario[1]

				    segments = split_segments(separators)
				    @roots = build_tree(segments, grammar)
				    @roots.each { |e|
				    	Baldr::Validator.validate!(e, grammar, {truncate_loops: scenario[1]})
				    }
				  end
		    end
		  end
		end
	end

  ############################## Using these methods from parser just to simulate the call to the validator as it happens from the parser, and from the App in EnvelopePreparationService.
  def split_segments(separators)
    segments = []
    buffer = []
    skip = 0

    io = StringIO.new(@input)
    io.each_byte do |b|
      if skip > 0
        skip -= 1
      else
        if b == separators[:segment].first
          segments << buffer.pack('c*').split(separators[:element])
          skip = separators[:segment].length - 1
          buffer = []
        else
          buffer << b
        end
      end
    end

    raise Baldr::Error::ParsingError, 'invalid characters in the end of interchange' if skip > 0

    segments
  end

  def build_tree(source, grammar)
    loop = build_segment(source.to_enum, grammar, grammar.structure)
    loop.segments
  end
  # :error, :separators, :input, :root_type, :grammar
  def build_segment(enumerator, grammar, structure)
    current = enumerator.peek

    while structure[:id] == current[0]
      loop ||= Baldr::Loop.new(current[0])
      segment = Baldr.const_get((structure[:class] || :segment).to_s.camelize).new(current[0])
      segment.elements = current[1..-1]
      loop.add segment

      enumerator.next

      sub_grammar = grammar.sub_grammar(segment) if grammar.respond_to?(:sub_grammar)

      if sub_grammar
        sub_grammar.structure.fetch(:level, []).each do |s|
          child = build_segment(enumerator, sub_grammar, s)
          segment.children << child if child
        end
      else
        structure.fetch(:level, []).each do |s|
          child = build_segment(enumerator, grammar, s)
          segment.children << child if child
        end
      end

      current = enumerator.peek
    end

    loop

  rescue StopIteration
    return loop
  end

end