require "test_helper"

class OrganizationTest < ActiveSupport::TestCase
  test "Apartment discovers organizations dynamically" do
    assert_includes Apartment.tenant_names, organizations(:one).schema_name

    organization = Organization.create!(name: "New Organization", slug: "new-organization", schema_name: "new_organization")

    assert_includes Apartment.tenant_names, organization.schema_name
  end

  test "organizations use the shared public schema" do
    assert_includes Apartment.excluded_models, "Organization"
    assert_equal "public.organizations", Organization.table_name
  end
end
