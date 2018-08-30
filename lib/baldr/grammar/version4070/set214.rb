module Baldr::Grammar::Version4070::Set214

  extend self

  def structure
    STRUCTURE
  end

  def record_defs
    Baldr::Grammar::Version4070::RECORD_DEFS
  end

  FUNCTIONAL_GROUP = 'QM'

  STRUCTURE = {
    id: 'ST', min: 1, max: 1, level: [
      {id: 'B10', min: 1, max: 1},
      {id: 'L11', min: 0, max: 300},
      {id: 'N1', min: 0, max: 10, level: [
        {id: 'N2', min: 0, max: 1},
        {id: 'N3', min: 0, max: 2},
        {id: 'N4', min: 0, max: 1},
        {id: 'G62', min: 0, max: 1},
        {id: 'L11', min: 0, max: 10},
      ]},
      {id: 'MS3', min: 0, max: 1},
      {id: 'LX', min: 0, max: 1, level: [
        {id: 'AT7', min: 0, max: 1, level: [
          {id: 'MS1', min: 0, max: 1},
        ]},
        {id: 'L11', min: 0, max: 10},
        {id: 'CD3', min: 0, max: 1, level: [
          {id: 'L11', min: 0, max: 20},
        ]},
        {id: 'PRF', min: 0, max: 999999},
        {id: 'CD3', min: 0, max: 999999, level: [
          {id: 'L11', min: 0, max: 20},
        ]},
      ]},
      {id: 'SE', min: 1, max: 1},
    ]
  }.freeze
end
