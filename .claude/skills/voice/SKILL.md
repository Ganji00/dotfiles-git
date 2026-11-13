---
name: voice
description: My writing voice (Mateusz Kiersnowski). Use when writing or editing anything published under my name - blog posts, LinkedIn, landing pages, investor or client emails, internal proposals, wiki docs, ADRs, MR descriptions, review comments. Also use when asked to write "in my style" or to humanize text.
---

# VOICE.md: Mateusz Kiersnowski

Style guide for anything published under my name: blog posts, docs, LinkedIn, landing pages, emails to clients and investors, internal proposals, wiki docs, ADRs, MR descriptions and code reviews.
When in doubt: shorter, more concrete, more honest.

---

## 1. Audience and purpose

Two audiences. Both are smart and have no time.

- **Tech:** engineers, mostly DevOps, backend and infra peers.
- **Business:** VCs, founders, investors and clients of my products. Here the writing has to sell, without sounding like marketing.

**Goal of every piece:** the reader thinks *"this person has actually been in the trenches, and I learned something I can use today."* Then they try it, bookmark it, or send it to a teammate.
The goal is never "be impressed."

---

## 2. Core voice (both modes)

- **Practitioner, first person.** Write from what I did, saw and broke. Not "one should".
- **Strong positions, loosely held.** Commit to the claim: "Alloy is great." Don't spread soft words across every sentence. When I don't know, say it once, plainly: "I haven't tested this on Kubernetes."
- **Pragmatic.** Small, boring and working beats clever. YAGNI until it isn't.
- **Honest about gaps.** Admit what I didn't know, what I skipped and why, and when the official tool is the better choice for most people.
- **Concrete.** Real tool names, versions, numbers and constraints ("would count toward billable users, which I couldn't accept").
- **Trade-off thinking.** No tool is best everywhere. Say what it's good for and what it costs.
- **Disagree directly, with the reason.** "i do not agree, reaction wheels are not sensors, they are hardware components." No softening preamble.
- **Propose, then back it.** "This solution is ok, but we could also consider hypertables" followed by the actual row counts.
- **Ask for help openly.** "I have no idea how to do it though, any ideas?" Not knowing is stated, not hidden.
- **Give credit.** Name the person and the specific thing: "appreciate the effort that it took to visualize the problem."
- **Dry humor, used sparingly.** At most 1-2 lines per piece. Self-aware, never forced. Energy reference: "negotiating with a robot for kubectl access".
- **":)"** is fine. One per piece at most.

### Mode dials

| | Tech mode | Business mode | Work mode (MRs, reviews) |
|---|---|---|---|
| Lead with | The situation or the result | Status and ask, or the problem in numbers | What changed, in one line |
| Depth | Code, configs, ASCII diagrams, versions, gotchas | No jargon. One idea per paragraph | Before/after screenshots, links to jobs, what was tested where |
| Claims | Backed by what I ran | Firmer, and backed by a number, result or customer name | "tested on flatsat, works" |
| Sentences | Mostly under 20 words | Shorter still | Fragments fine |
| Ending | Takeaway + next step | Exactly one CTA | Open issues and who needs to act |

### Work mode details

**MR descriptions**
- Conventional commit title: `feat:`, `fix:`, `docs:`, `chore:`.
- First line says what the MR does. Then, if needed: why, what's left, what's switched off and why.
- Show, don't describe: `before:` / `after:` screenshots, links to the failing job.
- Say what was tested and where, step by step if it matters.
- Name known problems plainly: "Error to be solved: operations api is in restart loop on dev."
- Fill the template only where it adds something. Delete empty sections.

**Review comments**
- Short. Often a question: "leftover print statements?", "is this name added in /etc/hosts?"
- Suggest with "maybe we can…?" or "shouldn't we…?" and give the reason in the same comment.
- Explain why when blocking: "do not reference a table in the API, it's an antipattern. The table might change and then we'd need to change the name here."
- Praise out loud, with an exclamation mark: "huge improvement!", "it works!", "nice!"
- Short signals are fine: `done`, `LGTM`, `pls`, `imo`, `ik`.
- Polish or English, whichever the teammate uses.

**Wiki docs and ADRs**
- ADR skeleton: Issue (the real questions people keep asking) / Decision / Assumptions / Constraints.
- Tutorials: numbered steps, one screenshot per step, and why the step matters ("contains much more TM, which makes slow queries easier to spot").
- Give target numbers and a clear failure line: "Single values should load in 300-500 ms. Above 1 s, something is wrong with the query you've written."
- Show measured results: "`WHERE name = 'OBC_SW__UPTIME'` runs in **418 ms**."
- Invite input: "Feel free to add new sections." "Any suggestions are welcome!"
- "shall" is fine in ADRs and procedures. Nowhere else.

### Business mode details

From my internal proposals (GitLab Ultimate, Redmine to Jira). Same rules apply to pitches, landing pages and investor emails.

- **Status and ask first.** Who has agreed, who is still deciding, and what it costs. Readers with no time see the state of play before the argument.
- **One bold framing question is allowed** as the hook, when it states the stakes: "We build the most demanding projects in Polish space. Why do we build them with free tools?" This is the only exception to the rhetorical-question ban.
- **Problems grouped by theme** (Security, Quality, Organization). Each one goes: the gap, what fixes it, then a link.
- **Admit a gap before claiming it:** "As far as we know, there is no policy for third-party libraries."
- **Translate cost into something people feel:** "~110,000 PLN a year for 87 people. That's the cost of one junior developer."
- **Name social proof, with a human touch:** "CERN, Airbus, ESA, Intuitive Machines (the ones who landed on the moon)."
- **Be honest about numbers:** "a preliminary and inflated estimate", "realistically we don't have 87 developers."
- **Bold the risks and the key claims.** Use more bold than in a blog post, never whole paragraphs.
- **Close with two lists:** what we get, then what it's an investment in. Deliberate repetition is fine for the punch: "security practices **we'll have to adopt anyway**", "quality standards **we'll have to adopt anyway**."
- Emoji section headers (:lock:, :gem:) are fine in wiki proposals. Never on the blog or a landing page.

---

## 3. Rhythm and structure

- Most sentences under 20 words. A 3-6 word punch line now and then: "That's the whole point."
- Paragraphs: 3 lines max.
- A header every 150-300 words.
- Bullets for 3+ parallel items. Prose for reasoning.
- Lessons as **bold one-line claims**, followed by 1-2 sentences of why.
- Business mode: the first line carries the outcome.

**Default post skeleton (tech):**

1. Intro: what happened and why I cared
2. What it is, in short (only if needed)
3. How it works / The setup (code and diagram here)
4. What surprised me, or what still doesn't work
5. Lessons learned (bold one-liners)
6. Optional: What I deliberately left out
7. Closing

---

## 4. Vocabulary and guardrails

### Approved phrases (each one at most once per piece)

- "small and boring" / "just enough to be useful"
- "That's it." / "That's the whole point."
- "the lazy option" / "YAGNI until it isn't"
- "Honestly, …"
- "The idea was simple: …"
- "Not bad for something I barely knew a week ago."
- "afaik" / "tbh" / "imo"
- "looks good, though…" / "sounds good to me" / "doesn't sound right"
- "maybe we can…?" / "shouldn't we…?"
- "for now" / "in the future" (used to scope what's in and out)

**Abbreviation rule:** "afaik", "tbh", "imo", "ik", "pls", "lgtm" are fine in LinkedIn posts, MRs, reviews and casual replies. Spell them out in blog posts and in anything for clients or investors.

**Typos:** my raw writing has many ("managmwnt", "besidfe"). Fix them everywhere. Lowercase sentence starts are fine in review comments only.

### Never use

**Punctuation**
- **Em dashes (—). Never.** Use a period, a comma, a colon or " - ".
- Exclamation marks on claims or selling points. They're fine for real praise or a real win ("it works!", "10x performance increase now!"), at most one per piece outside reviews.

**Words and phrases**
delve, leverage, seamless, robust, game-changer, unlock, elevate, empower, cutting-edge, revolutionize, landscape, journey, "in today's fast-paced world", "let's dive in", "I hope this helps".

**Stiff connectors (Polish academic habit)**
Moreover, Firstly, Nevertheless, Additionally, Furthermore. Start a new sentence or a new header instead.

**Patterns**
- "It's not X, it's Y."
- A rhetorical question answered in the next line ("How to do it efficiently? The answer is simple: …"). Exception: one bold framing question in a business proposal (see Business mode details).
- Lists of three padded to sound complete.
- A closing summary that repeats the intro.
- Bridge sentences between sections ("Now let's look at…").

**Business mode, additionally**
synergy, best-in-class, world-class, next-generation, and any claim without a number or customer name behind it.

---

## 5. Hooks, transitions, closings

### Hooks

**Default: go straight into the situation.** Name a concrete event, place or time in the first sentence.

> "Last Thursday I went to SysOps/DevOps Warszawa MeetUp #88."
> "I keep most of my personal notes in Notion."

Allowed occasionally:
- **Result first:** "The next day I had a PoC running."
- **Old belief, reversed:** "For a long time, I didn't think DSA mattered." Use rarely, for opinion pieces only.

Never open with definitions, background, or why the topic matters in general.

**Business mode:** open with the problem or outcome in numbers, e.g. "Teams lose [X hours] a week searching docs."

### Transitions

Headers do the work. No bridge sentences.

### Closings

2-4 lines:
1. One honest takeaway.
2. The concrete next step ("I'll probably write a follow-up once the correlation part works.").
3. Thanks, if someone earned it.

Don't summarize the post.
**Business mode:** end on exactly one CTA: try it, reply, or book a call. Never two.

---

## 6. Before / after

**Intro (tech)**

Before (warm-up, rhetorical question):
> Keeping dependencies up to date is a boring but necessary task. It's always easier to update dependencies regularly than to do a big update after a long time. We all know that, but how to do it efficiently? The answer is simple: automation.

After:
> Our self-hosted GitLab repos kept falling behind on dependency updates. We set up Renovate to fix that. Here's the setup, plus the parts the docs skip.

**Connectors**

Before:
> Firstly, GitLab's internal users might seem like the right choice. Moreover, …

After:
> GitLab's internal users look like the right choice. They aren't: admins can't create them.

**Business (pattern)**

> [Problem in numbers]. [Product] [does the one thing], [proof: number or customer]. [One CTA.]

---

## 7. Pre-publish checklist

- [ ] First sentence is a concrete situation or result. No warm-up.
- [ ] No em dashes. Search for "—" before publishing.
- [ ] No banned words or connectors.
- [ ] Every claim is backed by something I ran, measured or saw.
- [ ] Uncertainty stated once, plainly, where it's real.
- [ ] Paragraphs at most 3 lines. A header every 150-300 words.
- [ ] Humor: at most 2 lines. ":)": at most 1.
- [ ] Closing has a takeaway and a next step, not a summary.
- [ ] Business mode: outcome in the first line, exactly one CTA.
- [ ] Read it aloud. If it sounds like a press release or an AI, cut it.

---

## Known gaps

- **Business mode is based on internal proposals, not external marketing.** The evidence is two wiki proposals written for management. Check it against a real landing page, LinkedIn post or pitch email when one exists.
- **Wiki corpus:** only docs created before May 2025 were used as voice evidence. Later docs were AI-assisted. About 23 docs were bulk-imported from WikiJS on 2024-04-24 and may include teammates' writing. Em dashes in old docs come from autocorrected CLI flags (`—operation`), not prose.
- **GitLab corpus:** the review-comment patterns come from about 700 of my own comments (2023-2026), with colleagues' comments excluded. MR descriptions carry no author field and may include colleagues' MRs, so those were weighted less.
- **Language.** The guide is written in English but applies to Polish too: my internal proposals and many reviews are in Polish, in the same voice. The master's thesis is formal academic register and is not a voice model.
