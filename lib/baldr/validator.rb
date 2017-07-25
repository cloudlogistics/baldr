module Baldr::Validator

  extend self

  def validate!(envelope, grammar, options={})
    if options.has_key?(:truncate_loops)
      options[:truncate_loops] = options.fetch(:truncate_loops)
    end

    validate_tree!(envelope, grammar, grammar.structure, options)
  end


  protected

  def validate_tree!(segment, grammar, structure, options)
    record_defs = grammar.record_defs
    raise Baldr::Error::ValidationError, "unknown segment #{segment.id}" unless record_defs[segment.id]

    record_defs[segment.id].each.with_index do |r, i|
      element = segment.elements[i]
      check_required(r, element)
      self.send("check_#{r[:type]}", r, element) unless element.nil?
    end

    sub_grammar = grammar.sub_grammar(segment) if grammar.respond_to?(:sub_grammar)
    structure = sub_grammar.structure if sub_grammar

    l = 0
    structure.fetch(:level, []).each do |s|
      loop = segment.children[l]

      if loop && loop.id.to_s == s[:id]
        check_loop_count(loop, s, options[:truncate_loops])

        loop.segments.each { |child| validate_tree!(child, (sub_grammar || grammar), s, options) }

        l += 1
      elsif loop
        raise Baldr::Error::ValidationError, "segment #{s[:id]} is required, but #{loop.id} was found" if s[:min] > 0
      else
        raise Baldr::Error::ValidationError, "segment #{s[:id]} is required, but nothing was found" if s[:min] > 0
      end
    end
    if l < segment.children.size
      loop = segment.children[l]
      raise Baldr::Error::ValidationError, "spare segments #{loop.id}"
    end

    method = "validate_#{segment.id.downcase}!"
    if grammar.respond_to?(method)
      grammar.send(method, segment)
    end
  end

  def check_loop_count(loop, s, truncate_loops)
    if ((loop.count > s[:max]) && truncate_loops)
      loop = remove_excess_segments(loop, s)
    end

    raise Baldr::Error::ValidationError, "#{loop.id} loop is too long: #{loop.count} segments, maximum #{s[:max]}" if loop.count > s[:max]
    raise Baldr::Error::ValidationError, "#{loop.id} loop is too short: #{loop.count} segments, minimum #{s[:min]}" if loop.count < s[:min]
  end

  def check_required(r, element)
    if r[:required] && (element.nil? || element.size == 0)
      raise Baldr::Error::ValidationError, "element #{r[:id]} is required"
    end
  end

  def check_string(r, element)
    check_max_and_min_for_string(r, element)
  end

  def check_id(r, element)
    check_max_and_min_for_string(r, element)
  end

  def check_max_and_min_for_string(r, element)
    if r[:max] && element.length > r[:max]
      raise Baldr::Error::ValidationError, "#{r[:id]} is too long: #{element.length} characters, maximum #{r[:max]}"
    end

    if r[:min] && element.length < r[:min]
      raise Baldr::Error::ValidationError, "#{r[:id]} is too short: #{element.length} characters, minimum #{r[:min]}"
    end
  end

  def check_time(r, element)
    if r[:max] && element.length > r[:max]
      raise Baldr::Error::ValidationError,  "#{r[:id]} is too long: #{element.length} characters, maximum #{r[:max]}"
    end
  end

  def check_date(r, element)
    if r[:max] && element.length > r[:max]
      raise Baldr::Error::ValidationError,  "#{r[:id]} is too long: #{element.length} characters, maximum #{r[:max]}"
    end
  end

  def check_number(r, element)
    value = element.to_s
    if r[:max] && value.length > r[:max]
      raise Baldr::Error::ValidationError,  "#{r[:id]} is too long: #{value.length} characters, maximum #{r[:max]}"
    end
    if value.match(/[^\d-]/)
      raise Baldr::Error::ValidationError,  "#{r[:id]} has invalid symbols: #{value}"
    end
  end

  def check_real(r, element)
    value = element.to_s
    if r[:max] && value.length > r[:max]
      raise Baldr::Error::ValidationError,  "#{r[:id]} is too long: #{value.length} characters, maximum #{r[:max]}"
    end
  end

  def check_complex(r, element)

  end

  def remove_excess_segments(loop, segment)
    difference = loop.segments.size - segment[:max]
    (loop.segments - (loop.segments.pop(difference)))
  end

end
