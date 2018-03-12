class App<Roda
    route do |r|
      r.root do
        r.redirect "kyc-registry"
      end
      r.on "kyc-registry" do
          r.get do
            view "kyc_form/index"
          end
      end
    end
end
