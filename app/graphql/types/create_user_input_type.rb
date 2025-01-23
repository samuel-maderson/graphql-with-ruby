module Types
  class CreateUserInputType < Types::BaseInputObject
    # Define the fields for the input object
    argument :name, String, required: true
    argument :companyId, Integer, required: false
  end
end
