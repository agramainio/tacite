# Tacite AI boundary

## Principle

AI is optional.

Tacite must be useful with AI off.

AI is a structured note clerk, not a therapist.

## AI can

- interpret messy notes
- extract dates
- extract treatment labels
- extract dose-like text
- extract symptom mentions
- extract side effect mentions
- extract functioning markers
- extract context markers
- extract questions for clinician
- suggest event type
- rephrase clearly
- draft summaries
- interpret emojis cautiously
- flag uncertainty

## AI must not

- diagnose
- give medical advice
- recommend medication changes
- infer causality
- invent symptoms
- hide uncertainty
- overwrite raw notes
- pretend certainty
- act like a therapist
- continue a therapy-like conversation

## AI extraction output

Plain JSON shape:

{
  "raw_note_id": "...",
  "episode_suggestion": {
    "episode_id": "...",
    "confidence": "medium"
  },
  "events": [],
  "symptoms": [],
  "side_effects": [],
  "functioning": [],
  "context": [],
  "safety_flags": [],
  "questions_for_clinician": [],
  "uncertain_items": [],
  "summary_draft": "",
  "medical_advice": null
}

## Emoji handling

Emojis are contextual signals, not medical facts.

Example:

{
  "emoji": "😵‍💫",
  "suggested_meaning": "foggy/dizzy/overwhelmed",
  "confidence": "low",
  "needs_user_confirmation": true
}

## Confirmation model

Do not use card-deck confirmation.

Use one compact interpretation:

I understood this as:

- Started treatment label ABC yesterday.
- Sleep worsened.
- Nausea appeared.
- Anxiety may be worse.
- Added question: Is this normal?

Actions:

- Looks right
- Edit
- Keep raw only

## Logging rule

Never log raw note content or AI payloads in backend logs.
