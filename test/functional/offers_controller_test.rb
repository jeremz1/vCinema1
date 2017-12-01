require File.dirname(__FILE__) + '/../test_helper'
require 'offers_controller'

# Re-raise errors caught by the controller.
class OffersController; def rescue_action(e) raise e end; end

class OffersControllerTest < Test::Unit::TestCase
  def setup
    @controller = OffersController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
