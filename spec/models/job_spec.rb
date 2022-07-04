RSpec.describe Job, type: :model do
  it "has a valid factory" do
    # Check that the factory we created is valid
    expect(build(:job)).to be_valid
  end

  describe "model attributes" do
    it { should have_db_column(:id).of_type(:integer) }
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:description).of_type(:text) }
    it { should have_db_column(:created_at).of_type(:datetime) }
    it { should have_db_column(:updated_at).of_type(:datetime) }
  end

  describe "model associations" do
    it { should have_many(:applications) }
    it { should have_many(:users) }
  end
end
