# Nexus API Check

Tests the API functionality of a Sonatype Nexus server.


**CAUTION** These are *functional* tests which means they will be making actual changes to your Nexus server. The tests are designed to be sandboxed within their own repo and use UUIDs in order to reduce the chance of collisions with actual content, but it is **highly** recommended that you have a backup before running these!


## Nexus Versions Supported
Title | Value
---|---
**Version** | `3.24.0-02`
**Edition** | `PRO`
**Build Revision** | `302d6f23f1414581162efaf0fa7b4d81dbf9b251`
**Build Timestamp** | `2020-06-03-2332-51567`


## Setup
`script/setup`


## Running the Tests
`script/test`
