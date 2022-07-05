RSpec.describe Application, type: :model do
  it "has a valid factory" do
    # Check that the factory we created is valid
    expect(build(:application)).to be_valid
  end

  describe "model attributes" do
    it { should have_db_column(:id).of_type(:integer) }
    it { should have_db_column(:user_id).of_type(:integer) }
    it { should have_db_column(:job_id).of_type(:integer) }
    it { should have_db_column(:status).of_type(:string).with_options(default: :not_seen) }
    it { should have_db_column(:created_at).of_type(:datetime) }
    it { should have_db_column(:updated_at).of_type(:datetime) }
  end

  describe "model enums" do
    it do
      should define_enum_for(:status).with_values(seen: "SEEN", not_seen: "NOT_SEEN").backed_by_column_of_type(:string)
    end
  end

  describe "model associations" do
    it { should belong_to(:job) }
    it { should belong_to(:user) }
  end
end
