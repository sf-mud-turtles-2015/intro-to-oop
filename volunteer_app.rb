class Shift
  attr_reader :time

  def initialize(time:)
    @time = time
  end

  def to_s
    "#{@time}"
  end
end

class Job
  attr_reader :name, :shifts

  def initialize(name:, shifts:)
    @name = name
    @shifts = shifts
  end

  def to_s
    "\n------------------\n #{@name} \n------------------\n Shifts: #{@shifts.join(", ")}"
  end
end

class Volunteer
  attr_reader :name, :job, :shifts

  def initialize(name:)
    @name = name
  end

  def sign_up(job:, shifts:)
    @job = job
    @shifts = shifts
  end

  def to_s
    "#{@name} is signed up for #{@job.name} on #{@shifts.join(", ")}"
  end
end

module ShiftFactory

  def self.create(times:)
    times.map { |time| Shift.new({:time => time}) }
  end

end

module JobFactory

  def self.create(jobs:)
    jobs.map { |job| Job.new({:name => job.fetch(:name),
                              :shifts => job.fetch(:shifts)}) }
  end
end

### Driver Code
# Create some shifts with a factory
shifts = ShiftFactory.create({:times => ["Saturday morning",
                                         "Saturday afternoon",
                                         "Saturday night",
                                         "Sunday morning",
                                         "Sunday afternoon",
                                         "Sunday night"]})
# Create some jobs with a factory
jobs = JobFactory.create({:jobs => [{:name => "Childcare", :shifts => shifts},
                                    {:name => "Bartending", :shifts => shifts},
                                    {:name => "Wristband Checking", :shifts => shifts},
                                    {:name => "Parking Lot", :shifts => shifts}]})
# Let's take a look at them
puts "Here are the available volunteer jobs."
puts jobs
puts ""

# Create a volunteer and sign him up for a job and some shifts
volunteer_johnjoe = Volunteer.new({:name => "JohnJoe Jones"})
volunteer_johnjoe.sign_up({:job => jobs.first, :shifts => shifts.sample(3)})
puts volunteer_johnjoe
