require File.dirname(__FILE__) + '/../test_helper'
require 'tills_controller'

# Re-raise errors caught by the controller.
class TillsController; def rescue_action(e) raise e end; end

class TillsControllerTest < Test::Unit::TestCase
  def setup
    @controller = TillsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
