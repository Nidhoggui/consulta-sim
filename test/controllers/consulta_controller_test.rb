require "test_helper"

class ConsultaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @consultum = consulta(:one)
  end

  test "should get index" do
    get consulta_url
    assert_response :success
  end

  test "should get new" do
    get consult
    assert_response :success
  end

  test "should create consultum" do
    assert_difference("Consultum.count") do
      post consulta_url, params: { consultum: { data: @consultum.data, horario: @consultum.horario, medico_id: @consultum.medico_id, paciente_id: @consultum.paciente_id } }
    end

    assert_redirected_to consult(Consultum.last)
  end

  test "should show consultum" do
    get consult(@consultum)
    assert_response :success
  end

  test "should get edit" do
    get consult(@consultum)
    assert_response :success
  end

  test "should update consultum" do
    patch consult(@consultum), params: { consultum: { data: @consultum.data, horario: @consultum.horario, medico_id: @consultum.medico_id, paciente_id: @consultum.paciente_id } }
    assert_redirected_to consult(@consultum)
  end

  test "should destroy consultum" do
    assert_difference("Consultum.count", -1) do
      delete consult(@consultum)
    end

    assert_redirected_to consulta_url
  end
end
