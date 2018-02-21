module Tr3llo
  module API
    module User
      extend self

      def find(user_id)
        url = "/members/#{user_id}"
        body = client.get(url, key: key, token: token)
        user_payload = JSON.parse(body)

        UserModel.new(user_payload)
      end

      def find_all_by_board(board_id)
        url = "/board/#{board_id}/members"
        body = client.get(url, key: key, token: token)

        JSON.parse(body).map do |user_payload|
          UserModel.new(user_payload)
        end
      end

      private

      def key
        $container.resolve(:configuration).api_key
      end

      def token
        $container.resolve(:configuration).api_token
      end

      def client
        $container.resolve(:api_client)
      end
    end
  end
end
