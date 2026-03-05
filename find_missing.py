import re
from collections import Counter

def clean(s):
    return re.sub(r'[^a-z0-9]', '', s.lower())

def load(path):
    data = []
    with open(path, 'r') as f:
        for line in f:
            if '|' in line:
                email, name = line.strip().split('|', 1)
                data.append({'name': name, 'email': email, 'clean': clean(name)})
    return data

local = load('local_normalized.txt')
prod = load('production_normalized.txt')

local_counts = Counter(x['clean'] for x in local)
prod_counts = Counter(x['clean'] for x in prod)

all_cleans = set(local_counts.keys()) | set(prod_counts.keys())

print(f"Total local: {len(local)}")
print(f"Total prod: {len(prod)}")

print("\n--- Count Discrepancies ---")
for c in sorted(all_cleans):
    l_cnt = local_counts.get(c, 0)
    p_cnt = prod_counts.get(c, 0)
    if l_cnt != p_cnt:
        print(f"{c}: Local={l_cnt}, Prod={p_cnt}")
        print("  Local records:")
        for x in local:
            if x['clean'] == c:
                print(f"    - {x['name']} ({x['email']})")
        print("  Prod records:")
        for x in prod:
            if x['clean'] == c:
                print(f"    - {x['name']} ({x['email']})")
