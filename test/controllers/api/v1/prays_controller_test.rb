require "test_helper"

class Api::V1::PraysControllerTest < ActionDispatch::IntegrationTest
  def test_create_endpoint_returns_saves_new_pray
    assert_difference "Pray.count" do
      post api_v1_prays_create_path(
        {
          pray: {
            submitted_by: "Hector",
            pray: "I need a pray for Joe Doe he needs it."

          }
        }
      )
    end

    assert_response :success
  end
end
