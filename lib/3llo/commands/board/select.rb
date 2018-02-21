module Tr3llo
  module Command
    module Board
      class SelectCommand
        def execute
          user_id = $container.resolve(:user)[:id]
          boards = API::Board.find_all_by_user(user_id)
          selected_board_id = select_board(boards)
          board = load_board(selected_board_id)

          $container.register(:board, board)

          interface.print_frame do
            interface.puts("Board #{board.name.labelize} selected")
          end
        end

        private

        def select_board(boards)
          interface.input.select("Board to select: ", board_choices(boards))
        end

        def board_choices(boards)
          boards.map { |board| [board.name, board.id] }.to_h
        end

        def load_board(board_id)
          API::Board.find(board_id)
        end

        def interface
          $container.resolve(:interface)
        end
      end
    end
  end
end
