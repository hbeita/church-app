require "test_helper"

module Church
  module Api
    module V1
      class PrayPetitionsControllerTest < ActionDispatch::IntegrationTest
        def test_create_endpoint_returns_new_pray_petition
          assert_difference "PrayPetition.count" do
            post church_api_v1_pray_petitions_create_url(
              {
                pray_petition: {
                  pray_for: "Something",
                  pray_from: "Jon Doe"

                }
              }
            )
          end

          assert_response :success
        end
      end
    end
  end
end
