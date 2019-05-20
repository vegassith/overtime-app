# Overtime App

## Key requirement: company needs documentation that salaried employees did or did not get overtime each week

## Models:
- ~~Post -> date:date rationale:text~~
- ~~User -> Devise~~
- ~~AdminUser -> STI of User~~

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
- Icons from Font Awesome
- ~~Update the styles for forms~~

## Refactor TODOS:
- ~~Refactor user assocation integration test in post_spec~~
- ~~Add full name method~~

