module Baldr::Grammar::Version4060::Set210

  extend self

  def structure
    STRUCTURE
  end

  def record_defs
    Baldr::Grammar::Version4060::RECORD_DEFS
  end

  FUNCTIONAL_GROUP = 'IM'

  STRUCTURE = {
    id: 'ST', min: 1, max: 1, level: [
      {id: 'B3', min: 1, max: 1},
      {id: 'C3', min: 0, max: 1},
      {id: 'ITD', min: 0, max: 1},
      {id: 'L11', min: 0 , max: 300},
      {id: 'K1', min: 0, max: 10},
      {id: 'N1', min: 0, max: 10, level: [
        {id: 'N2', min: 0, max: 1},
        {id: 'N3', min: 0, max: 2},
        {id: 'N4', min: 0, max: 1},
        {id: 'N9', min: 0, max: 5},
        {id: 'L11', min: 0, max: 5},
      ]},
      {id: 'OID', min: 0, max: 1},
      {id: 'LX', min: 0, max: 9999, level: [
        {id: 'L11', min: 0, max: 20},
        {id: 'L5', min: 0, max: 30},
        {id: 'L0', min: 0, max: 10},
        {id: 'L1', min: 0, max: 10},
        {id: 'L4', min: 0, max: 10},
        {id: 'L7', min: 0, max: 10},
        {id: 'K1', min: 0, max: 10},
        {id: 'OID', min: 0, max: 1},
        {id: 'N1', min: 0, max: 999999, level: [
          {id: 'N2', min: 0, max: 1},
          {id: 'N3', min: 0, max: 2},
          {id: 'N4', min: 0, max: 1},
          {id: 'L11', min: 0, max: 5},
          {id:'CD3' , min: 0, max: 1, level: [
            {id:'L11', min: 0, max: 20},
            {id:'L9', min: 0, max: 10},
            {id:'POD', min: 0, max: 1},
            {id:'G62', min: 0, max: 1}
          ]},
          {id: 'OID', min: 0, max: 1},
        ]},
      ]}, 
      {id: 'L3', min: 0, max: 1},
      {id: 'SE', min: 1, max: 1},
    ]
  }.freeze
end