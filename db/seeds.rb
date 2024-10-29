BATCH_SIZE = 100000
StudentScore.delete_all
total_count = 0
start_time = Time.now
batch = []

CSV.foreach('db/dataset/diem_thi_thpt_2024.csv', headers: true) do |row|

  def convert_score(value)
    return nil if value.nil? || value.strip.empty?
    value.to_f
  end

  batch << {
    sbd: row['sbd'],
    toan: convert_score(row['toan']),
    ngu_van: convert_score(row['ngu_van']),
    ngoai_ngu: convert_score(row['ngoai_ngu']),
    vat_li: convert_score(row['vat_li']),
    hoa_hoc: convert_score(row['hoa_hoc']),
    sinh_hoc: convert_score(row['sinh_hoc']),
    lich_su: convert_score(row['lich_su']),
    dia_li: convert_score(row['dia_li']),
    gdcd: convert_score(row['gdcd']),
    ma_ngoai_ngu: row['ma_ngoai_ngu']
  }

  if batch.size >= BATCH_SIZE
    StudentScore.insert_all!(batch)
    total_count += batch.size
    puts "Loaded #{total_count} records"
    batch = []
  end
end

if batch.any?
  StudentScore.insert_all!(batch)
  total_count += batch.size
end

elapsed_time = Time.now - start_time
puts "Data loaded successfully!"
puts "Total time: #{elapsed_time.round(2)} seconds"
puts "Total records: #{total_count}"
puts "Average speed: #{(total_count / elapsed_time).round(2)} records/second"
