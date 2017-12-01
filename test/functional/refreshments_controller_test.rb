require File.dirname(__FILE__) + '/../test_helper'
require 'refreshments_controller'

# Re-raise errors caught by the controller.
class RefreshmentsController; def rescue_action(e) raise e end; end

class RefreshmentsControllerTest < Test::Unit::TestCase
  def setup
    @controller = RefreshmentsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
