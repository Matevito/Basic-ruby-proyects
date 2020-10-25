require "./lib/player"

describe Player do
    name = "Diaz"
    player = Player.new(name)
    describe "#initialize" do
        it "player variable  != to nil" do
            expect(player).not_to eql(nil)
        end
        it "creates @name variable" do
            expect(player.name).to eql("Diaz")
        end
    end
end