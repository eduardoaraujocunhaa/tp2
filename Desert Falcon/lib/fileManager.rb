
# Classe responsavel por ler o ranking e imprimir na tela.
class FileManager
  def initialize
    @file_name = 'ranking.txt'
    @hash_ranking = {}
    @sorted_hash = {}
  end

  def insert_player(player, score)
    File.open(@file_name, 'a+') do |f|
      f.puts player + ',' + score
    end
  end

  def read_players
    if File.size?(@file_name)
      File.open(@file_name, 'r') do |f1|
        f1.each do |line|
          key, value = line.chomp.split(',')
          @hash_ranking[key] = value.to_i
        end
      end
      sort_ranking
    else
      'Empty Ranking'
    end
  end

  def sort_ranking
    @sorted_hash = @hash_ranking.sort_by { |_name, points| -points }
    @sorted_hash = @sorted_hash.first(10)
    @sorted_hash.map { |k, v| "#{k}\t#{v}" }.join("\n")
  end
end
