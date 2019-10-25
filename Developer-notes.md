# Build process

Our websocket API is defined as a set of schema files.

We have a 2-stage `build.yaml` sequence which does the following:

- takes the original websocket `.json` send/receive file, and creates request/response Dart classes
- applies `json_serializable` on those request/response classes to set up JSON serialisation

We also apply JSON schema validation when making requests and checking responses, this is intended
to flag cases where the API doesn't match what our precompiled classes expect.
