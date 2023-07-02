require 'test_helper'

class ConsultasTest < ActiveSupport::TestCase
  test "should create consulta" do
    assert_difference('Consulta.count') do
      consulta = Consulta.new
      assert consulta.save
    end
  end

  test "should find consulta by id" do
    consulta = Consulta.find_by(id: 1)
    assert_not_nil consulta
  end
end
