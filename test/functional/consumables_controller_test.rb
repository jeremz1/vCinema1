require File.dirname(__FILE__) + '/../test_helper'
require 'consumables_controller'

# Re-raise errors caught by the controller.
class ConsumablesController; def rescue_action(e) raise e end; end

class ConsumablesControllerTest < Test::Unit::TestCase
  def setup
    @controller = ConsumablesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
