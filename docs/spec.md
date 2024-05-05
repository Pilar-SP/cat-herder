# Implementation details
## Backend
Ruby on rails
SQLite

## Front end
React
Tailwinds

## priority
priority is a single decimlar place float, where 1.0 is highest priory and 5.0 is lowerest. 

# Milestones
## Milestone 1
### Projects
Basic CRUD
Projects have a name, priority and description
Projects will have tasks

### Tasks
Baisc CRUD
Tasks have a name, priority, description and status
For M1 status options will be hardcoded

### Landing / view all page
A page that lists all tasks from all projects, sorted based on priority

### Deployment
M1 will be complete when the above is implemented and cat herder can be deployed with docker.

## For Future Milestones
### users and authentication
### comments on tasks
### link tasks
  allow a way of linking tasks with a depends on / blocked by, their priority and status linked
  e.g.
  if task b is blocked by task a, task b will have a low priorty and status "blocked". once task a is completed then the status and priority of task b is updated
### milestones
  projects can have milestones that have tasks
### changing priorty of project changed the priorty of it's milestones and task accordingly
### custom status
### deployment flexibility
 e.g. allow use of different DBs
### sorting
### custom search / views

