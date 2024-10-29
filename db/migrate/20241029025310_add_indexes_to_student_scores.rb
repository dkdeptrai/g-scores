class AddIndexesToStudentScores < ActiveRecord::Migration[7.1]
  def change
    add_index :student_scores, [:toan, :vat_li, :hoa_hoc]
  end
end
