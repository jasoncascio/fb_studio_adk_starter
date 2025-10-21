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
