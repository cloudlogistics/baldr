module Baldr::Grammar::Version4060::Set850

  extend self

  def structure
    STRUCTURE
  end

  def record_defs
    Baldr::Grammar::Version4060::RECORD_DEFS
  end

  FUNCTIONAL_GROUP = 'PO'

  STRUCTURE = {
    id: 'ST', min: 1, max: 1, level: [
      {id: 'BEG', min: 1, max: 1},
      {id: 'CUR', min: 0, max: 1},
      {id: 'REF', min: 0, max: 99999},
      {id: 'PER', min: 0, max: 3},
      {id: 'TAX', min: 0, max: 99999},
      {id: 'FOB', min: 0, max: 99999},
      {id: 'CTP', min: 0, max: 99999},
      {id: 'PAM', min: 0, max: 10},
      {id: 'CSH', min: 0, max: 5},
      {id: 'TC2', min: 0, max: 99999},
      {id: 'SAC', min: 0, max: 25, level: [
        {id: 'CUR', min: 0, max: 1},
      ]},
      {id: 'ITD', min: 0, max: 99999},
      {id: 'DIS', min: 0, max: 20},
      {id: 'INC', min: 0, max: 1},
      {id: 'DTM', min: 0, max: 10},
      {id: 'LDT', min: 0, max: 12},
      {id: 'LIN', min: 0, max: 5},
      {id: 'SI', min: 0, max: 99999},
      {id: 'PID', min: 0, max: 200},
      {id: 'MEA', min: 0, max: 40},
      {id: 'PWK', min: 0, max: 25},
      {id: 'PKG', min: 0, max: 200},
      {id: 'TD1', min: 0, max: 2},
      {id: 'TD5', min: 0, max: 12},
      {id: 'TD3', min: 0, max: 12},
      {id: 'TD4', min: 0, max: 5},
      {id: 'MAN', min: 0, max: 10},
      {id: 'PCT', min: 0, max: 99999},
      {id: 'CTB', min: 0, max: 5},
      {id: 'TXI', min: 0, max: 99999},
      {id: 'AMT', min: 0, max: 99999, level: [
        {id: 'REF', min: 0, max: 99999},
        {id: 'DTM', min: 0, max: 1},
        {id: 'PCT', min: 0, max: 99999},
        {id: 'FA1', min: 0, max: 99999, level: [
          {id: 'FA2', min: 1, max: 99999},
        ]},
      ]},
      {id: 'N9', min: 0, max: 1000, level: [
        {id: 'DTM', min: 0, max: 99999},
        {id: 'MSG', min: 0, max: 1000},
      ]},
      {id: 'N1', min: 0, max: 200, level: [
        {id: 'N2', min: 0, max: 2},
        {id: 'N3', min: 0, max: 2},
        {id: 'N4', min: 0, max: 99999},
        {id: 'NX2', min: 0, max: 99999},
        {id: 'REF', min: 0, max: 12},
        {id: 'PER', min: 0, max: 99999},
        {id: 'SI', min: 0, max: 99999},
        {id: 'FOB', min: 0, max: 1},
        {id: 'TD1', min: 0, max: 2},
        {id: 'TD5', min: 0, max: 12},
        {id: 'TD3', min: 0, max: 12},
        {id: 'TD4', min: 0, max: 5},
        {id: 'PKG', min: 0, max: 200},
      ]},
      {id: 'LM', min: 0, max: 99999, level: [
        {id: 'LQ', min: 1, max: 99999},
      ]},
      {id: 'SPI', min: 0, max: 99999, level: [
        {id: 'REF', min: 0, max: 5},
        {id: 'DTM', min: 0, max: 5},
        {id: 'MSG', min: 0, max: 50},
        {id: 'N1', min: 0, max: 20, level: [
          {id: 'N2', min: 0, max: 2},
          {id: 'N3', min: 0, max: 2},
          {id: 'N4', min: 0, max: 1},
          {id: 'REF', min: 0, max: 20},
          {id: 'G61', min: 0, max: 1},
          {id: 'MSG', min: 0, max: 50},
        ]},
        {id: 'CB1', min: 0, max: 99999, level: [
          {id: 'REF', min: 0, max: 20},
          {id: 'DTM', min: 0, max: 5},
          {id: 'LDT', min: 0, max: 1},
          {id: 'MSG', min: 0, max: 50},
        ]},
      ]},
      {id: 'ADV', min: 0, max: 99999, level: [
        {id: 'DTM', min: 0, max: 99999},
        {id: 'MTX', min: 0, max: 99999},
      ]},
      {id: 'PO1', min: 1, max: 100000, level: [
        {id: 'LIN', min: 0, max: 99999},
        {id: 'SI', min: 0, max: 99999},
        {id: 'CUR', min: 0, max: 1},
        {id: 'CN1', min: 0, max: 1},
        {id: 'PO3', min: 0, max: 25},
        {id: 'CTP', min: 0, max: 99999, level: [
          {id: 'CUR', min: 0, max: 1},
        ]},
        {id: 'PAM', min: 0, max: 10},
        {id: 'MEA', min: 0, max: 40},
        {id: 'PID', min: 0, max: 1000, level: [
          {id: 'MEA', min: 0, max: 10},
        ]},
        {id: 'PWK', min: 0, max: 25},
        {id: 'PO4', min: 0, max: 99999},
        {id: 'REF', min: 0, max: 99999},
        {id: 'PER', min: 0, max: 3},
        {id: 'SAC', min: 0, max: 25, level: [
          {id: 'CUR', min: 0, max: 1},
          {id: 'CTP', min: 0, max: 1},
        ]},
        {id: 'IT8', min: 0, max: 1},
        {id: 'CSH', min: 0, max: 99999},
        {id: 'ITD', min: 0, max: 2},
        {id: 'DIS', min: 0, max: 20},
        {id: 'INC', min: 0, max: 1},
        {id: 'TAX', min: 0, max: 99999},
        {id: 'FOB', min: 0, max: 99999},
        {id: 'SDQ', min: 0, max: 500},
        {id: 'IT3', min: 0, max: 5},
        {id: 'DTM', min: 0, max: 10},
        {id: 'TC2', min: 0, max: 99999},
        {id: 'TD1', min: 0, max: 1},
        {id: 'TD5', min: 0, max: 12},
        {id: 'TD3', min: 0, max: 12},
        {id: 'TD4', min: 0, max: 5},
        {id: 'PCT', min: 0, max: 99999},
        {id: 'MAN', min: 0, max: 10},
        {id: 'MSG', min: 0, max: 99999},
        {id: 'SPI', min: 0, max: 99999},
        {id: 'TXI', min: 0, max: 99999},
        {id: 'CTB', min: 0, max: 99999},
        {id: 'QTY', min: 0, max: 99999, level: [
          {id: 'SI', min: 0, max: 99999},
        ]},
        {id: 'SCH', min: 0, max: 200, level: [
          {id: 'TD1', min: 0, max: 2},
          {id: 'TD5', min: 0, max: 12},
          {id: 'TD3', min: 0, max: 12},
          {id: 'TD4', min: 0, max: 5},
          {id: 'REF', min: 0, max: 99999},
        ]},
        {id: 'PKG', min: 0, max: 200, level: [
          {id: 'MEA', min: 0, max: 99999},
        ]},
        {id: 'LS', min: 0, max: 1, level: [
          {id: 'LDT', min: 1, max: 99999, level: [
            {id: 'QTY', min: 0, max: 99999},
            {id: 'MSG', min: 0, max: 1},
            {id: 'REF', min: 0, max: 3},
            {id: 'LM', min: 0, max: 99999, level: [
              {id: 'LQ', min: 1, max: 99999},
            ]},
          ]},
          {id: 'LE', min: 1, max: 1},
        ]},
        {id: 'N9', min: 0, max: 1000, level: [
          {id: 'DTM', min: 0, max: 99999},
          {id: 'MEA', min: 0, max: 40},
          {id: 'MSG', min: 0, max: 1000},
        ]},
        {id: 'N1', min: 0, max: 200, level: [
          {id: 'N2', min: 0, max: 2},
          {id: 'N3', min: 0, max: 2},
          {id: 'N4', min: 0, max: 1},
          {id: 'QTY', min: 0, max: 99999},
          {id: 'NX2', min: 0, max: 99999},
          {id: 'REF', min: 0, max: 12},
          {id: 'PER', min: 0, max: 3},
          {id: 'SI', min: 0, max: 99999},
          {id: 'DTM', min: 0, max: 1},
          {id: 'FOB', min: 0, max: 1},
          {id: 'SCH', min: 0, max: 200},
          {id: 'TD1', min: 0, max: 2},
          {id: 'TD5', min: 0, max: 12},
          {id: 'TD3', min: 0, max: 12},
          {id: 'TD4', min: 0, max: 5},
          {id: 'PKG', min: 0, max: 200},
          {id: 'LDT', min: 0, max: 99999, level: [
            {id: 'MAN', min: 0, max: 10},
            {id: 'QTY', min: 0, max: 5},
            {id: 'MSG', min: 0, max: 1},
            {id: 'REF', min: 0, max: 3},
          ]},
        ]},
        {id: 'SLN', min: 0, max: 1000, level: [
          {id: 'MSG', min: 0, max: 99999},
          {id: 'SI', min: 0, max: 99999},
          {id: 'PID', min: 0, max: 1000},
          {id: 'PO3', min: 0, max: 104},
          {id: 'TC2', min: 0, max: 99999},
          {id: 'ADV', min: 0, max: 99999},
          {id: 'DTM', min: 0, max: 10},
          {id: 'CTP', min: 0, max: 25},
          {id: 'PAM', min: 0, max: 10},
          {id: 'PO4', min: 0, max: 1},
          {id: 'TAX', min: 0, max: 3},
          {id: 'N9', min: 0, max: 99999, level: [
            {id: 'DTM', min: 0, max: 99999},
            {id: 'MSG', min: 0, max: 99999},
          ]},
          {id: 'SAC', min: 0, max: 25, level: [
            {id: 'CUR', min: 0, max: 1},
            {id: 'CTP', min: 0, max: 1},
          ]},
          {id: 'QTY', min: 0, max: 99999, level: [
            {id: 'SI', min: 0, max: 99999},
          ]},
          {id: 'N1', min: 0, max: 10, level: [
            {id: 'N2', min: 0, max: 2},
            {id: 'N3', min: 0, max: 2},
            {id: 'N4', min: 0, max: 1},
            {id: 'NX2', min: 0, max: 99999},
            {id: 'REF', min: 0, max: 12},
            {id: 'PER', min: 0, max: 3},
            {id: 'SI', min: 0, max: 99999},
          ]},
        ]},
        {id: 'AMT', min: 0, max: 99999, level: [
          {id: 'REF', min: 0, max: 1},
          {id: 'PCT', min: 0, max: 99999},
        ]},
        {id: 'LM', min: 0, max: 99999, level: [
          {id: 'LQ', min: 1, max: 99999},
        ]},
      ]},
      {id: 'CTT', min: 0, max: 1, level: [
        {id: 'AMT', min: 0, max: 1},
      ]},
      {id: 'SE', min: 1, max: 1},
    ]
  }.freeze
end
