require "./lib/board"

describe Board do
    describe "#create board" do
        board_test =  Board.new
        it "creates a new board" do
            expect(board_test.board).to eql([[],[],[],[],[],[],[]])
        end
    end
    describe "#board to evaluate" do
        board_test =  Board.new
        it "handles blank boards" do
            board_test.board = [[],[],[],[],[],[],[]]
            expect(board_test.board_to_evaluate).to eql([[[""],[""],[""],[""],[""],[""],[""]],
                                                        [[""],[""],[""],[""],[""],[""],[""]],
                                                        [[""],[""],[""],[""],[""],[""],[""]],
                                                        [[""],[""],[""],[""],[""],[""],[""]],
                                                        [[""],[""],[""],[""],[""],[""],[""]],
                                                        [[""],[""],[""],[""],[""],[""],[""]],
                                                        [[""],[""],[""],[""],[""],[""],[""]]])
        end
        it "fill with [''] the free spaces in the board variable" do
            board_test.board = [[["x"],["x"]],[],[],[],[],[],[]]
            expect(board_test.board_to_evaluate).to eql([[["x"],["x"],[""],[""],[""],[""],[""]],
                                                        [[""],[""],[""],[""],[""],[""],[""]],
                                                        [[""],[""],[""],[""],[""],[""],[""]],
                                                        [[""],[""],[""],[""],[""],[""],[""]],
                                                        [[""],[""],[""],[""],[""],[""],[""]],
                                                        [[""],[""],[""],[""],[""],[""],[""]],
                                                        [[""],[""],[""],[""],[""],[""],[""]]])
        end
        it "the function handles filled columns" do
            board_test.board = [[["o"],["o"],["x"],["x"],["x"],["x"],["o"]],[],[],[],[],[],[]]
            expect(board_test.board_to_evaluate).to eql([[["o"],["o"],["x"],["x"],["x"],["x"],["o"]],
                                                        [[""],[""],[""],[""],[""],[""],[""]],
                                                        [[""],[""],[""],[""],[""],[""],[""]],
                                                        [[""],[""],[""],[""],[""],[""],[""]],
                                                        [[""],[""],[""],[""],[""],[""],[""]],
                                                        [[""],[""],[""],[""],[""],[""],[""]],
                                                        [[""],[""],[""],[""],[""],[""],[""]]])
        end
        it "the function does not affect the board-object variable" do
            board_test.board = [[],[],[],[],[],[],[]]
            board_test.board_to_evaluate
            expect(board_test.board).to eql([[],[],[],[],[],[],[]])
        end
        xit "does not output error if board is filled(is a draw)"do
            
        end
    end
    describe "#check game status" do
        xit "win in row" do
            board_test.board = [[["x"]],[["x"]],[["x"]],["O"],[["O"]],[["O"]],[["O"]]]
            expect(board_test.check_status).to eql(true)
        end
        xit "win in column" do
            board_test.board = [[["o"],["o"],["x"],["x"],["x"],["x"]],[],[],[],[],[],[]]
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
    describe "#make a move" do
        xit "moves recognizes player" do
            
        end
        xit "a move in a clean board" do
            
        end
        xit "a move in a board with pieces" do
            
        end
        xit "can't make a move in a filled column" do
            
        end
    end
    describe "#print board" do
        
    end
end