# Nexus API Check

Tests the API functionality of a Sonatype Nexus server.


**CAUTION!** These are *functional* tests which means they will be making *actual changes* to your Nexus server. The tests are designed to be sandboxed within their own repositories and use UUIDs in order to reduce the chance of collisions with actual content, but it is **highly** recommended that you have a backup before running these!

If you'd like to take extra care, you can create a separate blob store specifically for testing and change the `DEFAULT_BLOBSTORE_NAME` in all the creation scripts within `spec/repo_scripts/`.


## Nexus Versions Supported
Title | Value
---|---
**Version** | `3.18.1-01`
**Edition** | `PRO`
**Build Revision** | `72e5414c4f3fb232e32cbfc9fca740111c94d07f`
**Build Timestamp** | `2019-08-06-1749-11540`


## Setup
`script/setup`


## Running the Tests
`script/test`
