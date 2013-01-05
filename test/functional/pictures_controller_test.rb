require 'test_helper'

class PicturesControllerTest < ActionController::TestCase
  setup do
    @picture = pictures(:pone)
    sign_in users(:uone)
 end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pictures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create picture" do
    assert_difference('Picture.count') do
      post :create, picture: { description: @picture.description, gallery: @picture.gallery, name: @picture.name, parent: @picture.parent, rating: @picture.rating, type: @picture.type, user_id: @picture.user_id }
    end

    assert_redirected_to picture_path(assigns(:picture))
  end

  test "should show picture" do
    get :show, id: @picture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @picture
    assert_response :success
  end

  test "should update picture" do
    put :update, id: @picture, picture: { description: @picture.description, gallery: @picture.gallery, name: @picture.name, parent: @picture.parent, rating: @picture.rating, type: @picture.type, user_id: @picture.user_id }
    assert_redirected_to picture_path(assigns(:picture))
  end

  test "should destroy picture" do
    assert_difference('Picture.count', -1) do
      delete :destroy, id: @picture
    end

    assert_redirected_to pictures_path
  end
end
