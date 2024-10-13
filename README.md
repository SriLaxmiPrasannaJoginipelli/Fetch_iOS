**FETCH iOS App**

__Overview:__

This is a native iOS application developed using Swift and SwiftUI. The app fetches data from a remote API, processes the data, and displays it in a structured format. The data is grouped by listId and sorted by id first, and by name within each listId group. The project is designed as a take-home assignment for a mobile software engineering internship.

__Features:__

Fetches data from the provided API.
Filters out any items where the name is empty or nil.
Groups the items by listId.
Sorts the items first by id and then by name within each listId group.
Displays the grouped and sorted items in a list with section headers for each listId.
Technologies Used
Language: Swift
Framework: SwiftUI
Networking: URLSession
JSON Decoding: Codable
State Management: @State in SwiftUI
Deployment Target: iOS 17.0 (or latest stable release)
API Endpoint

__Data is retrieved from this API:__

https://fetch-hiring.s3.amazonaws.com/hiring.json

__The API returns a list of items in JSON format, each item containing:__

id: The unique identifier for the item.
listId: The group identifier for the item.
name: The name of the item (can be nil or an empty string, which are filtered out in the app).
