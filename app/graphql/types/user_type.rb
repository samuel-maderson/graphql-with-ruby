module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :company, CompanyType, null: true, description: "The company the user belongs to"

    def company
      company_id = object["companyId"]
      response = HTTP.get("http://localhost:4000/companies/#{company_id}")
      JSON.parse(response.body.to_s)
    end
  end
end
