module Types
  class QueryType < Types::BaseObject
    # Field to fetch all users or a specific user by ID
    field :users, [ UserType ], null: false, description: "Fetch all users or a specific user by ID" do
      argument :id, ID, required: false, description: "ID of the user to fetch"
    end

    def users(id: nil)
      if id
        # Fetch all users
        response = HTTP.get("http://localhost:4000/users/#{id}")
        [ JSON.parse(response.body.to_s) ]
      else
        # Fetch all users
        response = HTTP.get("http://localhost:4000/users")
        JSON.parse(response.body.to_s)
      end
    end


    field :companies, [ CompanyType ], null: false, description: "Fetch all companies" do
      argument :id, ID, required: false, description: "ID to fetch a specific company"
    end

    def companies(id: nil)
      if id
        response = HTTP.get("http://localhost:4000/companies/#{id}")
        [ JSON.parse(response.body.to_s) ]
      else
        response = HTTP.get("http://localhost:4000/companies")
        JSON.parse(response.body.to_s)
      end
    end
  end
end
