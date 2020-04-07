# Project SVUCE

This is the flutter project of the SVUCE College App. The SVU College App is the bridge between student and college. It is the one stop solution for all the queries beyond and above.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Folder structure

`lib` : This is where overall logic of the application lies.

`lib\models` : The Entire Data Models of the application stays here.

`lib\services` : The Services of the app such as notification_service lies here.

`lib\constants` : The constants such as route paths and api keys that lies

`lib\managers` : The Managers will be the link between the Services and the UI. 

`lib\ui` : The Overall User Interface required for the application lies here.

`lib\ui\shared` : The Shared Widgets are like helpers that used mostly.

`lib\ui\views` : The Views are the stateless widgets that has a Provider and Consumer as it's root widgets and calls required functions on it's model

`lib\ui\widgets` : The Overall Custom Widgets that are used through out the app lies here.

`lib\viewmodels` : The ViewModels are the classes extending ChangeNotifier that lies here.

## Coding Guidelines

1. Try to reduce the widget tree, in the long run it might help us a lot
2. When it comes to package version, make sure you use the correct package.
3. Try to seperate the UI from logic.
4. Improve Documentation, this really helps to understand code.
5. When it comes to naming convention, maintain similarity and stability through out the app.
6. If your dart file has more than two widgets try to create sepearate file.
7. When it comes to scale our application, try using `provider` or something similar to that.
8. Know well about advanced concepts in flutter and try to use them properly.

## Steps to contribute:
1. Clone it :busts_in_silhouette: <br/>
`git clone https://github.com/algokun/ProjectSVUCE.git`
2. Create a new branch :bangbang: <br/>
`git checkout -b newbranch`
3. Do the needful changes to solve the issue. <br/>
4. Commit the changes and dont forget to use emoji :dizzy: <br/>
`git commit -m ":cloud: added cloud" `
5. Now, Push your awesome work to your remote repository using :pushpin: <br/>
`git push -u origin newbranch`
