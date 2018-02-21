module Tr3llo
  module API
    module Board
      extend self

      def find_all_by_user(user_id)
        body = client.get(
          "/members/#{user_id}/boards",
          key: api_key,
          token: api_token
        )

        JSON.parse(body).map do |board_payload|
          BoardModel.new(board_payload)
        end
      end

      def find(board_id)
        body = client.get(
          "/boards/#{board_id}",
          key: api_key,
          token: api_token,
        )
        BoardModel.new(JSON.parse(body))
      end

      private

      def client
        container.resolve(:api_client)
      end

      def api_key
        container.resolve(:configuration).api_key
      end

      def api_token
        container.resolve(:configuration).api_token
      end

      def container
        $container
      end
    end
  end
end
