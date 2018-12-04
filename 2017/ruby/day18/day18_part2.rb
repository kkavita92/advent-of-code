file_path = File.expand_path("../input.txt", __FILE__)
input = File.read(file_path)

instructions = input.strip.split("\n")

class Duet

  def initialize(instructions)
    @instructions = instructions
    @p1_queue = []
    @p2_queue = []
    @waiting = true
    @sent = 0
  end

  def create_programme_registry(pid)
    reg = Hash.new(0)
    reg["p"] = pid
    return reg
  end

  def solve_part2
    reg1 = create_programme_registry(0)
    reg2 = create_programme_registry(1)
    index1 = 0
    index2 = 0

    loop do
      index1 = run_program(@instructions, reg1, index1, @p2_queue, @p1_queue)
      index2 = run_program(@instructions, reg2, index2, @p1_queue, @p2_queue)

      @sent += @p1_queue.size

      break if @waiting == false
      break if both_queues_empty?
    end

    @sent
  end

  def both_queues_empty?
    @p1_queue.empty? && @p2_queue.empty?
  end

  def run_program(instructions, reg, index, sent_queue, received_queue)
    until index >= instructions.length
       cmd, value_x, value_y = instructions[index].split(" ")

       y = !!(value_y =~ /\d+/) ? value_y.to_i : reg[value_y]

      case cmd
      when 'snd'
         sent_queue << reg[value_x]
       when 'set'
         reg[value_x] = y
       when 'add'
         reg[value_x] += y
       when 'mul'
         reg[value_x] *= y
       when 'mod'
         reg[value_x] = reg[value_x] % y
       when 'rcv'
         return index if received_queue.size == 0 # Program terminates and returns index
         reg[value_x] = received_queue.shift
       when 'jgz'
         x = !!(value_x =~ /\d+/) ? value_x.to_i : reg[value_x]
         index += (y - 1) if x > 0
       end

       index += 1
    end

    @waiting = false
  end

end
