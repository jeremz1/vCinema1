require File.dirname(__FILE__) + '/../test_helper'
require 'certificates_controller'

# Re-raise errors caught by the controller.
class CertificatesController; def rescue_action(e) raise e end; end

class CertificatesControllerTest < Test::Unit::TestCase
  def setup
    @controller = CertificatesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
