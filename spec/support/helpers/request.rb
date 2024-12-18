module Helpers
  module Request
    def post_multipart(url, params: {}, headers: {})
      post(url, params: params.to_json,
                headers: headers.merge('Content-type' => 'multipart/from-data'))
    end

    def post_json(url, params: {}, headers: {})
      post(url, params: params.to_json,
                headers: headers.merge('Content-type' => 'application/json', 'Accept' => 'application/json'))
    end

    def put_json(url, params: {}, headers: {})
      put(url, params: params.to_json,
               headers: headers.merge('Content-type' => 'application/json', 'Accept' => 'application/json'))
    end

    def delete_json(url, params: {}, headers: {})
      delete(url, params: params.to_json,
                  headers: headers.merge('Content-type' => 'application/json', 'Accept' => 'application/json'))
    end

    def jwt_token(user_id)
      {
        'session-token': JWT.encode(
          {
            uuid: user_id
          },
          Rails.configuration.jwt_secret_key,
          'HS512'
        )
      }
    end

    def get_xlsx(url, params: {}, headers: {})
      get((url + 'xlsx'), params:, headers:)
    end
  end
end
