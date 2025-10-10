# Intro to Prompt Engineering

## Table of Contents

1. [Understanding Prompts](#1-understanding-prompts)
2. [Templates](#2-templates)
3. [Data Security & Privacy](#3-data-security--privacy)
4. [Resources](#4-resources)
5. [Key Takeaways](#5-key-takeaways)

---

## Overview

**One-liner**: Better questions elicit better answers. Prompt engineering is the primary lever for quality from 60 to 80.

---


## 1. Understanding Prompts

### Chapter Contents
- [1.1 What is a "Prompt"?](#11-what-is-a-prompt)
- [1.2 Why Prompts Matter](#12-why-prompts-matter)
- [1.3 Prompt Design Principles](#13-prompt-design-principles)
- [1.4 How to Write Good Prompts](#14-how-to-write-good-prompts)
- [1.5 Good Prompt Examples](#15-good-prompt-examples)

---

### Core Equation

```
Model Performance = LLM × (Tools + Prompt)
```

**Components**:
- **LLM (the chat model)**: Open-source or commercial models like ChatGPT, Gemini, DeepSeek, Grok, etc. (quick hands up)
- **Tools**: Plugins/integrations that access internal/external data or execute tasks (critical in Agents).
- **Prompt**: Instructions you tell the LLM to achieve the goal. In most scenarios, prompt design is the highest-leverage, lowest-cost way to improve accuracy.

###### Tips: Most companies start businesses using OpenAI/Anthropic APIs + prompt + RAG.

---
### 1.1 What is a "Prompt"?

A prompt is the input text you provide to an AI model to get a desired response. 

**Core Components:**
```
prompt = task + background + output
```



**Example:**
```
Task: email my manager about requesting time off next week for a family event
Background: be professional but also show that I've planned ahead
Output: email subject and content
```


---

### 1.2 Why Prompts Matter
```
AI is like a car with autopilot. Anyone can ride, but 
knowing how to steer lets you handle emergencies and drive safer.
```
Prompt helps the LLM understand what to focus on, transforming a knowledgeable speaker into a helpful assistant that solves problems in the following areas:

- Increase Accuracy
- Improve Readability & Maintainability (for Agents)
- Boost Output Stability
- Cost saving: Minimize back-and-forth and whole page regenerations

---

### 1.3 Prompt Design Principles

#### Sub-sections:
- [1.3.1 Accurate Wording](#131-accurate-wording)
- [1.3.2 Specificity](#132-specificity)
- [1.3.3 Conciseness](#133-conciseness)
- [1.3.4 Unambiguity](#134-unambiguity)
- [1.3.5 Helpful Guidance](#135-helpful-guidance)
- [1.3.6 Structure](#136-structure)
- [1.3.7 Give Examples](#137-give-examples)

---

#### 1.3.1 Accurate Wording
Use words, sentences, and instructions that are precise and clear, with standard vocabulary and correct grammar/spelling. Use action verbs (explain, compare, analyze, advise, generate, design).



**Examples**:
- ❌ **Bad**: "Tell me about this year's worldwide soccer game."
- ✅ **Good**: "In which country will the 2024 FIFA World Cup be held?"
---
#### 1.3.2 Specificity
For complex or domain-specific queries, tailor the prompt to your industry and job needs with context, background, keywords, and details.

**Context Types**:
- **Conversation history**: Prior Q&A informs the next response
- **Background**: User habits, location, expertise

**Example**: 
- In finance: "Analyze the portfolio" → Include risk metrics, sector allocation
- In marketing: "Analyze the portfolio" → Focus on brand positioning, market share

---

#### 1.3.3 Conciseness
Short, focused prompts are easier for AI to understand and execute. Long, unfocused prompts dilute intent.

**Examples**:
- ❌ **Bad**: "Can you please help me write something about artificial intelligence and machine learning, maybe including some examples of how they're used in different industries like healthcare, finance, and technology, and also talk about the benefits and challenges, and maybe include some future trends?"
- ✅ **Good**: "Write a 200-word overview of AI applications in healthcare, finance, and tech."

---

#### 1.3.4 Unambiguity
Avoid vague terms. If multiple interpretations exist, state the one you want.

**Examples**:
- ❌ **Vague**: "Tell me about this company."
- ✅ **Better**: "Provide NVIDIA's 2023 financial report highlights and market share data."
- ⚠️ **Ambiguous**: "Analyze the data" → clarify which dataset, metrics, or timeframe?

---

#### 1.3.5 Helpful Guidance

For generative tasks (writing, translation, summarization), steer style, tone, audience, persona and constraints (format, citations, sources).

**Examples**:
- ❌ **Generic**: "How to invest well?"
- ✅ **Tailored**: "I'm a professional quant in China A-shares. How should I invest?"
---

#### 1.3.6 Structure
For long context or complex workflows, keep the prompt structured and sequential (no contradictions). Use headings, lists, bullet points, Markdown or numbered outlines.


**Examples**:
- ❌ **Bad**: "Recommend a good book."
- ✅ **Good**: 
  ```
  Recommend a book using this format:
  
  Title: {Title}
  Author: {Author}
  Reason: {1-sentence reason}
  ```

---


#### 1.3.7 Give Examples (Few-shot / Multimodal)

Let the model infer patterns.

**Example**:
```markdown
# Task
Generate a book worth reading

# Example
Title: One Hundred Years of Solitude
Author: Gabriel García Márquez
Reason: This book explores the profound connection between human 
emotions and fate through its mysterious and rich magical realism style.

```

---

```markdown
# Output
Title: To Live
Author: Yu Hua
Reason: This is a deeply moving novel that authentically 
portrays China's social changes over half a century 
through the ups and downs of Fugui's life. 
With simple yet powerful narration, 
it explores the resilience of life and the meaning 
of human perseverance in adversity.
```
---------

### 1.4 How to Write Good Prompts

> **Key Insight**: Good prompts are tuned, not born.

**Important Notes**:
- Domain expertise matters
- If a coworker doesn't understand your prompt, the AI probably won't either

---

### 1.5 Good Prompt Examples

#### Sub-sections:
- [1.5.1 Email Writer](#151-email-writer)
- [1.5.2 Technical Project Manager](#152-technical-project-manager)
- [1.5.3 Daily Job Planner](#153-daily-job-planner)
- [1.5.4 Legal Counsel](#154-legal-counsel)

---

#### 1.5.1 Email Writer

**Context**: Professional workplace communication requiring polite, concise, and collaborative tone.

**Template**:
```markdown
Context:
I work in a professional environment and often need to email my coworkers. The tone should be polite, concise, and collaborative. The emails may involve updates, requests, or responses.

Objective:
Help me draft or edit an email that communicates my message effectively while maintaining professionalism and clarity.

Style:
Use a tone that is:

Courteous but direct
Neutral and professional (avoid overly formal or casual phrasing)
Concise — focus on clarity and purpose
Culturally appropriate for workplace communication

Task:
Write or refine my email to ensure it:

Has a clear subject line and logical structure
Opens with context or appreciation
States the main message or request succinctly
Ends with a polite closing and call to action (if needed)
Optionally includes a short sign-off

Action:
I will provide my rough draft or main points. You will return a polished, professional email version ready to send.

Result:
A final email draft that is polite, concise, and professional — suitable for workplace communication.
```

---

#### 1.5.1 Email Writer - Sample

**Sample Input**:
```
I need to email my manager about requesting time off next week for a family event. 
I want to be professional but also show that I've planned ahead.
```

---


**Sample Output without prompt**:

Subject: Request for Time Off – [Your Full Name] (Next Week, [Date Range])​

Dear [Manager’s Name],​

I hope this email finds you well. I am writing to formally request time off from work next week to attend an important family event – specifically, from Monday, October 14th to  Friday, October 18th. This event has been planned in advance, and I have taken steps to ensure my responsibilities are fully covered during my absence to minimize any impact on the team’s workflow.​

To prepare for this time off:​
...(500 words detail)...

Thank you,
Sky


---

**Sample Output with prompt**:

Subject: Request for Time Off - March 15-17, 2024

Hi Sarah,

I hope this email finds you well. I would like to request time off from March 15th to March 17th for a family event.

I have ensured that all my current projects are on track and have coordinated with John to cover any urgent matters during my absence.

Thank you for considering my request. Please let me know if you need any additional information.

Best regards,
Alex


---

#### 1.5.2 Technical Project Manager

**Context**: First-principles analysis for IT/software projects with structured technical planning.

> **📖 Detailed Analysis**: See [2.2 Co-STAR Framework](#22-co-star-framework) for comprehensive breakdown of this prompt structure.


---

#### 1.5.2 Technical Project Manager - Sample

**Sample Input**:
```
We need to build a customer feedback system that collects reviews, analyzes sentiment, 
and generates reports for our e-commerce platform. The system should handle 10,000+ 
reviews per day and integrate with our existing CRM.
```
---
**Sample Output**:
```
1. **Task Summary:** Build a scalable customer feedback analysis system for e-commerce platform

2. **Core Problem / Goal:** Collect, process, and analyze customer reviews to generate actionable insights

3. **First Principles Breakdown:**
   - Data collection (reviews) → Processing (sentiment analysis) → Output (reports)
   - Scale requirement: 10,000+ reviews/day
   - Integration requirement: Existing CRM system

4. **Minimum Viable Components:**
   - Review collection API
   - Sentiment analysis engine
   - Report generation service
   - CRM integration layer

5. **Technical To-Do / Staged Plan:**
   - **Stage 1: Foundation** — API design, database schema, basic collection
   - **Stage 2: Processing** — Sentiment analysis integration, data pipeline
   - **Stage 3: Intelligence** — Report generation, CRM integration, monitoring

6. **Key Success Metrics:**
   - Processing capacity: 10,000+ reviews/day
   - Accuracy: 95%+ sentiment classification
   - Response time: <2 seconds for report generation
   - Uptime: 99.9% availability
```

---

#### 1.5.3 Daily Job Planner

**Context**: Intelligent daily scheduling that combines multiple input sources.

**Template**:
```markdown
## 🧠 Prompt:
You are a professional AI assistant that builds optimized daily job plans. The user may provide **any combination** of the following as input:
- A screenshot of a calendar  
- A screenshot of a to-do list  
- A written to-do list or notes of things they want to do  

Your job is to intelligently extract and combine all input information to create a **realistic, well-structured job schedule** for the day.

---

## 🕘 Constraints:
- **Working hours:** 09:00 – 18:00  
- **Lunch break:** 12:15 – 13:30 (leave this time free)  
- Do not double-book tasks over existing calendar events  
- Merge duplicate or overlapping tasks if needed  
- Prioritize urgent/time-sensitive items  
- Leave room for short breaks when possible

---

## 📋 Output Format:
Return the final daily plan in a clean, professional **table format** with these columns:

| 🕒 Time       | ✅ Task              | 📌 Notes (optional)     |
|--------------|---------------------|--------------------------|
```

---

#### 1.5.3 Daily Job Planner - Sample

**Sample Input**:
```
I have these tasks for today:
- Team meeting at 10:00 AM (already scheduled)
- Finish quarterly report
- Call client about project update
- Review code changes
- Prepare presentation for tomorrow

I also have a dentist appointment at 2:00 PM that I forgot to mention.
```
---

**Sample Output**:
```
| 🕒 Time       | ✅ Task              | 📌 Notes (optional)     |
|--------------|---------------------|--------------------------|
| 09:00-10:00  | Finish quarterly report | Priority task, quiet time |
| 10:00-11:00  | Team meeting        | Already scheduled        |
| 11:00-11:30  | Call client         | Project update discussion |
| 11:30-12:15  | Review code changes | Before lunch break       |
| 12:15-13:30  | Lunch break         | Free time                |
| 13:30-14:00  | Prepare presentation | Quick prep for tomorrow  |
| 14:00-15:00  | Dentist appointment | Already scheduled        |
| 15:00-16:00  | Continue quarterly report | Complete remaining sections |
| 16:00-17:00  | Final review        | Check all completed tasks |
| 17:00-18:00  | Buffer time         | Handle any urgent items  |
```

---

#### 1.5.4 Legal Counsel

**Context**: Hong Kong contract law analysis with structured risk assessment.

**Template**:
```markdown
**Role**: You are a senior legal counsel with expertise in Hong Kong contract law.

**Task**: Review the following sales contract clause, identify potential legal and commercial risks under Hong Kong law, and provide suggested revisions.

**Clause to Review**:
"Party B shall deliver the goods within 3 working days after receiving the payment. In case of delayed delivery, a penalty of 0.1% of the contract amount per day will be charged."

**Output Requirements**:

Identify and explain each potential risk point, considering enforceability under Hong Kong law

Provide references to relevant legal principles or case law where applicable (e.g., penalty vs. liquidated damages doctrine)

Draft a revised version of the clause to mitigate risk and improve enforceability

Format: Present your analysis in bullet points; use bold to highlight key legal issues or recommendations
```

---

#### 1.5.4 Legal Counsel - Sample

**Sample Input**:
```
Review this clause: "Party B shall deliver the goods within 3 working days after 
receiving the payment. In case of delayed delivery, a penalty of 0.1% of the contract 
amount per day will be charged."
```

---

**Sample Output**:

**Legal Risk Analysis:**

• **Penalty Clause Risk**: The 0.1% daily penalty may be deemed unenforceable under Hong Kong law as it could constitute a penalty rather than liquidated damages

• **Uncertainty in "Working Days"**: The term "working days" is ambiguous and may lead to disputes about calculation methods

• **No Force Majeure Protection**: The clause lacks protection for circumstances beyond Party B's control


---

**Legal References:**
• **Dunlop Pneumatic Tyre Co Ltd v New Garage & Motor Co Ltd [1915]**: Establishes the test for distinguishing penalties from liquidated damages
• **Hong Kong Contract Law**: Penalties are unenforceable if they are extravagant and unconscionable

**Revised Clause:**
"Party B shall deliver the goods within 3 business days (Monday to Friday, excluding public holidays) after receiving the payment. In case of delayed delivery due to Party B's fault, liquidated damages of 0.05% of the contract amount per day will be charged, subject to a maximum of 5% of the total contract value. This provision shall not apply in cases of force majeure or circumstances beyond Party B's reasonable control."


---

#### Chapter 1 Q&A Summary

**Q1**: What's the difference between prompt design and just typing random words?
**A**: Prompt design uses structures to help LLM focus and give less vague response.

**Q2**: Why does my AI sometimes give irrelevant answers?
**A**: Your prompt might be too vague. Be specific about what you want, who it's for, and how it should be formatted.

**Q3**: How can I make my prompts better without being an expert?
**A**: Use clear words, be specific, keep it short, avoid ambiguity, give helpful guidance, structure it well, and provide examples.

---



## 2. Templates

### Chapter Contents
- [2.1 Common Frameworks](#21-common-frameworks)
- [2.2 Co-STAR Framework](#22-co-star-framework)
- [2.3 Reference and Adapt Website Prompts](#23-reference-and-adapt-website-prompts)
- [2.4 Use LLM to Write Prompts](#24-use-llm-to-write-prompts)

---

#### 2.1 Common Frameworks

**Composite (simplified)**: Task + Background + Output

> **Note**: Not mandatory — clarity and accuracy trump everything. Think of essay structures (thesis + evidence + counter + conclusion).

---


#### 2.2 Co-STAR Framework

**International prompt-contest winner template**

Produce a detailed system prompt from a user's task/rough prompt, covering:
- Context
- Objective
- Style
- Tone
- Audience
- Response


---

#### 2.2.1 Role Definition Analysis

**Original Role Section**:
```markdown
**Role:**  
You are a **Technical Project Manager** and **System Thinker** trained in **first principles reasoning** (Elon Musk style).  
Your task is to analyze any IT or software-related project, strip it down to its essential truths, and rebuild it as an efficient, staged plan for engineers and developers.
```

**Key Elements**:
- **Identity**: Technical Project Manager + System Thinker
- **Expertise**: First principles reasoning (Elon Musk style)
- **Scope**: IT/software projects
- **Method**: Strip down → Rebuild
- **Output**: Staged plan for engineers and developers

---

#### 2.2.2 Instructions Structure Analysis

**Original Instructions**:
```markdown
### 🧭 Instructions:
1. **Read the given background or task.**  
   - If the goal, scope, or deliverables are **unclear**, ask up to **three short clarifying questions** before starting.  
   - Wait for confirmation before continuing.  
2. Once clear, **apply first principles reasoning** to identify what must exist for the solution to function.  
3. Define the **Minimum Viable Components (MVC)** — only the features or systems that deliver tangible technical value.  
4. Decompose the project into **technical tasks and stages** (e.g., architecture, backend, frontend, testing, deployment).  
5. Add **dependencies, risks, tools, and metrics** for each stage.  
6. Output the final result **as a numbered list** for a technical audience.
```

**Structure Breakdown**:
**Step 1**: Input validation + clarification protocol - **Step 2**: Core methodology 
**Step 3**: Essential components identification - **Step 4**: Project decomposition
**Step 5**: Risk and dependency analysis - **Step 6**: Output formatting specification

---

#### 2.2.3 Output Format Design Analysis

**Original Output Format**:
```markdown
### 🧩 Output Format (List):
1. **Task Summary:** (Short technical overview)  
2. **Core Problem / Goal:** (System-level goal or function)  
3. **First Principles Breakdown:** (Underlying truths, key constraints, or assumptions challenged)  
4. **Minimum Viable Components:** (Essential systems/modules/services required)  
5. **Technical To-Do / Staged Plan:**  
   - **Stage 1: [Name]** — Description, Core Tasks (bulleted), Dependencies, Risks  
   - **Stage 2: [Name]** — Description, Core Tasks (bulleted), Dependencies, Risks  
   - **Stage 3: [Name]** — Description, Core Tasks (bulleted), Dependencies, Risks  
6. **Key Success Metrics:** (Quantifiable indicators — performance, uptime, load, code coverage, etc.)
```

**Design Principles**:
- **Progressive Detail**: From overview to specific metrics
- **Structured Format**: Numbered list with clear sections
- **Actionable Output**: Each section serves a specific purpose
- **Technical Focus**: Metrics and dependencies for engineers

---

### 2.3 Reference and Adapt Website Prompts

Learn from existing prompts and adapt them for your specific needs.

**Popular Sources**:
- **GitHub**: [awesome-chatgpt-prompts](https://github.com/f/awesome-chatgpt-prompts) - 1000+ curated prompts
- **OpenAI Cookbook**: [Prompt Engineering Examples](https://cookbook.openai.com/) - Official examples
- **Jimeng**: [AI Tool Home](https://jimeng.jianying.com/ai-tool/home) - Image generation platform


**Example  (live demo)**

---

### 2.4 Use LLM to Write Prompts (live demo)

#### Examples:

- business email writer
- todos extracter

---

#### Chapter 2 Q&A Summary

**Q1**: Where can I play around with prompts?
**A**: Connect ChatGPT with VPai, login with the team's account.

**Q2**: How to cook my own prompt?
**A**: Ask LLM to update my prompt by Co-STAR format.

**Q3**: I'm stuck writing prompts. Where can I find examples to copy?
**A**: Check GitHub repositories, OpenAI Cookbook, AI tool websites, and community forums for ready-made prompts you can adapt.

---

## 3. Data Security & Privacy

### Chapter Contents
- [Security Risk Areas](#security-risk-areas)

---

### Security Risk Areas

| Risk Area | Description | Solutions |
|-----------|-------------|-----------|
| **Input** | Users may share Personal information, financial, or confidential data — be cautious | • Minimize data<br>• Filter inappropriate content |
| **Output** | LLMs can leak internal patterns; filter outputs to avoid sensitive disclosures | • Post-generation filters<br>• Human review for critical use |
---
| Risk Area | Description | Solutions |
|-----------|-------------|-----------|
| **Abuse** | Models can be misused; enforce limits/monitoring (e.g., no investment advice in support workflows) | • Rate limits/quotas<br>• Behavior monitoring<br>• Prompt-level guardrails |
| **Access Control** | Restrict who/what can access models and interfaces | • MFA (Multi-Factor Authentication)<br>• Periodic audits/log reviews |
| **Storage** | Sensitive data at rest | • Encrypt<br>• Least-privilege access<br>• Prefer internal models for sensitive scenarios |

---

#### Chapter 3 Q&A Summary

**Q**: How to avoid leaking sensitive data?
**A**: Be cautious when uploading sensitive files to public AIs.


---

## 4. Resources

### Chapter Contents
- [4.1 One For All](#41-one-for-all)
- [4.2 Current Prompt Generation Resources](#42-current-prompt-generation-resources)
- [4.3 Image & Video Generation](#43-image--video-generation)
- [4.4 Helpful Internal Tools](#44-helpful-internal-tools)
- [4.5 Other Services](#45-other-services)
- [4.6 Learning Resources](#46-learning-resources)

---

### 4.1 One For All

| Service | Model | Website | Access | Notes |
|---------|-------|---------|--------|-------|
| **OpenAI** | ChatGPT | [url](https://chat.openai.com) | Free/Paid | ✅ VPai |
| **Doubao** | Doubao Chat | [url](https://www.doubao.com) | Free | ✅ Available |
| **Moonshot** | Kimi Chat | [url](https://kimi.moonshot.cn) | Free | ✅ Available |
| **Perplexity** | Perplexity Pro | [url](https://perplexity.ai) | Free/Paid | 💡 [PayPal subscription](https://www.perplexity.ai/join/p/paypal-subscription) gives 1 year membership |

---

### 4.2 Current Prompt Generation Resources

| Service | Type | Website | Access | Notes |
|---------|------|---------|--------|-------|
| **Prompt Pilot** | Prompt engineering tool | [url](https://promptpilot.volcengine.com/home) | Internal | • AI-powered prompt generation<br>• Template library |
| **Kimi Prompt Expert** | Prompt expert assistant | [url](https://www.kimi.com/kimiplus/conpg00t7lagbbsfqkq0) | Free | • AI prompt design assistant<br>• Zero-threshold prompt mastery |
| **Prompt Engineer - GPTs** | GPT-based prompt tool | OpenAI GPTs | Paid | • GPT-powered prompt engineering<br>• Advanced prompt optimization |

---

### 4.3 Image & Video Generation

| Service | Type | Website | Access | Notes |
|---------|------|---------|--------|-------|
| **Jimeng** | Image generation | [url](https://jimeng.jianying.com/ai-tool/home) | Daily Credit | • AI image & video creation<br>• Multiple styles |
| **Runway ML** | Video generation | [url](https://runwayml.com) | Daily Credit | • AI video creation<br>• Text-to-video |
| **Leonardo AI** | Image generation | [url](https://leonardo.ai) | Daily Credit | • High-quality images<br>• Multiple models |

---

### 4.4 Helpful Internal Tools

| Service | Type | Website | Notes |
|---------|------|--------|-------|
| **VPai** | Internal AI platform | [url](https://ai-vista-launchpad-magic.vercel.app) | • Internal entry for GPT and Gemini models |
| **Internal N8N** | Workflow automation | [url](https://10.1.9.133/home/workflows) | • Internal workflow automation platform |
| **Current AI Subscription Accounts** | Internal AI subscription account lists | [url](https://xcn0uugwk9vs.feishu.cn/wiki/RhSEwufftiyS1zklu6jcyRrAnwg?from=from_copylink) | Account: it.subscribe.vp@gmail.com<br>Password: Vp12345! |

---

### 4.5 Other Services

| Service | Type | Website | Access | Notes |
|---------|------|---------|--------|-------|
| **Kimi Slides** | PPT generation | [url](https://www.kimi.com/kimiplus/slides) | Free | • Text to slides in minutes |
| **OpenRouter** | Model router | [url](https://openrouter.ai) | Free access to multiple models | • Access multiple models |
| **Cursor** | AI editor | [url](https://cursor.sh) | Free tier | • AI-powered editor<br>• Chat with code |
---
| Service | Type | Website | Access | Notes |
|---------|------|---------|--------|-------|
| **IMA** | Knowledge base | [url](https://ima.ai) | Free | • AI knowledge management<br>• Document processing |
| **Tavily** | Search API | [url](https://tavily.com) | Free tier | • AI-powered search<br>• Real-time information |
| **Jina** | AI platform | [url](https://jina.ai) | Free tier | • Document processing<br>• Multimodal AI |
| **Ollama** | Local models | [url](https://ollama.ai) | Free | • Run models locally<br>• Privacy-focused |


---

### 4.6 Learning Resources

### Official Documentation
- **OpenAI Best Practices**: https://platform.openai.com/docs/guides/gpt-best-practices
- **Prompt Engineering Guide**: https://www.promptingguide.ai/zh

### Courses
- **Andrew Ng Course**: https://www.deeplearning.ai/short-courses/chatgpt-prompt-engineering-for-developers

### Good Prompt Samples
- **Awesome Prompts**: https://github.com/ai-boost/awesome-prompts - Curated list of chatgpt prompts from top-rated GPTs in the GPTs Store

---
## 5. Key Takeaways

### Chapter Contents
- [Summary Points](#summary-points)

---

### Summary Points

1. ✅ **Prompts are engineering, not magic** - they require iteration and testing
2. ✅ **Structure matters** - use Co-STAR framework
3. ✅ **Context is critical** - provide background, role, examples
4. ✅ **Security first** - protect PII, filter outputs, control access
5. ✅ **Free resources abound** - leverage Doubao, Moonshot, OpenRouter for cost-effective solutions

---


#### Q&As

---

*Thanks for listening*