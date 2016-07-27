class Baldr::Parser

  attr_reader :error, :separators, :input, :root_type, :grammar

  def initialize(input, params = {})
    @input = input
    @grammar = params[:grammar]
    @separators = params[:separators]
    
    parse

    if params[:skip_validation] != true && successful?
      validate
    end
  end

  def successful?
    @error.nil?
  end

  def envelopes
    if @root_type == :envelope
      @roots
    else
      raise Baldr::Error, "interchange doesn't have envelopes"
    end
  end

  def transactions
    if @root_type == :transaction
      @roots
    else
      @roots.map(&:transactions).flatten
    end
  end

  def validate
    if @roots
      @roots.each { |e| Baldr::Validator.validate!(e, @grammar) }
      @roots.each { |e| Baldr::Types.convert_after_parse!(e, @grammar) }
    end
  rescue Baldr::Error => e
    @error = e.message
  end

  protected

  def parse
    @root_type = detect_first_segment
    if @root_type == :transaction
      raise Baldr::Error::ParsingError, "separators must be manually defined for parsing transactions" unless @separators
      @grammar ||= Baldr::Grammar::Transaction
    elsif @root_type == :envelope
      @separators ||= detect_separators
      @grammar ||= Baldr::Grammar::Envelope
    else
      raise Baldr::Error::ParsingError, "doesn't begin with ISA or ST..."
    end
    @roots = build_tree(split_segments(@separators), @grammar)
  rescue Baldr::Error => e
    @error = e.message
  end

  def detect_first_segment
    if @input[0..2] == 'ISA'
      :envelope
    elsif @input[0..1] == 'ST'
      :transaction
    end
  end

  def detect_separators
    io = StringIO.new(input)

    io.seek(3, IO::SEEK_SET)
    element = io.getbyte

    15.times { io.each_byte { |b| break if b == element } }
    component = io.getbyte

    segment = []
    io.each_byte do |b|
      break if b.chr =~ /[A-Z]/
      segment << b
    end

    {
      element: element.chr,
      segment: segment,
      component: component.chr
    }
  end

  def split_segments(separators)
    segments = []
    buffer = []
    skip = 0

    io = StringIO.new(input)
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