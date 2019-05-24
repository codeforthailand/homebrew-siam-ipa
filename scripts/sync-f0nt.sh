#!/bin/bash

OUTPUT="./data/f0nt.csv"
SHEET_ID="1RWFD0wnx_m7IqUQ3KFfTtztXdsG3q0Fhnz7LN7A31rc"
URL="https://docs.google.com/spreadsheets/d/$SHEET_ID/export?exportFormat=csv"

curl -L $URL -o $OUTPUT