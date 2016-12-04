module Baldr::Grammar::Version4010::Set310

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
      {id: 'B2A', min:0, max: 1},
      {id: 'N9', min: 0, max: 15},
      {id: 'V1', min: 1, max: 2},
      {id: 'C3', min: 0, max: 1},
      {id: 'N1', min: 1, max: 10, level: [
        {id: 'N2', min: 0, max: 1},
        {id: 'N3', min: 0, max: 2},
        {id: 'N4', min: 0, max: 1}
      ]},
      {id: 'R4', min: 1, max: 20, level: [
        {id: 'DTM', min: 0, max: 15},
      ]},
      {id: 'LX', min: 1, max: 9999, level: [
        {id: 'N7', min: 0, max: 9999, level: [
          {id: 'QTY', min: 0, max: 1},
          {id: 'M7', min: 0, max: 5}
        ]},
       {id: 'L0', min: 0, max: 120, level:[
         {id: 'L5', min: 0, max: 9999},
       ]}, 
      ]},
      {id: 'L3', min: 1, max: 1},
      {id: 'L1', min: 0, max: 20}, 
      {id: 'SE', min: 1, max: 1},
    ]
  }.freeze
end
