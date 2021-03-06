require 'test_statistics_helper'

class ForemanStatistics::Api::V2::StatisticsControllerTest < ActionController::TestCase
  setup do
    @routes = ForemanStatistics::Engine.routes
  end

  test 'should get statistics' do
    get :index
    assert_response :success
    response = ActiveSupport::JSON.decode(@response.body)
    assert_not response.empty?
    expected_keys = %w[arch_count cpu_count env_count klass_count
                       mem_free mem_size mem_totfree mem_totsize
                       model_count os_count swap_free swap_size]

    assert_equal expected_keys, response.keys.sort
  end
end
