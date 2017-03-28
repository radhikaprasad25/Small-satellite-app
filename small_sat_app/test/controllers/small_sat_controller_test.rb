require 'test_helper'

class SmallSatControllerTest < ActionDispatch::IntegrationTest
  test "should get distributed_systems" do
    get small_sat_distributed_systems_url
    assert_response :success
  end

  test "should get missions" do
    get small_sat_missions_url
    assert_response :success
  end

  test "should get intersatellite_communications" do
    get small_sat_intersatellite_communications_url
    assert_response :success
  end

  test "should get design_parameters" do
    get small_sat_design_parameters_url
    assert_response :success
  end

end
