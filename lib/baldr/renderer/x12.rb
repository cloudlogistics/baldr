module Baldr::Renderer::X12

  extend self

  #TODO: There is an implicit out-of-band knowledge of which character is used
  #      for the component separator in envelope.rb ; this needs to be removed
  #      and the addition/construction of that character should be done here.
  DEFAULT_SEPARATORS = {
    element: '*',
    segment: '~',
    component: '>',
  }.freeze

  def draw(segments, params = {})
    segments = Array.wrap(segments)
    separators = params[:separators] || DEFAULT_SEPARATORS
    separators[:segment] = separators[:segment].pack('c*') if separators[:segment].is_a?(Array)
    segments.map{ |s| draw_segment(s, separators).join }.join
  end

  def draw_segment(segment, separators)
    a = [segment.id] + segment.elements.reverse.drop_while{ |i| i.nil? }.reverse
    #TODO: due to construction methods, if the last element in a segment is nil,
    #      it won't currently be printed, and if another element requires it,
    #      no error will be thrown.

    #Due to the TODO item concerning the component separator, it is actively
    #removed from the below regex
    substitution_regex =
      Regexp.new "[#{separators.reject{|k,_| k.to_s == "component" }.values.join}]+"

    #This removes X12 control characters from any segement element that may have
    #them, removing potential parse conflicts.
    altered = a.map! { |value|
      value.nil? ? nil :
      value.gsub(substitution_regex,"")
    }

    ["#{a.join(separators[:element])}#{separators[:segment]}"] + segment.children.map{ |l| draw_loop(l, separators) }
  end

  def draw_loop(loop, separators)
    loop.segments.map { |s| draw_segment(s, separators) }
  end

end
