#!/usr/bin/env python3
import requests
import sys
import matplotlib.pyplot as plt

STATES = ["AL", "AK", "AZ", "AR", "CA", "CO", "CT",
"DE", "FL", "GA", "HI", "ID", "IL",
"IN", "IA", "KS", "KY", "LA", "ME", "MD",
"MA", "MI", "MN", "MS", "MO", "MT",
"NE", "NV", "NH", "NJ", "NM", "NY", "NC",
"ND", "OH", "OK", "OR", "PA", "RI",
"SC", "SD", "TN", "TX", "UT", "VT", "VA",
"WA", "WV", "WI", "WY"]

KEYFILE = "key.txt"

for arg in sys.argv[1:]:
    if arg not in STATES:
        sys.exit(f"Error: {arg} is not a valid input.")

state = sys.argv[1].upper()

def get(url, key):
    headers = {"X-API-KEY": key}
    url = "https://api.propublica.org/congress/v1" + url
    print(f"Querying {url}...")
    data = requests.get(url, headers=headers).json()
    return data['results']

def read_keyfile(path):
    with open(path) as handle:
        key = handle.read().strip
    return key

class Member:
    def __init__(self, state, **kwargs):
        self.state = state
        state_input = {}
        for state in sys.argv[1]:
            state_input[state] = []
            print (state_input)

all_members = []

def average_partisanship(members, state):
    avg_pscore = sum(all_members)/len(all_members)

if __name__ == "__main__":
    key = read_keyfile(KEYFILE)
    for session in range (111,117):
        url = f"/{session}/senate/members.json"
    results = get(url, key)

for member in (results[0]['members']):
    all_members.append(member['votes_with_party_pct'])
    print(all_members)

plt.plot(session, avg_pscore)
plt.ylabel('percentages')
plt.xlabel('range of sessions')
plt.suptitle('Years over Partisanhip Scores')
plt.show()