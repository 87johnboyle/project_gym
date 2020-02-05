require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../models/member')

class TestMember < MiniTest::Test

  def setup
    @member1 = Member.new({
      'first_name' => 'John',
      'last_name' => 'Boyle',
      'premium' => TRUE
      })
    end

    def test_member_first_name
      assert_equal("John", @member1.first_name)
    end

    def test_member_last_name
      assert_equal("Boyle", @member1.last_name)
    end

    def test_member_premium
      assert_equal(TRUE, @member1.premium)
    end



  end
