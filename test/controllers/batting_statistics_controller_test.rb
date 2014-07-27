require 'test_helper'

class BattingStatisticsControllerTest < ActionController::TestCase
  setup do
    @batting_statistic = batting_statistics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:batting_statistics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create batting_statistic" do
    assert_difference('BattingStatistic.count') do
      post :create, batting_statistic: { 2b: @batting_statistic.2b, 3b: @batting_statistic.3b, ab: @batting_statistic.ab, cs: @batting_statistic.cs, g: @batting_statistic.g, h: @batting_statistic.h, hr: @batting_statistic.hr, r: @batting_statistic.r, rbi: @batting_statistic.rbi, sb: @batting_statistic.sb, statistic_id: @batting_statistic.statistic_id }
    end

    assert_redirected_to batting_statistic_path(assigns(:batting_statistic))
  end

  test "should show batting_statistic" do
    get :show, id: @batting_statistic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @batting_statistic
    assert_response :success
  end

  test "should update batting_statistic" do
    patch :update, id: @batting_statistic, batting_statistic: { 2b: @batting_statistic.2b, 3b: @batting_statistic.3b, ab: @batting_statistic.ab, cs: @batting_statistic.cs, g: @batting_statistic.g, h: @batting_statistic.h, hr: @batting_statistic.hr, r: @batting_statistic.r, rbi: @batting_statistic.rbi, sb: @batting_statistic.sb, statistic_id: @batting_statistic.statistic_id }
    assert_redirected_to batting_statistic_path(assigns(:batting_statistic))
  end

  test "should destroy batting_statistic" do
    assert_difference('BattingStatistic.count', -1) do
      delete :destroy, id: @batting_statistic
    end

    assert_redirected_to batting_statistics_path
  end
end
