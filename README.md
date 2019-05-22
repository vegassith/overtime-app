# Overtime App

## Key requirement: company needs documentation that salaried employees did or did not get overtime each week

## Models:
- ~~Post -> date:date rationale:text~~
- ~~User -> Devise~~
- ~~AdminUser -> STI of User~~
- AuditLog

## Features:
- Approval Workflow
  - Status to post
     - submitted
     - rejected
     - approved
  - status required
  - status default value
  - implement approval stages
  - Locking Posts
- SMS Sending (Twillo) -> Link to approval or overtime input
- ~~Administrate -> Admin Dashboard~~
- ~~Block Non admin users and guest users~~
- Email Summary to mangers for approval
- Needs to be documented if employee did not log an overtime

## UI:
- ~~Boostrap -> formatting~~
- ~~Icons from Font Awesome~~
- ~~Update the styles for forms~~

## SMS Sending
- Schedule to run at Sunday at 5pm 
  - Use whenever to schedule job
- Iterate over all employees
- Skip AdminUsers
- Send a messages that has instructions and a link to log time
- ~~Integrate validation for phone attr in Users:~~
  - ~~No spaces or dashes for Phone Number~~
  - ~~has to be 10 characters~~
  - ~~has to be numeric~~

## AuditLog
- Keep track of if an employee had overtime or not
- Dependecies:
  - User
- Attrs:
  - user:references
  - Status:integer (enum) -> pending, complete
  - start_date:date -> default previous Monday
  - date_verified 
 
## Refactor TODOS:
- ~~Refactor user assocation integration test in post_spec~~
- ~~Add full name method~~
- ~~Refactor posts/_form for admin user with status~~
- Refactor nav bar for current_user bloack and AdminUser Dashboard link
- ~~Fix post_spec to use factories~~