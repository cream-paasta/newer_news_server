class ApplicationController < ActionController::API

  protected

  def success_msg
    { code: Rack::Utils.status_code(:ok), msg: '정상 처리 되었습니다' }
  end

  def failure_msg
    { code: Rack::Utils.status_code(:internal_server_error), msg: '처리되지 못 했습니다' }
  end

end
