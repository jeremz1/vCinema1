require File.dirname(__FILE__) + '/../test_helper'
require 'films_controller'

# Re-raise errors caught by the controller.
class FilmsController; def rescue_action(e) raise e end; end

class FilmsControllerTest < Test::Unit::TestCase
  def setup
    @controller = FilmsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
