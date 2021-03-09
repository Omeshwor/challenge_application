require 'rails_helper'

RSpec.describe Challenge, type: :model do
  it { is_expected.to belong_to(:user)}

  it { is_expected.to have_db_column(:title).of_type(:string)}
  it { is_expected.to have_db_column(:description).of_type(:text)}
  it { is_expected.to have_db_column(:start_date).of_type(:datetime)}
  it { is_expected.to have_db_column(:end_date).of_type(:datetime)}
  it { is_expected.to have_db_column(:active).of_type(:boolean)}
  it { is_expected.to have_db_column(:goal).of_type(:decimal)}
  it { is_expected.to have_db_column(:created_at).of_type(:datetime)}
  it { is_expected.to have_db_column(:updated_at).of_type(:datetime)}
end
