# Tacite data model

## Core principle

Every user input should preserve three layers:

1. Raw note
   The exact text, voice transcript, emoji, tap input, or quick card input from the user.

2. Structured record
   Date, event type, treatment label, dose, symptoms, side effects, functioning, context, questions, or safety markers.

3. Editable summary
   A clear human-readable version, user-confirmed or user-edited.

The raw note is sacred. Never overwrite it.

## Main objects

### Profile

A private user profile.

Long-term product direction:

- no mandatory real name
- no mandatory email
- generated private profile ID
- local app lock
- recovery key
- optional email/passkey later for recovery or sync

Current technical spike:

- email-code auth exists for local testing
- this should not define the final product identity model

### Episode

A meaningful mental-health or treatment thread.

Examples:

- ABC treatment trial
- dose increase from 0.5 mg to 1 mg
- preparing first therapy appointment
- depression worsening since March
- ADHD/task initiation problems
- side effects after treatment change

Fields:

- id
- profile_id
- title
- type
- status
- start date
- end date
- goal
- main problem
- things to watch
- linked treatment labels
- linked appointment date
- created_at
- updated_at

### RawNote

The exact user input.

Fields:

- id
- profile_id
- episode_id
- raw_text
- raw_emojis
- input_type: text / voice / quick_tap / imported / check_in
- created_at
- event_date
- event_date_precision
- timezone
- ai_extraction_status
- user_confirmation_status
- is_deleted

### TimelineEvent

A visible event in the chronological story.

Can represent:

- treatment started
- treatment stopped
- dose increased
- dose decreased
- switch started
- taper started
- missed dose
- late dose
- extra dose
- side effect started
- side effect improved
- side effect resolved
- symptom snapshot
- therapy started
- therapy stopped
- appointment
- major life/context event
- safety note
- question for clinician

Fields:

- id
- profile_id
- episode_id
- raw_note_id
- event_type
- event_date
- event_date_precision
- title
- user_approved_summary
- source: manual / quick_card / ai_draft_confirmed / imported
- include_in_summary
- created_at
- updated_at

### StructuredRecord

A parent concept for records extracted from a raw note.

One raw note may create many structured records.

Types:

- medication_event
- symptom_snapshot
- side_effect_snapshot
- functioning_snapshot
- context_marker
- question_for_clinician
- safety_flag

### MedicationEvent

Fields:

- event_type
- event_date
- treatment_label
- dose_amount
- dose_unit
- dose_frequency
- time_of_day
- formulation
- previous_treatment_label
- planned_titration
- reason_for_change
- expected_benefit
- concerns
- source: user / prescriber_reported / imported_note

Important:

If the user records "my doctor said 0.5 mg for 7 days then 1 mg", Tacite records it as user-reported plan. Tacite must not phrase it as app advice.

### SymptomSnapshot

Fields:

- symptom_name
- severity_value_internal
- severity_label_user_facing
- direction_since_baseline: worse / same / better / unclear
- frequency
- burden
- free_note
- emoji_marker
- confidence
- source_note_id

Default lenses:

- mood
- anxiety
- focus
- task initiation
- sleep
- energy
- appetite
- irritability
- emotional blunting
- rumination
- social withdrawal
- work/study functioning
- self-care
- sexual function
- physical side effects
- safety

### SideEffectSnapshot

Fields:

- side_effect_name
- new_or_preexisting: new / already_present / worse / better / not_sure
- started_at
- ended_at
- severity
- frequency
- intensity
- burden
- note
- user_suspects_related_to_treatment: yes / no / unclear
- source_note_id

Side-effect categories:

- sleep disturbance
- sedation/fatigue
- nausea/digestion
- headache
- dizziness
- sweating
- tremor
- palpitations
- restlessness
- agitation
- anxiety worsening
- emotional blunting
- sexual side effects
- appetite change
- weight change
- dry mouth
- constipation
- brain zaps / withdrawal sensations
- other

### FunctioningSnapshot

Function matters. Tacite should not only track mood.

Domains:

- work/study
- home admin
- self-care
- social contact
- family/relationship function
- leisure
- leaving the house
- ability to start tasks
- ability to finish tasks
- eating/cooking
- sleep routine

Suggested values:

- could not do
- did with difficulty
- did okay
- better than usual
- not applicable

### ContextMarker

Useful for possible confounders.

Types:

- poor sleep
- work/school stress
- relationship event
- illness/infection
- pain
- travel/jet lag
- alcohol
- recreational substances
- caffeine change
- therapy session
- menstrual/hormonal context, optional
- exercise/activity change
- major life event

Tacite must avoid causal claims.

Allowed:

Anxiety increased during this period; recorded context included poor sleep and work stress.

Not allowed:

ABC caused anxiety.

### QuestionForClinician

Fields:

- question_text
- linked_episode_id
- linked_note_id
- priority
- user_marked_embarrassing_or_hard_to_say
- included_in_summary

### Summary

Fields:

- generated_text
- user_edited_text
- created_at
- exported_at
- included_sections
- source_episode_ids
- source_note_ids
- ai_used
- selected_range_type
- selected_range_start
- selected_range_end
