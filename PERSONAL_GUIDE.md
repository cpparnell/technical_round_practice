# Guide
## General Workflow
According to Matt Pocock himself, here is the order his skills should generally be used in with some personal input:

#### 1. `/setup-matt-pocock-skills`

First time setup for the repo. Configures repo for use by the workflow defined below. Use the plain-markdown issue tracker for the sake of the interview to keep it simple.

#### 2. `/grill-me` *or* `/grilling` *or* `/grill-with-docs`

Provide the big idea of what you are trying to implement. In terms of this exercise, you should essentially provide the brief, along with (importantly, for the sake of the interview) your own overarching architecutral / user experience ideas.

#### 3. `/to-spec`

After getting thouroughly interviewed by the griller on what exactly this should look like, have the agent write a spec out. **Make a point to have specify that you want to follow TDD**. Review the *whole* spec. This shows that you aren't just a meat proxy loading the slop cannon. Ask questions about vague concepts until you have a strong idea of what is going to be implmented. It would also be a good idea here to establish must-haves vs. stretch items given you are practicing a time-boxed interview.

#### 4. `/to-tickets`

This will split the spec into tickets organized in a DAG. Each ticket has its blocking edges so the agent knows what tickets must be done in what order. You should ask for it to output checkable completion steps so you can keep track of agent progress.

#### 5. **Now fan out as many agents as there are unblocked tickets** using `/implement`. Ask them to run in parallel agent sessions, and continue to pick up tickets as they are unblocked, prioritizing must-haves over stretch items. Manually review code as it comes in, you should be able to explain the output you are seeing.

#### 7. `/code-review`

This should automatically trigger when `/implement` finishes a ticket (or maybe the whole spec?), but we should confirm this as we use the skills.

## Phase Specifics

### Planning Phase (45m)

In the planning phase, we should get to the point of the spec, and be able to fully defend the choices made in it. Start by fleshing out what the requirements are, what the scope is, which features are must-have and which are nice-to-haves, etc. with the interviewer. Should not even talk to agent for 10+ mins.

#### Questions to ask:

### Building Phase (100m - 45m w/ interviewer, 55m alone)

### Review Phase (30m)