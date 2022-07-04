RSpec.describe User, type: :model do
  it "has a valid factory" do
    # Check that the factory we created is valid
    expect(build(:user)).to be_valid
  end

  describe "model attributes" do
    it { should have_db_column(:id).of_type(:integer) }
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:phone_number).of_type(:string) }
    it { should have_db_column(:password_digest).of_type(:string) }
    it { should have_db_column(:role).of_type(:string) }
    it { should have_db_column(:created_at).of_type(:datetime) }
    it { should have_db_column(:updated_at).of_type(:datetime) }
  end

  describe "model associations" do
    it { should have_many(:applications) }
    it { should have_many(:jobs) }
  end
end
