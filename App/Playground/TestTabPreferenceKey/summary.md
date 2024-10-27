Several Attempts were made to make a easy to make an easy to work with TabView using PreferenceKey


1. At first, unselected view will be rendered as `Color.clear.frame(height: 0, width: 0)` However, this approach causes NavigationTitle to behavior abnormally.

Therefore serverl attemps were made to go after conditional rendering.

2. However, content of TabView has to be placed into the View Hierarchy in order for `.preference()` to run. only the init function will be called. This made conditional rendering impossible as we have to render all views in the first place.

