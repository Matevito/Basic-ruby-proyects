require "./lib/c_cipher"

describe ".caesar_cipher" do
    it "all letters upper case" do
        expect(caesar_cipher("HOLA MUNDO",5)).to eql("MTQF RZSIT")
    end
    it "all letters down case" do
        expect(caesar_cipher("la vida es mierda",6)).to eql("rg bojg ky sokxjg")
    end
    it "mixed cases" do
        expect(caesar_cipher("Live can really be pretty weird, God!",15)).to eql("Axkt rpc gtpaan qt egtiin ltxgs, Vds!")
    end
    it "handles punctuation and spaces" do
        expect(caesar_cipher("Marie, have you something to tell me?",7)).to eql("Thypl, ohcl fvb zvtlaopun av alss tl?")
    end
    it "can handle big factors" do
        expect(caesar_cipher("try this Computer!",200)).to eql("ljq lzak Ugehmlwj!")
    end
    it "factor 0" do
        expect(caesar_cipher("The last test!",0)).to eql("The last test!")
    end
end