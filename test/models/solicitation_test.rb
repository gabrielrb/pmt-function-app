require 'test_helper'

class SolicitationTest < ActiveSupport::TestCase
  def test_valid
    assert solicitations(:one).valid?
    refute Solicitation.new.valid?
  end
end
