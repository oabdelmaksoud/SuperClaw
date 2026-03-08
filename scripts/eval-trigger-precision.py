#!/usr/bin/env python3
import json, pathlib, re
root = pathlib.Path(__file__).resolve().parents[1]
skills = root / "skills"
corpus = json.loads((root / "tests/prompt-corpus/realistic-prompts.json").read_text())

def desc(skill):
    t=(skills/skill/"SKILL.md").read_text()
    m=re.search(r'description:\s*"([\s\S]*?)"', t)
    return (m.group(1).lower() if m else "")

# naive lexical matcher over descriptions (proxy metric)
skill_desc={d.name:desc(d.name) for d in skills.iterdir() if d.is_dir()}
correct=0
rows=[]
for s in corpus["samples"]:
    p=s["prompt"].lower(); exp=s["expected"]
    best=None;score=-1
    toks=[w for w in re.findall(r'[a-z0-9\-]+',p) if len(w)>2]
    for k,v in skill_desc.items():
        sc=sum(1 for t in toks if t in v)
        if sc>score:
            score=sc;best=k
    ok=(best==exp)
    correct += 1 if ok else 0
    rows.append((s['prompt'],exp,best,ok,score))

rate = round((correct/len(rows))*100,1)
out=["# TRIGGER_PRECISION_RESULTS","",f"- Samples: {len(rows)}",f"- Exact-match proxy accuracy: {rate}%",""]
out.append("| Prompt | Expected | Predicted | Match | Score |")
out.append("|---|---|---|---|---|")
for r in rows:
    out.append(f"| {r[0]} | `{r[1]}` | `{r[2]}` | {'✅' if r[3] else '❌'} | {r[4]} |")
(root/"TRIGGER_PRECISION_RESULTS.md").write_text("\n".join(out)+"\n")
print(f"accuracy={rate}%")
