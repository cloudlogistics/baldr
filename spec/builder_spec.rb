require 'spec_helper'

class GoodBuilderFromRealLife

  def build(builder)
    builder.ST do |st|
      st.ST01 '204'
      st.ST02 '000000006'

      st.B2 do |n|
        n.B202 'ODFL'
        n.B204 '04000000000000060'
        n.B206 'PP'
      end

      st.B2A do |n|
        n.B2A01 '00'
        n.B2A02 'ZZ'
      end

      st.G62 do |n|
        n.G6201 '64'
        n.G6202 '20121109'
      end

      segment_n1(st)

      st.S5 do
        S501 1
        S502 'CL'

        G62 do
          G6201 '10'
          G6202 '20121130'
          G6203 'I'
          G6204 '1400'
          G6205 'LT'
        end

        G62 do
          G6201 '10'
          G6202 '20121130'
          G6203 'K'
          G6204 '1630'
          G6205 'LT'
        end

        AT8 do
          AT801 'E'
          AT802 'L'
          AT803 145.0
          AT804 8
          AT806 'E'
          AT807 0
        end

        N1 do
          N101 'SH'
          N102 'AEROFLEX USA'

          N3 do
            N301 '1102 N Main st'
          end

          N4 do
            N401 'SWEETWATER'
            N402 'TN'
            N403 '37874'
            N404 'US'
          end
        end
      end

      st.S5 do
        S501 2
        S502 'CU'

        AT8 do
          AT801 'E'
          AT802 'L'
          AT803 145.0
          AT804 8
          AT806 'E'
          AT807 0
        end

        N1 do
          N101 'CN'
          N102 'Koch Air- INDY'

          N3 do
            N301 '5620 DIVIDEND DRIVE'
          end

          N4 do
            N401 'INDIANAPOLIS'
            N402 'IN'
            N403 '46241'
            N404 'US'
          end
        end

        OID do
          OID02 'K0822'
          OID04 'PC'
          OID05 1
          OID06 'L'
          OID07 145.0
          OID08 'E'
          OID09 0
        end
      end

      st.L3 do
        L301 145
        L302 'G'
        L309 0
        L310 'E'
        L311 8
        L312 'L'
      end
    end
  end

  def build_long(builder)
    builder.ST do |st|
      st.ST01 '204'
      st.ST02 '000000006'

      st.B2 do |n|
        n.B202 'ODFL'
        n.B204 '04000000000000060'
        n.B206 'PP'
      end

      st.B2A do |n|
        n.B2A01 '00'
        n.B2A02 'ZZ'
      end

      st.G62 do |n|
        n.G6201 '64'
        n.G6202 '20121109'
      end

      #This is 10 over the original number
      20.times do
        st.NTE do |nte|
          nte.NTE01 'OTH'
          nte.NTE02 "super special carrier instructions"
        end
      end

      segment_n1(st)

      st.S5 do
        S501 1
        S502 'CL'

        G62 do
          G6201 '10'
          G6202 '20121130'
          G6203 'I'
          G6204 '1400'
          G6205 'LT'
        end

        G62 do
          G6201 '10'
          G6202 '20121130'
          G6203 'K'
          G6204 '1630'
          G6205 'LT'
        end

        AT8 do
          AT801 'E'
          AT802 'L'
          AT803 145.0
          AT804 8
          AT806 'E'
          AT807 0
        end

        N1 do
          N101 'SH'
          N102 'AEROFLEX USA'

          N3 do
            N301 '1102 N Main st'
          end

          N4 do
            N401 'SWEETWATER'
            N402 'TN'
            N403 '37874'
            N404 'US'
          end
        end
      end

      st.S5 do
        S501 2
        S502 'CU'

        AT8 do
          AT801 'E'
          AT802 'L'
          AT803 145.0
          AT804 8
          AT806 'E'
          AT807 0
        end

        N1 do
          N101 'CN'
          N102 'Koch Air- INDY'

          N3 do
            N301 '5620 DIVIDEND DRIVE'
          end

          N4 do
            N401 'INDIANAPOLIS'
            N402 'IN'
            N403 '46241'
            N404 'US'
          end
        end

        OID do
          OID02 'K0822'
          OID04 'PC'
          OID05 1
          OID06 'L'
          OID07 145.0
          OID08 'E'
          OID09 0
        end
      end

      st.L3 do
        L301 145
        L302 'G'
        L309 0
        L310 'E'
        L311 8
        L312 'L'
      end
    end
  end

  def segment_n1(parent)
    parent.N1 do
      N101 'BT'
      N102 'AEROFLEX USA'

      N3 do
        N301 '282 Industrial Park Road'
      end

      n4 = create(:N4)
      n4.N401 'Sweetwater'
      n4.N402 'TN'
      n4.N403 '37874'
      n4.N404 'US'

      G61 do
        G6101 'IC'
        G6102 'Local Telephone'
        G6103 'TE'
        G6104 '4233372493'
      end
    end
  end

end

class BadBuilderFromRealLife

  def build(builder)
    builder.ST do |st|
      st.ST01 '204'
      st.ST02 '000000006'

      st.B2 do |n|
        n.B202 'ODFL'
        n.B204 '04000000000000060'
        n.B206 'PP'
      end

      st.B2A do |n|
        n.B2A01 '00'
        n.B2A02 'ZZ'
      end

      st.G62 do |n|
        n.G6201 '64'
        n.G6202 '20121109'
      end

      segment_n1(st)

      st.S5 do
        S501 '1'
        S502 'CL'

        G62 do
          G6201 '10'
          G6202 '20121130'
          G6203 'I'
          G6204 '1400'
          G6205 'LT'
        end

        G62 do
          G6201 '10'
          G6202 '20121130'
          G6203 'K'
          G6204 '1630'
          G6205 'LT'
        end

        AT8 do
          AT801 'E'
          AT802 'L'
          AT803 '145'
          AT804 '8'
          AT806 'E'
          AT807 '0'
        end

        N1 do
          N101 'SH'
          N102 'AEROFLEX USA'

          N3 do
            N301 '1102 N Main st'
          end

          N4 do
            N401 'SWEETWATER'
            N402 'TN'
            N403 '37874'
            N404 'US'
          end
        end
      end

      st.S5 do
        S501 '2'
        S502 'CU'

        AT8 do
          AT801 'E'
          AT802 'L'
          AT803 '145'
          AT804 '8'
          AT806 'E'
          AT807 '0'
        end

        OID do
          OID02 'K0822'
          OID04 'PC'
          OID05 '1'
          OID06 'L'
          OID07 '145'
          OID08 'E'
          OID09 '0'
        end

        N1 do
          N101 'CN'
          N102 'Koch Air- INDY'

          N3 do
            N301 '5620 DIVIDEND DRIVE'
          end

          N4 do
            N401 'INDIANAPOLIS'
            N402 'IN'
            N403 '46241'
            N404 'US'
          end
        end
      end

      st.L3 do
        L301 '145'
        L302 'G'
        L309 '0'
        L310 'E'
        L311 '8'
        L312 'L'
      end
    end
  end

  def segment_n1(parent)
    parent.N1 do
      N101 'BT'
      N102 'AEROFLEX USA'

      N3 do
        N301 '282 Industrial Park Road'
      end

      n4 = create(:N4)
      n4.N401 'Sweetwater'
      n4.N402 'TN'
      n4.N403 '37874'
      n4.N404 'US'

      G61 do
        G6101 'IC'
        G6102 'Local Telephone'
        G6103 'TE'
        G6104 '4233372493'
      end
    end
  end

end

describe Baldr::Builder do

  it 'should build the same EDI as spec/support/edi_files/valid/204/1.EDI' do
    file = 'spec/support/edi_files/valid/204/1.EDI'
    input = File.read(file)

    b = Baldr::Builder.new(
      #standard_version_number: '',
      sender_id: '4233372493',
      sender_id_qualifier: 'ZZ',
      receiver_id_qualifier: '02',
      receiver_id: 'ODFL',
      date_time: DateTime.parse('121109 1642'),
      interchange_control_number: '000000002',
      usage_indicator: 'P',
      acknowledgment_requested: '1',
      functional_groups_control_numbers: {
        'SM' => '2'
      }
    )

    GoodBuilderFromRealLife.new.build(b)

    b.build_functional_groups
    b.prepare!
    Baldr::Types.convert_before_render!(b.envelope, Baldr::Grammar::Envelope)
    Baldr::Validator.validate!(b.envelope, Baldr::Grammar::Envelope)

    separators = {
      component: '>',
      segment: "\n",
      element: '*'
    }
    output = Baldr::Renderer::X12.draw(b.envelope, {separators: separators})
    output.should eq input
  end

  it 'should truncate special characters on draw' do
    file = 'spec/support/edi_files/valid/204/1.EDI'
    input = File.read(file)

    #TODO: There is implicit knowledge of how the external file is constructed
    #      here, as evidenced by the construction & assumption of separators.
    #      Ideally, all of this should be in code.
    separators = {
      component: '>',
      segment: "\n",
      element: '*'
    }

    b = Baldr::Builder.new(
      #standard_version_number: '',
      sender_id: '4233372493',
      sender_id_qualifier: 'ZZ',
      receiver_id_qualifier: '02',
      receiver_id: 'ODFL',
      date_time: DateTime.parse('121109 1642'),
      interchange_control_number: '000000002',
      usage_indicator: 'P',
      acknowledgment_requested: '1',
      functional_groups_control_numbers: {
        'SM' => '2'
      }
    )

    GoodBuilderFromRealLife.new.build(b)

    b.build_functional_groups
    #Pull a value and substitute it for the relevant checked separators
    value = b.envelope.transactions.first['S5'].first['G62'].first['G6204']
    value = separators[:segment] + separators[:element] + value
    b.envelope.transactions.first['S5'].first['G62'].first['G6204'] = value

    b.prepare!
    Baldr::Types.convert_before_render!(b.envelope, Baldr::Grammar::Envelope)
    Baldr::Validator.validate!(b.envelope, Baldr::Grammar::Envelope)


    output = Baldr::Renderer::X12.draw(b.envelope, {separators: separators})
    output.should eq input
  end

  it 'should throw error if too long and truncate is disabled' do
    b = Baldr::Builder.new(
      #standard_version_number: '',
      sender_id: '4233372493',
      sender_id_qualifier: 'ZZ',
      receiver_id_qualifier: '02',
      receiver_id: 'ODFL',
      date_time: DateTime.parse('121109 1642'),
      interchange_control_number: '000000002',
      usage_indicator: 'P',
      acknowledgment_requested: '1',
      functional_groups_control_numbers: {
        'SM' => '2'
      }
    )

    #This method will specifically add more data than is allowed by the grammar
    GoodBuilderFromRealLife.new.build_long(b)
    b.build_functional_groups
    b.prepare!

    Baldr::Types.convert_before_render!(b.envelope, Baldr::Grammar::Envelope)
    expect {
      Baldr::Validator.validate!(b.envelope, Baldr::Grammar::Envelope, { truncate_loops: false })
    }.to raise_error(/loop is too long/)
  end

  it 'should truncate loops by default' do
    b = Baldr::Builder.new(
      #standard_version_number: '',
      sender_id: '4233372493',
      sender_id_qualifier: 'ZZ',
      receiver_id_qualifier: '02',
      receiver_id: 'ODFL',
      date_time: DateTime.parse('121109 1642'),
      interchange_control_number: '000000002',
      usage_indicator: 'P',
      acknowledgment_requested: '1',
      functional_groups_control_numbers: {
        'SM' => '2'
      }
    )

    #This method will specifically add more data than is allowed by the grammar
    GoodBuilderFromRealLife.new.build_long(b)
    b.build_functional_groups
    b.prepare!

    se01_orig_sum = b.envelope.transactions[0]['SE01']

    Baldr::Types.convert_before_render!(b.envelope, Baldr::Grammar::Envelope)
    Baldr::Validator.validate!(b.envelope, Baldr::Grammar::Envelope)

    se01_new_sum = b.envelope.transactions[0]['SE01']

    expect(se01_new_sum).to be < se01_orig_sum
  end

  it 'should update transaction sum' do
    b = Baldr::Builder.new(
      #standard_version_number: '',
      sender_id: '4233372493',
      sender_id_qualifier: 'ZZ',
      receiver_id_qualifier: '02',
      receiver_id: 'ODFL',
      date_time: DateTime.parse('121109 1642'),
      interchange_control_number: '000000002',
      usage_indicator: 'P',
      acknowledgment_requested: '1',
      functional_groups_control_numbers: {
        'SM' => '2'
      }
    )

    #This method will specifically add more data than is allowed by the grammar
    GoodBuilderFromRealLife.new.build_long(b)
    b.build_functional_groups
    b.prepare!

    se01_orig_sum = b.envelope.transactions[0]['SE01']

    Baldr::Types.convert_before_render!(b.envelope, Baldr::Grammar::Envelope)
    Baldr::Validator.validate!(b.envelope, Baldr::Grammar::Envelope, { truncate_loops: true })

    se01_new_sum = b.envelope.transactions[0]['SE01']

    expect(se01_new_sum).to be < se01_orig_sum
  end

  it 'should fail' do
    b = Baldr::Builder.new(
      sender_id: '4233372493',
      sender_id_qualifier: 'ZZ',
      receiver_id_qualifier: '02',
      receiver_id: 'ODFL',
      date_time: DateTime.parse('121109 1642'),
      interchange_control_number: '000000002',
    )

    BadBuilderFromRealLife.new.build(b)

    b.build_functional_groups
    b.prepare!

    lambda {
      Baldr::Validator.validate!(b.envelope, Baldr::Grammar::Envelope)
    }.should raise_error(Baldr::Error::ValidationError)

  end

end
