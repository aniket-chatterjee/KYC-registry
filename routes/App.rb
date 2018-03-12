class App<Roda
    route do |r|
      data=JSON.parse(request.body.read) rescue {}
      data = App.indifferent_data(data)

      r.on "kyc-registry" do
          r.on "new" do
            r.get do
              view "kyc_form/new"
            end
            r.post do
              p params.to_json
            end
          end
          r.on "update" do
            r.get do
              view "kyc_form/update"
            end
          end
          r.get do
            view "kyc_form/index"
          end
      end
      r.root do
        r.redirect "kyc-registry"
      end
    end
end
