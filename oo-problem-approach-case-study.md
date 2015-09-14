### Example Time: Volunteer Coordination App

We're writing some software to help our friend Lynne organize the enthusiastic volunteer base for the Joshua Tree Music Festival.  The volunteers do a lot of jobs that keep the festival running.  For example, they collect the trash, check wristbands at the festival gate, provide childcare at the kids booth, direct traffic in the parking lots, serve beer at the beer garden, and so much more ...

Lynne's been using a spreadsheet to keep track of what the jobs are, when these jobs need to be done, and who's signed up for what job and time slot.  Now she would like us to create an app that will let her set up the jobs, then have volunteers sign up for the 3 time slots that work for them.  Then Lynne can review the list of volunteers signed up for each job at each time slot.

### User Stories
- As a coordinator, I would like to create jobs
- As a coordinator, I would like to see a list of the jobs
- As a coordinator, I would like to see a list of the volunteers
- As a coordinator, I would like to see the schedule

- As a volunteer, I would like see what jobs are available
- As a volunteer, I would like to see the time slots for these jobs
- As a volunteer, I would like to sign up for a job and 3 time slots
- As a volunteer, I would like to see the job and time slots I
am signed up for

### Nouns and Verbs
- nouns: jobs, shifts, volunteers
- verbs: define jobs, define shifts, list jobs, list shifts for a job, sign up for jobs, sign up for shifts, list volunteers for a job, list volunteers for a shift, list a volunteer's job and shifts.

### Sketching the Objects
- Job
  - Attributes: name, shifts
  - Methods: list_shifts
- Volunteer
  - Attributes: name, job, shifts
  - Methods: sign_up, list_my_schedule
- Shift
  - Attributes: time
  - Methods:

### Design Decision Driver Code
```ruby
# Which one of these do we prefer and why?
# What OO design choices does each line reflect?
volunteer.sign_up(job)
job.sign_up(volunteer)
```

### Changing Requirements

Lynne now wants to be able to limit the number of volunteers for each shift, because some jobs and shifts are more popular than others.  How would you change the design to reflect this new reqiurement?  Which object should encapsulate this new information?  How should it be stored?  See if you can add this code on your own.
