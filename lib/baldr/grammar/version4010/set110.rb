module Baldr::Grammar::Version4010::Set110

  extend self

  def structure
    STRUCTURE
  end

  def record_defs
    Baldr::Grammar::Version4010::RECORD_DEFS
  end

  FUNCTIONAL_GROUP = 'IM'

  STRUCTURE = {
    id: 'ST', min: 1, max: 1, level: [
      {id: 'B3', min: 1, max: 1},
      {id: 'B3A', min:0, max: 1},
      {id: 'C3', min: 0, max: 1},
      {id: 'N1', min: 0, max: 3, level: [
        {id: 'N2', min: 0, max: 1},
        {id: 'N3', min: 0, max: 2},
        {id: 'N4', min: 0, max: 1},
        {id: 'N9', min: 0, max: 10}
      ]},
      {id: 'LX', min: 1, max: 9999, level: [
        {id: 'P1', min:0, max: 1},
        {id: 'R1', min:0, max: 1},
        {id: 'POD', min:0, max: 1}
      ]},
      {id: 'L5', min:1, max: 4, level: [
        {id: 'L0', min:0, max: 1},
        {id: 'L4', min:0, max: 6},
        {id: 'L10', min:0, max: 4},  
        {id: 'SL1', min:0, max: 1}
      ]},
      {id: 'L1', min: 0, max: 30}, 
      {id: 'L3', min: 1, max: 1},
      {id: 'SE', min: 1, max: 1}
    ]
  }.freeze
end