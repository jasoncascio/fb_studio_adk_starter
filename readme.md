# Python ADK Environment Starter for Firebase Studio

This is a starter template for a Python environment suitable for developing ADK applications within Firebase Studio.

To instantiate this environment, use the following link:

https://idx.google.com/new?template=https://github.com/jasoncascio/fb_studio_adk_starter


Be sure to go to edit .idx/dev.nix to add in your project_id and location:
  env = {
    GOOGLE_GENAI_USE_VERTEXAI = "TRUE";
    GOOGLE_CLOUD_PROJECT = "<your project id>";
    GOOGLE_CLOUD_LOCATION = "<your region>";
  };


In the terminal type start_dev to start the server with hot reload
The terminal will provide to you the appropriate URL for testing e.g.
Just click the link
+-----------------------------------------------------------------------------+
| ADK Web Server started                                                      |
|                                                                             |
| For local testing, access at http://127.0.0.1:8000.                         |
+-----------------------------------------------------------------------------+

IMPORTANT: In a fresh restart of the server, when you first interact with the agent, you will be asked to select which project you want to use.