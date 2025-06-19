# 📍 Flutter Map Assignment – Polylines & Accuracy Circles

Assigned Tasks :
- Drawing **polylines** between coordinates
- Drawing **accuracy circles** around each point
- Rendering everything **within 1 second** of data load

---

## 📦 Features

- ✅ JSON parsed to Model
- ✅ Connected all polyline
- ✅ Accuracy-based circles at each point
- ✅ Marked the **start** and **end** locations with icons
- ✅ Build time measured and displayed in milliseconds
- ✅ Uses `flutter_map` (OpenStreetMap)

---

## 📂 Folder Structure
assets > json > myHisaab-May 13 2025.json - (for json file)
lib - entire code
lib > controllers > map_provider.dart - (for manage state)
lib > models > map_point_model.dart - (making easy to use json feilds)
lib > screens > map_screen.dart - Map UI
lib > main.dart (code start from here)

Polyline	     -   Connecting all points
Accuracy Circles -	 Radius based on accuracy in meters
Start Marker	 -   Green flag icon
End Marker	     -   Red flag icon


The JSON data is parsed and rendered to the map within 1 second
A Stopwatch is used to measure actual load time
Displayed on screen like:
Map built in 181 ms
![Map Screenshot](https://drive.google.com/file/d/1rLwhsvy8OEfIxTvqfPIkKkmDfMsWLNls/view?usp=sharing)

