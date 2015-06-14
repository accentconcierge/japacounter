require 'test_helper'

class JapasControllerTest < ActionController::TestCase
  setup do
    @japa = japas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:japas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create japa" do
    assert_difference('Japa.count') do
      post :create, japa: { comment: @japa.comment, rounds: @japa.rounds, user_id: @japa.user_id }
    end

    assert_redirected_to japa_path(assigns(:japa))
  end

  test "should show japa" do
    get :show, id: @japa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @japa
    assert_response :success
  end

  test "should update japa" do
    patch :update, id: @japa, japa: { comment: @japa.comment, rounds: @japa.rounds, user_id: @japa.user_id }
    assert_redirected_to japa_path(assigns(:japa))
  end

  test "should destroy japa" do
    assert_difference('Japa.count', -1) do
      delete :destroy, id: @japa
    end

    assert_redirected_to japas_path
  end
end
