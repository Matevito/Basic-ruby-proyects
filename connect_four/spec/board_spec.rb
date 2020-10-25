require "./lib/board"

describe Board do
    describe "create board" do
        board_test =  Board.new
        it "creates a new board" do
            expect(board_test.board).to eql([[],[],[],[],[],[],[]])
        end
    end
    describe "check game status" do
        xit "win in row" do
            board_test.board = [[["x"]],[["x"]],[["x"]],["O"],[["O"]],[["O"]],[["O"]]]
            expect(board_test.check_status).to eql(true)
        end
        xit "win in column" do
            board_test.board = [[["o"],["o"],["x"],["x"],["x"],["x"],],[],[],[],[],[],[]]
            expect(board_test.check_status).to eql(true)
        end
        xit "win in diagonal (l-r)" do
            board_test.board = [[["x"]],
                                [["x"],["o"]],
                                [["o"],["x"],["o"]],
                                [["x"],["x"],["x"],["o"]],
                                [["o"],["x"],["x"],["o"],["o"]],
                                [],
                                []]
            expect(board_test.check_status).to eql(true)                  
        end
        xit "win in diagonal(r-l)" do
            board_test.board = [[["x"]],
                                [["x"],["o"],["o"],["x"]],
                                [["o"],["o"],["x"]],
                                [["x"],["x"],["x"],["o"]],
                                [["x"],["x"],["x"],["o"],["o"]],
                                [],
                                []]
            expect(board_test.check_status).to eql(true) 
        end
        xit "is a draw" do
            # todo: put draw board/ or maybe just the condition(filled board and no winner)
            expect(board_test.check_status).to eql("draw")
        end
    end
end