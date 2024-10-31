class StudentScore < ApplicationRecord

  # TODO: Implement invalidating the cache when data is changed

  self.primary_key = 'sbd'

  def self.group_a_top
    select("sbd, toan, vat_li, hoa_hoc,
          COALESCE(toan, 0) + COALESCE(vat_li, 0) + COALESCE(hoa_hoc, 0) AS group_a_score")
      .order("group_a_score DESC")
      .limit(10)
  end

  def self.report
    report = {}

    subjects = [:toan, :vat_li, :hoa_hoc, :ngu_van, :ngoai_ngu, :sinh_hoc, :lich_su, :dia_li, :gdcd]

    subjects.each do |subject|
      report[subject] = {
        gioi: count_scores(subject, 8.0, 10.0),
        kha: count_scores(subject, 6.0, 8.0),
        trung_binh: count_scores(subject, 4.0, 6.0),
        yeu: count_scores(subject, 0.0, 4.0)
      }
    end

    report
  end

  def self.count_scores(subject, min, max)
    where("#{subject} >= ? AND #{subject} < ?", min, max).count
  end
end
